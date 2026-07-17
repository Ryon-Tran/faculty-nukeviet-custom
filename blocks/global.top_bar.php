<?php

if (!defined('NV_MAINFILE')) {
    exit('Stop!!!');
}

if (!nv_function_exists('nv_top_bar_config')) {
    function nv_top_bar_config($module, $data_block, $lang_block)
    {
        $html = '<div class="form-group">';
        $html .= '<label class="control-label col-sm-6">Link Facebook:</label>';
        $html .= '<div class="col-sm-18"><input type="text" class="form-control" name="config_top_fb" value="' . (isset($data_block['top_fb']) ? $data_block['top_fb'] : '') . '"></div>';
        $html .= '</div>';
        
        $html .= '<div class="form-group">';
        $html .= '<label class="control-label col-sm-6">Link Telegram:</label>';
        $html .= '<div class="col-sm-18"><input type="text" class="form-control" name="config_top_tele" value="' . (isset($data_block['top_tele']) ? $data_block['top_tele'] : '') . '"></div>';
        $html .= '</div>';
        
        $html .= '<div class="form-group">';
        $html .= '<label class="control-label col-sm-6">Link YouTube:</label>';
        $html .= '<div class="col-sm-18"><input type="text" class="form-control" name="config_top_yt" value="' . (isset($data_block['top_yt']) ? $data_block['top_yt'] : '') . '"></div>';
        $html .= '</div>';
        
        return $html;
    }

    function nv_top_bar_submit()
    {
        global $nv_Request;
        $return = [];
        $return['error'] = [];
        $return['config']['top_fb'] = $nv_Request->get_title('config_top_fb', 'post', '');
        $return['config']['top_tele'] = $nv_Request->get_title('config_top_tele', 'post', '');
        $return['config']['top_yt'] = $nv_Request->get_title('config_top_yt', 'post', '');
        return $return;
    }

    function nv_top_bar($block_config)
    {
        global $global_config, $lang_global;

        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks/global.top_bar.tpl')) {
            $block_theme = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/blocks/global.top_bar.tpl')) {
            $block_theme = $global_config['site_theme'];
        } else {
            $block_theme = 'default';
        }

        $xtpl = new XTemplate('global.top_bar.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        
        if (defined('NV_IS_USER')) {
            global $user_info;
            $xtpl->assign('USER_TEXT', mb_strtoupper($user_info['username'], 'UTF-8'));
        } else {
            $xtpl->assign('USER_TEXT', 'ĐĂNG NHẬP');
        }
        
        if (!empty($global_config['site_email'])) {
            $xtpl->assign('TOP_EMAIL', $global_config['site_email']);
            $xtpl->parse('main.has_email');
        }
        
        if (!empty($global_config['site_phone'])) {
            $xtpl->assign('TOP_PHONE', $global_config['site_phone']);
            $xtpl->parse('main.has_phone');
        }
        
        if (!empty($block_config['top_fb'])) {
            $xtpl->assign('TOP_FB', $block_config['top_fb']);
            $xtpl->parse('main.has_fb');
        }
        
        if (!empty($block_config['top_tele'])) {
            $xtpl->assign('TOP_TELE', $block_config['top_tele']);
            $xtpl->parse('main.has_tele');
        }
        
        if (!empty($block_config['top_yt'])) {
            $xtpl->assign('TOP_YT', $block_config['top_yt']);
            $xtpl->parse('main.has_yt');
        }

        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_top_bar($block_config);
}
