<?php
if (!defined('NV_MAINFILE')) die('Stop!!!');

if (!nv_function_exists('nv_block_consultation')) {
    function nv_block_consultation($block_config) {
        global $global_config, $module_info;
        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.consultation.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.consultation.tpl')) {
                return 'Không tìm thấy file giao diện global.consultation.tpl';
            }
        }
        $xtpl = new XTemplate('global.consultation.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        
        $xtpl->assign('NV_BASE_SITEURL', NV_BASE_SITEURL);
        
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}
if (defined('NV_SYSTEM')) { $content = nv_block_consultation($block_config); }
