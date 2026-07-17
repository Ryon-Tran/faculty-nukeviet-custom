<?php

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (!nv_function_exists('nv_block_search_form')) {

    function nv_block_search_form($block_config)
    {
        global $global_config, $nv_Request;

        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.search_form.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.search_form.tpl')) {
                return '';
            }
        }

        $xtpl = new XTemplate('global.search_form.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('TEMPLATE', $block_theme);
        $xtpl->assign('THEME_SEARCH_URL', NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=seek');

        $keyword = $nv_Request->get_title('q', 'get', '');
        $xtpl->assign('KEYWORD', htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'));

        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_search_form($block_config);
}
