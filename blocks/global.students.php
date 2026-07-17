<?php
if (!defined('NV_MAINFILE')) die('Stop!!!');

if (!nv_function_exists('nv_block_students')) {
    function nv_block_students($block_config) {
        global $global_config;
        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.students.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.students.tpl')) {
                return 'Không tìm thấy file giao diện global.students.tpl';
            }
        }
        $xtpl = new XTemplate('global.students.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('FALLBACK_IMAGE', NV_STATIC_URL . 'themes/' . $block_theme . '/default.jpg');
        $xtpl->parse('main');
        return $xtpl->text('main');
    }
}
if (defined('NV_SYSTEM')) { $content = nv_block_students($block_config); }
