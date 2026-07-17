<?php
if (!defined('NV_MAINFILE')) die('Stop!!!');

if (!nv_function_exists('nv_block_hoatdong')) {
    function nv_block_config_hoatdong($module, $data_block, $lang_block) {
        global $db, $site_mods;

        $html = '';
        $hoatdong_catid = isset($data_block['hoatdong_catid']) ? (int)$data_block['hoatdong_catid'] : 0;

        $html .= '<tr><td>Chọn Chuyên mục</td><td><select name="config_hoatdong_catid" class="form-control">';
        $html .= '<option value="0">-- Tự động tìm chuyên mục hoạt động --</option>';

        if (isset($site_mods['news'])) {
            try {
                $sql = "SELECT catid, title FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat ORDER BY catid ASC";
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $catid = (int)$row['catid'];
                    $sel = ($hoatdong_catid == $catid) ? ' selected="selected"' : '';
                    $html .= '<option value="' . $catid . '"' . $sel . '>' . nv_htmlspecialchars($row['title']) . '</option>';
                }
            } catch (Exception $e) {
                // Bỏ qua lỗi truy vấn để form cấu hình block vẫn mở được.
            }
        }

        $html .= '</select></td></tr>';
        return $html;
    }
    
    function nv_block_config_hoatdong_submit($module, $lang_block) {
        global $nv_Request;

        $return = array();
        $return['error'] = array();
        $return['config']['hoatdong_catid'] = $nv_Request->get_int('config_hoatdong_catid', 'post', 0);
        return $return;
    }

    function nv_block_hoatdong($block_config) {
        global $global_config, $db, $module_info, $site_mods;
        
        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.hoatdong.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.hoatdong.tpl')) {
                return 'Không tìm thấy file giao diện global.hoatdong.tpl';
            }
        }
        
        $xtpl = new XTemplate('global.hoatdong.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        
        $module_name = 'news'; // Default to news module for activities
        $category_link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA;
        
        if (isset($site_mods[$module_name])) {
            $where = "status=1";
            
            $ts_catid = isset($block_config['hoatdong_catid']) ? (int)$block_config['hoatdong_catid'] : 0;
            $ts_alias = '';
            if ($ts_catid <= 0) {
                try {
                    $sql_cat = "SELECT catid, alias FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat WHERE alias LIKE '%hoat-dong%' OR title LIKE '%hoạt động%' LIMIT 1";
                    $result_cat = $db->query($sql_cat);
                    if ($row_cat = $result_cat->fetch()) {
                        $ts_catid = (int)$row_cat['catid'];
                        $ts_alias = $row_cat['alias'];
                    }
                } catch (Exception $e) {}
            } else {
                try {
                    $sql_cat = "SELECT alias FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat WHERE catid=" . $ts_catid . " LIMIT 1";
                    $result_cat = $db->query($sql_cat);
                    if ($row_cat = $result_cat->fetch()) {
                        $ts_alias = $row_cat['alias'];
                    }
                } catch (Exception $e) {}
            }
            
            if ($ts_catid > 0) {
                $where .= " AND (catid=" . $ts_catid . " OR FIND_IN_SET(" . $ts_catid . ", listcatid))";
            }
            $category_link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name;
            if (!empty($ts_alias)) {
                $category_link .= '&amp;' . NV_OP_VARIABLE . '=' . $ts_alias;
            }
            if (function_exists('nv_url_rewrite')) {
                $category_link = nv_url_rewrite($category_link, true);
            }
            
            $sql = "SELECT id, catid, title, alias, publtime, hometext, homeimgfile, homeimgalt FROM " . NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_rows WHERE " . $where . " ORDER BY publtime DESC LIMIT 1";
            try {
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                    if (function_exists('nv_url_rewrite')) {
                        $link = nv_url_rewrite($link, true);
                    }
                    
                    $row['link'] = $link;
                    $row['hometext_clean'] = nv_clean60(strip_tags($row['hometext']), 150);
                    $row['publtime_format'] = date('d/m/Y', $row['publtime']);
                    
                    // Image logic
                    if (!empty($row['homeimgfile'])) {
                        $row['thumb'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
                    } else {
                        $row['thumb'] = NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg';
                    }
                    
                    $xtpl->assign('ROW', $row);
                    $xtpl->parse('main.loop');
                }
            } catch (Exception $e) {}
        }
        $xtpl->assign('CATEGORY_LINK', $category_link);
        
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_hoatdong($block_config);
}
