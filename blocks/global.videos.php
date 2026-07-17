<?php

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (!nv_function_exists('nv_block_videos')) {

    function nv_block_config_videos($module, $data_block, $lang_block)
    {
        global $site_mods;
        $html = '';
        $mod_name = isset($data_block['mod_name']) ? $data_block['mod_name'] : 'videoclips';
        
        $html .= '<tr><td>Chọn Module lấy Video</td><td><select name="config_mod_name" class="form-control">';
        foreach ($site_mods as $mod => $mod_info) {
            $sel = ($mod == $mod_name) ? ' selected="selected"' : '';
            $html .= '<option value="' . $mod . '"' . $sel . '>' . $mod_info['custom_title'] . ' (' . $mod . ')</option>';
        }
        $html .= '</select><p class="help-block">Nếu bạn có module Video, hãy chọn VideoClips. Nếu bạn đăng video bằng module Tin Tức, hãy chọn News.</p></td></tr>';
        return $html;
    }
    
    function nv_block_config_videos_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['mod_name'] = $nv_Request->get_title('config_mod_name', 'post', 'videoclips');
        return $return;
    }
    
    function nv_block_videos($block_config)
    {
        global $global_config, $db, $site_mods;
        
        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.videos.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.videos.tpl')) {
                return 'Không tìm thấy file giao diện global.videos.tpl';
            }
        }
        
        $xtpl = new XTemplate('global.videos.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        
        $module_name = isset($block_config['mod_name']) ? $block_config['mod_name'] : 'videoclips';
        
        if (isset($site_mods[$module_name])) {
            $table = NV_PREFIXLANG . "_" . $site_mods[$module_name]['module_data'] . "_rows";
            // Thử query CSDL (tương thích cả news và videoclips)
            $sql = "SELECT id, title, alias, homeimgfile FROM " . $table . " WHERE status=1 ORDER BY publtime DESC LIMIT 5";
            try {
                $result = $db->query($sql);
                $i = 1;
                while ($row = $result->fetch()) {
                    // Tạo link chi tiết
                    $op = ($module_name == 'news') ? 'detail' : 'view';
                    $link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $op . '/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
                    if (function_exists('nv_url_rewrite')) {
                        $link = nv_url_rewrite($link, true);
                    }
                    
                    // Xử lý ảnh thumbnail
                    $thumb = $row['homeimgfile'];
                    if (!preg_match('/^(http|https)\:\/\//i', $thumb)) {
                        // Ảnh được upload nội bộ
                        $thumb = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $site_mods[$module_name]['module_upload'] . '/' . $thumb;
                    }
                    
                    $video = array(
                        'id' => $row['id'],
                        'url' => $link,
                        'title' => $row['title'],
                        'thumb' => $thumb
                    );
                    
                    $xtpl->assign('VIDEO', $video);
                    if ($i == 1) {
                        $xtpl->parse('main.main_video');
                    } else {
                        $xtpl->parse('main.sub_video');
                    }
                    $i++;
                }
            } catch (Exception $e) {
                // Nếu module không có cấu trúc bảng giống vậy thì bỏ qua
            }
        }
        
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_videos($block_config);
}
?>
