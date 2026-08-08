<?php
if (!defined('NV_MAINFILE')) die('Stop!!!');

if (!nv_function_exists('nv_block_students')) {

    function nv_block_config_students($module, $data_block, $lang_block) {
        global $db, $site_mods;

        $html = '';
        $students_catid = isset($data_block['students_catid']) ? (int)$data_block['students_catid'] : 0;
        $numrow = isset($data_block['numrow']) ? (int)$data_block['numrow'] : 4;

        $html .= '<tr><td>Chọn Chuyên mục</td><td><select name="config_students_catid" class="form-control">';
        $html .= '<option value="0">-- Tự động tìm chuyên mục Gương mặt / Sinh viên --</option>';

        if (isset($site_mods['news'])) {
            try {
                $sql = "SELECT catid, title FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat ORDER BY catid ASC";
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $catid = (int)$row['catid'];
                    $sel = ($students_catid == $catid) ? ' selected="selected"' : '';
                    $html .= '<option value="' . $catid . '"' . $sel . '>' . nv_htmlspecialchars($row['title']) . '</option>';
                }
            } catch (Exception $e) {}
        }

        $html .= '</select></td></tr>';
        $html .= '<tr><td>Số bài hiển thị</td><td><input type="number" name="config_numrow" value="' . $numrow . '" class="form-control" min="1" max="12"/></td></tr>';
        return $html;
    }

    function nv_block_config_students_submit($module, $lang_block) {
        global $nv_Request;

        $return = array();
        $return['error'] = array();
        $return['config']['students_catid'] = $nv_Request->get_int('config_students_catid', 'post', 0);
        $return['config']['numrow'] = $nv_Request->get_int('config_numrow', 'post', 4);
        return $return;
    }

    function nv_block_students($block_config) {
        global $global_config, $db, $site_mods;

        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.students.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.students.tpl')) {
                return 'Không tìm thấy file giao diện global.students.tpl';
            }
        }

        $xtpl = new XTemplate('global.students.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);

        $module_name = 'news';
        $numrow = isset($block_config['numrow']) ? (int)$block_config['numrow'] : 4;
        if ($numrow <= 0) $numrow = 4;

        $count = 0;

        if (isset($site_mods[$module_name])) {
            $where = "status=1";
            $catid = isset($block_config['students_catid']) ? (int)$block_config['students_catid'] : 0;

            // Smart auto-detection if no specific category is selected
            if ($catid <= 0) {
                try {
                    $sql_cat = "SELECT catid FROM " . NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_cat WHERE alias LIKE '%sinh-vien%' OR alias LIKE '%guong-mat%' OR title LIKE '%sinh viên%' OR title LIKE '%gương mặt%' LIMIT 1";
                    $result_cat = $db->query($sql_cat);
                    if ($row_cat = $result_cat->fetch()) {
                        $catid = (int)$row_cat['catid'];
                    }
                } catch (Exception $e) {}
            }

            if ($catid > 0) {
                $where .= " AND (catid=" . $catid . " OR FIND_IN_SET(" . $catid . ", listcatid))";
            }

            $sql = "SELECT id, catid, title, alias, publtime, hometext, homeimgfile, homeimgthumb FROM " . NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_rows WHERE " . $where . " ORDER BY publtime DESC LIMIT " . $numrow;

            try {
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                    if (function_exists('nv_url_rewrite')) {
                        $link = nv_url_rewrite($link, true);
                    }

                    $row['link'] = $link;
                    $row['year'] = !empty($row['publtime']) ? date('Y', $row['publtime']) : date('Y');

                    if (!empty($row['homeimgfile'])) {
                        $row['thumb'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
                    } elseif (!empty($row['homeimgthumb']) && $row['homeimgthumb'] != 1) {
                        $row['thumb'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgthumb'];
                    } else {
                        $row['thumb'] = NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg';
                    }

                    $xtpl->assign('ROW', $row);
                    $xtpl->parse('main.loop');
                    $count++;
                }
            } catch (Exception $e) {}
        }

        // Fallback placeholder data if DB has no articles yet
        if ($count == 0) {
            $xtpl->parse('main.nodata');
        }

        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_students($block_config);
}
