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

    function nv_top_bar_login_dropdown($block_config)
    {
        global $global_config, $site_mods, $user_info, $lang_global, $lang_module, $module_file, $module_info, $admin_info, $blockID, $page_url, $nv_redirect;

        if (empty($global_config['allowuserlogin'])) {
            return '';
        }

        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/modules/users/block.login_dropdown.tpl')) {
            $block_theme = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/modules/users/block.login_dropdown.tpl')) {
            $block_theme = $global_config['site_theme'];
        } else {
            $block_theme = 'default';
        }

        if (file_exists(NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/js/users.js')) {
            $block_js = $global_config['module_theme'];
        } elseif (file_exists(NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/js/users.js')) {
            $block_js = $global_config['site_theme'];
        } else {
            $block_js = 'default';
        }

        if (file_exists(NV_ROOTDIR . '/modules/users/language/' . NV_LANG_INTERFACE . '.php')) {
            include_once NV_ROOTDIR . '/modules/users/language/' . NV_LANG_INTERFACE . '.php';
        } elseif (file_exists(NV_ROOTDIR . '/modules/users/language/vi.php')) {
            include_once NV_ROOTDIR . '/modules/users/language/vi.php';
        }

        $xtpl = new XTemplate('block.login_dropdown.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/modules/users');
        $xtpl->assign('LANG', isset($lang_module) ? $lang_module : []);
        $xtpl->assign('GLANG', $lang_global);
        $xtpl->assign('BLOCK_JS', $block_js);
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);

        if (defined('NV_IS_USER')) {
            if (!empty($user_info['avata'])) {
                $avata = $user_info['avata'];
            } else {
                $avata = NV_STATIC_URL . 'themes/' . $block_theme . '/images/users/no_avatar.png';
            }
            $xtpl->assign('AVATA', $avata);
            $xtpl->assign('USER', $user_info);
            $xtpl->assign('URL_MODULE', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users');
            $xtpl->assign('URL_HREF', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users&amp;' . NV_OP_VARIABLE . '=');
            $xtpl->assign('URL_LOGOUT', defined('NV_IS_ADMIN') ? 'nv_admin_logout' : 'bt_logout');

            if (defined('NV_IS_ADMIN')) {
                $xtpl->parse('signed.admintoolbar');
            }

            $xtpl->parse('signed');
            return $xtpl->text('signed');
        } else {
            $xtpl->assign('USER_LOGIN', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users&amp;' . NV_OP_VARIABLE . '=login');
            $xtpl->assign('USER_REGISTER', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users&amp;' . NV_OP_VARIABLE . '=register');
            $xtpl->assign('URL_LOSTPASS', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users&amp;' . NV_OP_VARIABLE . '=lostpass');
            $xtpl->assign('USER_LOSTPASS', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=users&amp;' . NV_OP_VARIABLE . '=lostpass');
            $xtpl->assign('NV_REDIRECT', nv_redirect_encrypt(NV_MY_DOMAIN . (empty($page_url) ? '' : nv_url_rewrite(str_replace('&amp;', '&', $page_url), true))));

            $xtpl->parse('main.display_form');
            $xtpl->parse('main');
            return $xtpl->text('main');
        }
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
        
        $login_dropdown_html = nv_top_bar_login_dropdown($block_config);
        $xtpl->assign('LOGIN_DROPDOWN', $login_dropdown_html);
        
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
