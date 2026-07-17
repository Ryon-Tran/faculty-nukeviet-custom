<!-- BEGIN: main -->
<div class="block-tophits-modern" >
    <div class="tophits-list" style="display: flex; flex-direction: column; gap: 15px;">
        <!-- BEGIN: newloop -->
        <div class="tophits-item" style="display: flex; gap: 15px; align-items: flex-start; padding-bottom: 15px; border-bottom: 1px dashed #e0e0e0;">
            <!-- BEGIN: imgblock -->
            <a href="{blocknews.link}" title="{blocknews.title}" class="tophits-img" style="flex: 0 0 100px; height: 65px; overflow: hidden; display: block; border-radius: 4px;">
                <img src="{blocknews.imgurl}" alt="{blocknews.title}" style="width: 100%; height: 100%; object-fit: cover; border: none; padding: 0;" onerror="this.src='{NV_BASE_SITEURL}themes/{TEMPLATE}/images/no_image.gif'"/>
            </a>
            <!-- END: imgblock -->
            <div class="tophits-content" style="flex: 1;">
                <h4 style="margin: 0 0 6px 0; font-size: 13px; line-height: 1.5;">
                    <a {TITLE} href="{blocknews.link}" title="{blocknews.title}" style="color: #1a408b; font-weight: 700; text-transform: uppercase; text-decoration: none; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;" data-content="{blocknews.hometext_clean}" data-img="{blocknews.imgurl}" data-rel="block_news_tooltip">
                        {blocknews.title}
                    </a>
                </h4>
                <div style="font-size: 11px; color: #888;">
                    <i class="fa fa-angle-right" style="color: #d92d2d; margin-right: 3px;"></i> Tin nổi bật
                </div>
            </div>
        </div>
        <!-- END: newloop -->
    </div>
</div>

<style>
.block-tophits-modern .tophits-item:last-child {
    border-bottom: none !important;
    padding-bottom: 0 !important;
}
.block-tophits-modern .tophits-item:hover {
    background-color: #fcfcfc;
}
.block-tophits-modern a:hover {
    color: #d92d2d !important;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
    // Tìm khung bao ngoài của block này
    var panel = $('.block-tophits-modern').closest('.panel');
    if(panel.length) {
        // Lột sạch các class panel của Bootstrap (kể cả panel-primary mà bạn nghi ngờ)
        panel.removeClass('panel panel-default panel-primary panel-info panel-success panel-warning panel-danger');
        panel.css({
            'border': 'none',
            'box-shadow': 'none',
            'background': 'transparent',
            'margin-top': '25px'
        });
        
        // Xóa class panel-body để mất padding mặc định
        panel.find('.panel-body').removeClass('panel-body').css({
            'padding-left': '0',
            'padding-right': '0',
            'padding-top': '10px'
        });
        
        // Xóa class panel-heading và định dạng lại chữ thành BÀI VIẾT MỚI NHẤT
        panel.find('.panel-heading').removeClass('panel-heading').css({
            'background-color': 'transparent',
            'background-image': 'none',
            'border': 'none',
            'padding': '0 0 15px 0',
            'font-size': '16px',
            'font-weight': 'bold',
            'color': '#1a408b',
            'text-transform': 'uppercase'
        });
    }
});
</script>

<!-- BEGIN: tooltip -->
<script type="text/javascript">
$(document).ready(function() {$("[data-rel='block_news_tooltip'][data-content!='']").tooltip({
    placement: "{TOOLTIP_POSITION}",
    html: true,
    title: function(){return ( $(this).data('img') == '' ? '' : '<img class="img-thumbnail pull-left margin_image" src="' + $(this).data('img') + '" width="90" />' ) + '<p class="text-justify">' + $(this).data('content') + '</p><div class="clearfix"></div>';}
});});
</script>
<!-- END: tooltip -->
<!-- END: main -->
