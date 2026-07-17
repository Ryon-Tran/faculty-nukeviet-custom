<!-- BEGIN: main -->
<div class="flex flex-col gap-6 w-full font-['Inter']">    
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 w-full">
        <!-- BEGIN: newloop -->
        <a href="{blocknews.link}" class="news-card-item no-underline group focus:outline-none flex flex-col bg-white overflow-hidden rounded-2xl border border-slate-200/80 shadow-sm transition-all duration-300 hover:-translate-y-1.5 hover:shadow-lg h-full" title="{blocknews.title}">
            <div class="aspect-[16/10] relative w-full bg-slate-100 overflow-hidden shrink-0">
                <span class="news-badge bg-[#c8102e] text-white text-[8px] sm:text-[18px] font-extrabold px-4 py-1.5 rounded-sm absolute top-0 left-0 z-10 m-3 uppercase tracking-widest shadow-md">Mới nhất</span>
                <img src="{blocknews.imgurl}" alt="{blocknews.title}" class="absolute inset-0 object-cover w-full h-full group-hover:scale-105 transition-transform duration-500 ease-out" onerror="this.src='{NV_BASE_SITEURL}themes/{TEMPLATE}/default.jpg'"/>
            </div>
            <div class="flex flex-col gap-2 p-4 sm:p-5 flex-1 min-w-0">
                <span class="news-time text-[12px] font-normal text-slate-400" data-time="{blocknews.publtime}">
                    {blocknews.publtime}
                </span>
                <h3 class="font-bold text-[#003366] m-0 leading-relaxed line-clamp-2 uppercase text-[13px] sm:text-[14px] transition-colors">
                    {blocknews.title}
                </h3>
            </div>
        </a>
        <!-- END: newloop -->
    </div>
</div>

<style>
/* Ẩn badge mặc định, chỉ hiển thị cho thẻ bài viết đầu tiên */
.news-badge { display: none; }
.news-card-item:first-child .news-badge { display: block !important; }

/* Gỡ bỏ viền và nền xám của toàn bộ Block chứa tin tức này */
.panel:has(.news-card-item),
.block:has(.news-card-item) {
    border: none !important;
    box-shadow: none !important;
    background: #fff;
}

/* Tự động bắt và trang trí Tiêu đề Block mặc định của NukeViet (nếu có) */
.panel:has(.news-card-item) > .panel-heading,
.panel:has(.news-card-item) > .panel-heading a,
.panel:has(.news-card-item) > .panel-heading span,
.block:has(.news-card-item) .block-title {
    color: #003366 !important;
    font-size: 26px !important;
    font-weight: 800 !important;
    text-transform: uppercase !important;
    border: none !important;
    background: transparent !important;
    padding-left: 0 !important;
    margin-bottom: 0px !important;
    font-family: 'Inter', sans-serif !important;
}

@media (min-width: 768px) {
    .panel:has(.news-card-item) > .panel-heading,
    .panel:has(.news-card-item) > .panel-heading a,
    .panel:has(.news-card-item) > .panel-heading span,
    .block:has(.news-card-item) .block-title {
        font-size: 32px !important;
    }
}
</style>

<script>
// Chuyển đổi timestamp sang định dạng dd/mm/yyyy
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.news-time').forEach(function(el) {
        var rawTime = el.getAttribute('data-time');
        if (rawTime && !isNaN(rawTime) && rawTime.length >= 10) {
            var ts = parseInt(rawTime);
            // NukeViet publtime thường là seconds
            if (rawTime.length <= 11) ts = ts * 1000; 
            var d = new Date(ts);
            var day = ('0' + d.getDate()).slice(-2);
            var month = ('0' + (d.getMonth() + 1)).slice(-2);
            var year = d.getFullYear();
            el.innerText = day + '/' + month + '/' + year;
        }
    });
});
</script>
<!-- END: main -->
