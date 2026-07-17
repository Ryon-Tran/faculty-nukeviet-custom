<!-- BEGIN: main -->
<div class="photo-gallery-wrapper">
    <h3 class="section-title">| Thư viện ảnh</h3>
    <div class="photo-grid">
        <!-- BEGIN: loop -->
        <div class="photo-item">
            <a href="{ROW.link}" title="{ROW.title}">
                <img src="{ROW.thumb}" alt="{ROW.title}">
                <div class="photo-overlay">
                    <span class="photo-title">{ROW.title}</span>
                </div>
            </a>
        </div>
        <!-- END: loop -->
    </div>
</div>
<!-- END: main -->
