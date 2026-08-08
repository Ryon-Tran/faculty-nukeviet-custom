<?php

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (!nv_function_exists('nv_block_videos')) {

    function nv_block_config_videos($module, $data_block, $lang_block) {
        global $db, $site_mods;
        $html = '';
        $mod_name = isset($data_block['mod_name']) ? $data_block['mod_name'] : 'news';
        $catid = isset($data_block['catid']) ? (int)$data_block['catid'] : 0;
        $numrow = isset($data_block['numrow']) ? (int)$data_block['numrow'] : 4;

        $html .= '<tr><td>Chọn Module lấy Video</td><td><select name="config_mod_name" class="form-control">';
        foreach ($site_mods as $mod => $mod_info) {
            $sel = ($mod == $mod_name) ? ' selected="selected"' : '';
            $html .= '<option value="' . $mod . '"' . $sel . '>' . $mod_info['custom_title'] . ' (' . $mod . ')</option>';
        }
        $html .= '</select></td></tr>';

        $html .= '<tr><td>Chọn Chuyên mục (Nếu lấy từ News)</td><td><select name="config_catid" class="form-control">';
        $html .= '<option value="0">-- Tự động lọc chuyên mục Video / Media --</option>';

        if (isset($site_mods['news'])) {
            try {
                $sql = "SELECT catid, title FROM " . NV_PREFIXLANG . "_" . $site_mods['news']['module_data'] . "_cat ORDER BY catid ASC";
                $result = $db->query($sql);
                while ($row = $result->fetch()) {
                    $c_id = (int)$row['catid'];
                    $sel = ($catid == $c_id) ? ' selected="selected"' : '';
                    $html .= '<option value="' . $c_id . '"' . $sel . '>' . nv_htmlspecialchars($row['title']) . '</option>';
                }
            } catch (Exception $e) {}
        }
        $html .= '</select></td></tr>';

        $html .= '<tr><td>Số video hiển thị</td><td><input type="number" name="config_numrow" value="' . $numrow . '" class="form-control" min="1" max="10"/></td></tr>';
        return $html;
    }

    function nv_block_config_videos_submit($module, $lang_block) {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        $return['config']['mod_name'] = $nv_Request->get_title('config_mod_name', 'post', 'news');
        $return['config']['catid'] = $nv_Request->get_int('config_catid', 'post', 0);
        $return['config']['numrow'] = $nv_Request->get_int('config_numrow', 'post', 4);
        return $return;
    }

    function nv_block_videos($block_config) {
        global $global_config, $db, $site_mods;

        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.videos.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.videos.tpl')) {
                return 'Không tìm thấy file giao diện global.videos.tpl';
            }
        }

        $xtpl = new XTemplate('global.videos.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);

        $module_name = isset($block_config['mod_name']) ? $block_config['mod_name'] : 'news';
        $numrow = isset($block_config['numrow']) ? (int)$block_config['numrow'] : 4;
        if ($numrow <= 0) $numrow = 4;

        // Auto fallback if configured module does not exist on site
        if (!isset($site_mods[$module_name])) {
            if (isset($site_mods['news'])) {
                $module_name = 'news';
            } elseif (isset($site_mods['videoclips'])) {
                $module_name = 'videoclips';
            }
        }

        $count = 0;

        if (isset($site_mods[$module_name])) {
            $table_rows = NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_rows";
            $table_detail = NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_detail";

            if ($module_name == 'news') {
                $where = "r.status=1";
                $catid = isset($block_config['catid']) ? (int)$block_config['catid'] : 0;
                if ($catid <= 0) {
                    try {
                        $sql_cat = "SELECT catid FROM " . NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_cat WHERE alias LIKE '%video%' OR alias LIKE '%clip%' OR alias LIKE '%media%' OR title LIKE '%video%' OR title LIKE '%media%' LIMIT 1";
                        $res_cat = $db->query($sql_cat);
                        if ($row_cat = $res_cat->fetch()) {
                            $catid = (int)$row_cat['catid'];
                        }
                    } catch (Exception $e) {}
                }

                if ($catid > 0) {
                    $where .= " AND (r.catid=" . $catid . " OR FIND_IN_SET(" . $catid . ", r.listcatid))";
                }

                $sql = "SELECT r.id, r.title, r.alias, r.homeimgfile, r.homeimgthumb, r.hometext, d.bodyhtml FROM " . $table_rows . " r LEFT JOIN " . $table_detail . " d ON r.id = d.id WHERE " . $where . " ORDER BY r.publtime DESC LIMIT " . $numrow;

                try {
                    $result = $db->query($sql);
                    while ($row = $result->fetch()) {
                        $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                        if (function_exists('nv_url_rewrite')) {
                            $link = nv_url_rewrite($link, true);
                        }

                        // Determine thumbnail (checks both hometext and bodyhtml for YouTube links)
                        $thumb = '';
                        $youtube_id = '';
                        $full_content = $row['hometext'] . ' ' . (isset($row['bodyhtml']) ? $row['bodyhtml'] : '');

                        if (preg_match('/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ \s]{11})/i', $full_content, $matches)) {
                            $youtube_id = $matches[1];
                            $thumb = 'https://img.youtube.com/vi/' . $youtube_id . '/hqdefault.jpg';
                        } elseif (!empty($row['homeimgfile'])) {
                            $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['homeimgfile'];
                        } elseif (!empty($row['homeimgthumb']) && $row['homeimgthumb'] != 1) {
                            $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['homeimgthumb'];
                        } else {
                            $thumb = NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg';
                        }

                        $video = array(
                            'id' => $row['id'],
                            'url' => $link,
                            'title' => $row['title'],
                            'thumb' => $thumb,
                            'youtube_id' => $youtube_id
                        );

                        if ($count == 0) {
                            $xtpl->assign('MAIN_VIDEO', $video);
                            if (!empty($youtube_id)) {
                                $xtpl->parse('main.main_video.embed');
                            } else {
                                $xtpl->parse('main.main_video.no_embed');
                            }
                            $xtpl->parse('main.main_video');
                        } else {
                            $xtpl->assign('SUB_VIDEO', $video);
                            $xtpl->parse('main.sub_video');
                        }
                        $count++;
                    }
                } catch (Exception $e) {}

                // If specific category filter resulted in 0 items, fallback query to all published articles
                if ($count == 0 && $catid > 0) {
                    $sql_fallback = "SELECT r.id, r.title, r.alias, r.homeimgfile, r.homeimgthumb, r.hometext, d.bodyhtml FROM " . $table_rows . " r LEFT JOIN " . $table_detail . " d ON r.id = d.id WHERE r.status=1 ORDER BY r.publtime DESC LIMIT " . $numrow;
                    try {
                        $result_fb = $db->query($sql_fallback);
                        while ($row = $result_fb->fetch()) {
                            $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=detail/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                            if (function_exists('nv_url_rewrite')) {
                                $link = nv_url_rewrite($link, true);
                            }

                            $thumb = '';
                            $youtube_id = '';
                            $full_content = $row['hometext'] . ' ' . (isset($row['bodyhtml']) ? $row['bodyhtml'] : '');

                            if (preg_match('/(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ \s]{11})/i', $full_content, $matches)) {
                                $youtube_id = $matches[1];
                                $thumb = 'https://img.youtube.com/vi/' . $youtube_id . '/hqdefault.jpg';
                            } elseif (!empty($row['homeimgfile'])) {
                                $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['homeimgfile'];
                            } elseif (!empty($row['homeimgthumb']) && $row['homeimgthumb'] != 1) {
                                $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['homeimgthumb'];
                            } else {
                                $thumb = NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg';
                            }

                            $video = array(
                                'id' => $row['id'],
                                'url' => $link,
                                'title' => $row['title'],
                                'thumb' => $thumb,
                                'youtube_id' => $youtube_id
                            );

                            if ($count == 0) {
                                $xtpl->assign('MAIN_VIDEO', $video);
                                if (!empty($youtube_id)) {
                                    $xtpl->parse('main.main_video.embed');
                                } else {
                                    $xtpl->parse('main.main_video.no_embed');
                                }
                                $xtpl->parse('main.main_video');
                            } else {
                                $xtpl->assign('SUB_VIDEO', $video);
                                $xtpl->parse('main.sub_video');
                            }
                            $count++;
                        }
                    } catch (Exception $e) {}
                }
            } else {
                // Generic videoclips module query
                try {
                    $sql = "SELECT * FROM " . $table_rows . " WHERE status=1 ORDER BY id DESC LIMIT " . $numrow;
                    $result = $db->query($sql);
                    while ($row = $result->fetch()) {
                        $title = isset($row['title']) ? $row['title'] : (isset($row['name']) ? $row['name'] : '');
                        $alias = isset($row['alias']) ? $row['alias'] : '';
                        $id = isset($row['id']) ? $row['id'] : 0;
                        $youtube_id = isset($row['youtube_id']) ? $row['youtube_id'] : '';

                        $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=view/' . $alias . '-' . $id . $global_config['rewrite_exturl'];
                        if (function_exists('nv_url_rewrite')) {
                            $link = nv_url_rewrite($link, true);
                        }

                        $thumb = '';
                        if (!empty($youtube_id)) {
                            $thumb = 'https://img.youtube.com/vi/' . $youtube_id . '/hqdefault.jpg';
                        } elseif (!empty($row['img'])) {
                            $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['img'];
                        } elseif (!empty($row['homeimgfile'])) {
                            $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $row['homeimgfile'];
                        } else {
                            $thumb = NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg';
                        }

                        $video = array(
                            'id' => $id,
                            'url' => $link,
                            'title' => $title,
                            'thumb' => $thumb,
                            'youtube_id' => $youtube_id
                        );

                        if ($count == 0) {
                            $xtpl->assign('MAIN_VIDEO', $video);
                            if (!empty($youtube_id)) {
                                $xtpl->parse('main.main_video.embed');
                            } else {
                                $xtpl->parse('main.main_video.no_embed');
                            }
                            $xtpl->parse('main.main_video');
                        } else {
                            $xtpl->assign('SUB_VIDEO', $video);
                            $xtpl->parse('main.sub_video');
                        }
                        $count++;
                    }
                } catch (Exception $e) {}
            }
        }

        if ($count == 0) {
            $xtpl->parse('main.nodata');
        }

        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_videos($block_config);
}
