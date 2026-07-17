<?php

if (!defined('NV_MAINFILE')) {
    die('Stop!!!');
}

if (!nv_function_exists('nv_block_slider')) {

    function nv_block_config_slider($module, $data_block, $lang_block)
    {
        $html = '';
        for ($i = 1; $i <= 3; $i++) {
            $image = isset($data_block['image' . $i]) ? $data_block['image' . $i] : '';
            $title = isset($data_block['title' . $i]) ? $data_block['title' . $i] : '';
            $desc = isset($data_block['desc' . $i]) ? $data_block['desc' . $i] : '';
            $link = isset($data_block['link' . $i]) ? $data_block['link' . $i] : '';
            
            $html .= '<tr><td colspan="2" style="background:#eee; font-weight:bold;">Cấu hình Slide ' . $i . '</td></tr>';
            $html .= '<tr>';
            $html .= '<td>Ảnh Slide ' . $i . '</td>';
            $html .= '<td><div class="row"><div class="col-xs-18"><input type="text" class="form-control" name="config_image' . $i . '" id="id_image' . $i . '" value="' . $image . '"/></div>';
            $url = NV_BASE_ADMINURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&' . NV_NAME_VARIABLE . '=upload&popup=1&area=id_image' . $i . '&path=uploads&type=file';
            $html .= '<div class="col-xs-6"><input type="button" class="btn btn-primary" value="Tải lên / Chọn ảnh" onclick="nv_open_browse(\'' . $url . '\', \'NVImg\', 850, 420, \'resizable=no,scrollbars=no,toolbar=no,location=no,status=no\'); return false;" /></div></div>';
            $html .= '</td></tr>';
            
            $html .= '<tr><td>Tiêu đề ' . $i . '</td><td><input type="text" class="form-control" name="config_title' . $i . '" value="' . $title . '"/></td></tr>';
            $html .= '<tr><td>Đoạn mô tả ngắn ' . $i . '</td><td><input type="text" class="form-control" name="config_desc' . $i . '" value="' . $desc . '"/></td></tr>';
            $html .= '<tr><td>Link khi bấm nút ' . $i . '</td><td><input type="text" class="form-control" name="config_link' . $i . '" value="' . $link . '"/></td></tr>';
        }
        return $html;
    }
    
    function nv_block_config_slider_submit($module, $lang_block)
    {
        global $nv_Request;
        $return = array();
        $return['error'] = array();
        for ($i = 1; $i <= 3; $i++) {
            $return['config']['image' . $i] = $nv_Request->get_title('config_image' . $i, 'post', '');
            $return['config']['title' . $i] = $nv_Request->get_title('config_title' . $i, 'post', '');
            $return['config']['desc' . $i] = $nv_Request->get_title('config_desc' . $i, 'post', '');
            $return['config']['link' . $i] = $nv_Request->get_title('config_link' . $i, 'post', '');
        }
        return $return;
    }
    
    function nv_block_slider_image_url($image)
    {
        $image = trim($image);
        if ($image === '' || preg_match('/^(https?:)?\/\//i', $image)) {
            return $image;
        }

        $image = preg_replace('#^(\.\./)+#', '', $image);
        $image = preg_replace('#^\./+#', '', $image);

        if (NV_BASE_SITEURL !== '/' && strpos($image, NV_BASE_SITEURL) === 0) {
            return $image;
        }

        if (strpos($image, '/') === 0) {
            return NV_BASE_SITEURL . ltrim($image, '/');
        }

        return NV_BASE_SITEURL . $image;
    }

    function nv_block_slider($block_config)
    {
        global $global_config;
        
        $block_theme = $global_config['module_theme'];
        if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.slider.tpl')) {
            $block_theme = $global_config['site_theme'];
            if (!file_exists(NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/global.slider.tpl')) {
                return 'Không tìm thấy file giao diện global.slider.tpl';
            }
        }
        
        $xtpl = new XTemplate('global.slider.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks');
        $xtpl->assign('TEMPLATE', $block_theme);
        
        $has_slide = false;
        for ($i = 1; $i <= 3; $i++) {
            if (!empty($block_config['image' . $i])) {
                $slide_img = nv_block_slider_image_url($block_config['image' . $i]);
                
                $slide = array(
                    'image' => $slide_img,
                    'title' => $block_config['title' . $i],
                    'desc' => $block_config['desc' . $i],
                    'link' => $block_config['link' . $i] ? $block_config['link' . $i] : '#',
                    'active_class' => (!$has_slide) ? 'active' : '',
                    'active_dot' => (!$has_slide) ? 'active' : ''
                );
                $xtpl->assign('SLIDE', $slide);
                $xtpl->assign('INDEX', $i - 1);
                $xtpl->parse('main.indicator');
                
                if (!empty($block_config['title' . $i]) || !empty($block_config['desc' . $i])) {
                    $xtpl->parse('main.item.caption');
                }
                
                $xtpl->parse('main.item');
                $has_slide = true;
            }
        }
        
        if ($has_slide) {
            $xtpl->parse('main');
            return $xtpl->text('main');
        }
        return '';
    }
}

if (defined('NV_SYSTEM')) {
    $content = nv_block_slider($block_config);
}

?>
