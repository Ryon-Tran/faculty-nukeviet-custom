<?php
if (!defined('NV_MAINFILE')) die('Stop!!!');

if (!nv_function_exists('nv_block_thongbao')) {
    
    function nv_block_config_thongbao($module, $data_block, $lang_block)
    {
        global $db, $site_mods;
        $html = '';
        $tb_catid = isset($data_block['tb_catid']) ? (int)$data_block['tb_catid'] : 0;
        $numrow = isset($data_block['numrow']) ? (int)$data_block['numrow'] : 10;
        
        $html .= '<tr><td>Chọn Chuyên mục chính</td><td><select name="config_tb_catid" class="form-control">';
        $html .= '<option value="0">-- Tất cả chuyên mục (Tự động tìm Thông báo) --</option>';
        
        if (isset($site_mods['news'])) {
            try {
                $sql = "SELECT catid, title FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat ORDER BY catid ASC";
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $catid = (int)$row['catid'];
                    $sel = ($tb_catid == $catid) ? ' selected="selected"' : '';
                    $html .= '<option value="' . $catid . '"' . $sel . '>' . nv_htmlspecialchars($row['title']) . '</option>';
                }
            } catch (Exception $e) {}
        }
        $html .= '</select></td></tr>';

        $html .= '<tr><td>Số tin hiển thị</td><td><input type="number" name="config_numrow" value="' . $numrow . '" class="form-control" min="1" max="50"/></td></tr>';
        
        return $html;
    }
    
    function nv_block_config_thongbao_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config']['tb_catid'] = $nv_Request->get_int('config_tb_catid', 'post', 0);
        $return['config']['numrow'] = $nv_Request->get_int('config_numrow', 'post', 10);
        return $return;
    }

    function nv_block_thongbao($block_config) {
        global $global_config, $db, $site_mods;
        
        $module_name = 'news';
        if (!isset($site_mods[$module_name])) {
            return '';
        }

        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.thongbao.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.thongbao.tpl')) {
                return 'Không tìm thấy file giao diện global.thongbao.tpl';
            }
        }
        
        $xtpl = new XTemplate('global.thongbao.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        $xtpl->assign('TEMPLATE', $block_theme);

        $tb_catid = isset($block_config['tb_catid']) ? (int)$block_config['tb_catid'] : 0;
        $numrow = isset($block_config['numrow']) && (int)$block_config['numrow'] > 0 ? (int)$block_config['numrow'] : 10;
        $mod_data = $site_mods[$module_name]['module_data'];

        // Dò chuyên mục Thông báo nếu chưa chọn
        if ($tb_catid <= 0) {
            try {
                $sql_find = "SELECT catid FROM " . NV_PREFIXLANG . "_" . $mod_data . "_cat WHERE alias LIKE '%thong-bao%' OR title LIKE '%thông báo%' LIMIT 1";
                $res_find = $db->query($sql_find);
                if ($r_find = $res_find->fetch()) {
                    $tb_catid = (int)$r_find['catid'];
                }
            } catch (Exception $e) {}
        }

        // Lấy tất cả chuyên mục để map tiêu đề chuyên mục
        $all_cats = array();
        try {
            $sql_all = "SELECT catid, title, alias, parentid FROM " . NV_PREFIXLANG . "_" . $mod_data . "_cat ORDER BY catid ASC";
            $res_all = $db->query($sql_all);
            while ($c = $res_all->fetch()) {
                $all_cats[$c['catid']] = $c;
            }
        } catch (Exception $e) {}

        // Tải các tab lọc chuyên mục
        $filter_cat_ids = array();
        if ($tb_catid > 0) {
            foreach ($all_cats as $cid => $cdata) {
                if ($cid == $tb_catid || $cdata['parentid'] == $tb_catid) {
                    $filter_cat_ids[] = $cid;
                    $xtpl->assign('CAT', array(
                        'catid' => $cid,
                        'title' => nv_htmlspecialchars($cdata['title'])
                    ));
                    $xtpl->parse('main.cat_tab');
                }
            }
        } else {
            foreach ($all_cats as $cid => $cdata) {
                if ($cdata['parentid'] == 0) {
                    $filter_cat_ids[] = $cid;
                    $xtpl->assign('CAT', array(
                        'catid' => $cid,
                        'title' => nv_htmlspecialchars($cdata['title'])
                    ));
                    $xtpl->parse('main.cat_tab');
                }
            }
        }

        // Tạo câu truy vấn danh sách bài viết
        $where = "status=1";
        if (!empty($filter_cat_ids)) {
            $where .= " AND (catid IN (" . implode(',', $filter_cat_ids) . ")";
            foreach ($filter_cat_ids as $fcid) {
                $where .= " OR FIND_IN_SET(" . $fcid . ", listcatid)";
            }
            $where .= ")";
        }

        $sql = "SELECT id, catid, listcatid, title, alias, publtime, hometext, homeimgfile, homeimgalt FROM " . NV_PREFIXLANG . "_" . $mod_data . "_rows WHERE " . $where . " ORDER BY publtime DESC LIMIT " . $numrow;

        try {
            $result = $db->query($sql);
            while ($row = $result->fetch()) {
                $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                if (function_exists('nv_url_rewrite')) {
                    $link = nv_url_rewrite($link, true);
                }

                $imgurl = '';
                if (!empty($row['homeimgfile'])) {
                    if (strpos($row['homeimgfile'], 'http://') === 0 || strpos($row['homeimgfile'], 'https://') === 0) {
                        $imgurl = $row['homeimgfile'];
                    } elseif (file_exists(NV_ROOTDIR . '/' . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'])) {
                        $imgurl = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
                    } elseif (file_exists(NV_ROOTDIR . '/' . $row['homeimgfile'])) {
                        $imgurl = NV_BASE_SITEURL . $row['homeimgfile'];
                    } else {
                        $imgurl = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
                    }
                } else {
                    $imgurl = NV_STATIC_URL . 'themes/' . $block_theme . '/images/no_image.gif';
                }

                $cattitle = isset($all_cats[$row['catid']]) ? $all_cats[$row['catid']]['title'] : '';
                $all_catids = !empty($row['listcatid']) ? $row['listcatid'] : $row['catid'];

                $xtpl->assign('CONTENT', array(
                    'id' => $row['id'],
                    'title' => nv_htmlspecialchars($row['title']),
                    'link' => $link,
                    'imgurl' => $imgurl,
                    'cattitle' => nv_htmlspecialchars($cattitle),
                    'all_catids' => $all_catids,
                    'publtime' => date('d/m/Y', $row['publtime'])
                ));
                $xtpl->parse('main.loop');
            }
        } catch (Exception $e) {}

        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_thongbao($block_config);
}
