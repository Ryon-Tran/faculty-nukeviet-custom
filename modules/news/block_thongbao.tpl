<!-- BEGIN: main -->
<div class="thongbao-block-container" style="font-family: 'Inter', sans-serif;">
    <div class="thongbao-filters" style="display: flex; justify-content: center; gap: 10px; margin-bottom: 20px; flex-wrap: wrap;">
        <a href="#" class="tb-btn active" style="background-color: #0b2447; color: white; border: 1px solid #0b2447;">Tất cả</a>
        <a href="#" class="tb-btn">Đào tạo</a>
        <a href="#" class="tb-btn">Sinh viên</a>
        <a href="#" class="tb-btn">Tuyển sinh</a>
        <a href="#" class="tb-btn">Hợp tác</a>
    </div>

    <div class="thongbao-list" style="display: flex; flex-direction: column; gap: 15px;">
        <!-- BEGIN: loop -->
        <div class="thongbao-item" style="display: flex; gap: 20px; padding: 15px; background: #fff; border-bottom: 1px solid #eee;">
            <div class="thongbao-img-wrap" style="flex: 0 0 160px; height: 110px; border-radius: 6px; overflow: hidden; background: #f8f9fa;">
                <a href="{CONTENT.link}" title="{CONTENT.title}" style="display: block; width: 100%; height: 100%;">
                    <img alt="{CONTENT.title}" src="{CONTENT.imgurl}" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='{NV_BASE_SITEURL}themes/{TEMPLATE}/images/no_image.gif'"/>
                </a>
            </div>
            
            <div class="thongbao-content" style="flex: 1; display: flex; flex-direction: column; justify-content: flex-start;">
                <div class="thongbao-meta" style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
                    <span class="tb-label" style="background-color: #d92d2d; color: white; padding: 2px 6px; border-radius: 3px; font-size: 11px; font-weight: bold; text-transform: uppercase;">GHIM</span>
                    <span class="tb-cat" style="color: #0056b3; font-size: 13px; font-weight: 600;">Thông báo</span>
                </div>
                <h3 class="thongbao-title" style="margin: 0 0 8px 0; font-size: 16px; line-height: 1.4;">
                    <a href="{CONTENT.link}" title="{CONTENT.title}" style="color: #222; font-weight: 700; text-transform: uppercase; text-decoration: none; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">{CONTENT.title}</a>
                </h3>
                <div class="thongbao-date" style="font-size: 13px; color: #777;">
                    {CONTENT.publtime}
                </div>
            </div>
        </div>
        <!-- END: loop -->
    </div>
</div>

<style>
.tb-btn {
    border-radius: 20px;
    padding: 6px 18px;
    font-size: 14px;
    font-weight: 500;
    border: 1px solid #ddd;
    background-color: #fff;
    color: #333;
    text-decoration: none !important;
    transition: all 0.2s;
}
.tb-btn:hover {
    background-color: #0b2447;
    color: #fff;
    border-color: #0b2447;
}
.thongbao-item:hover {
    background-color: #fafafa;
}
.thongbao-title a:hover {
    color: #d92d2d !important;
}
/* Gỡ bỏ viền mặc định của panel block */
.panel:has(.thongbao-block-container),
.block:has(.thongbao-block-container) {
    border: none !important;
    box-shadow: none !important;
    background: transparent !important;
}
</style>
<!-- END: main -->
