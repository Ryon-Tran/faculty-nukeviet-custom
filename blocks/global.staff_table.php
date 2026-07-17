<?php
if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (!nv_function_exists('nv_block_staff_table')) {
    function nv_block_staff_table($block_config)
    {
        global $global_config;

        $block_theme = $global_config['site_theme'];
        if (file_exists(NV_ROOTDIR . '/themes/custom/blocks/global.staff_table.tpl')) {
            $block_theme = 'custom';
        }

        $xtpl = new XTemplate('global.staff_table.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_staff_table($block_config);
}
