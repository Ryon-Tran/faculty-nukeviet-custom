<!-- BEGIN: main -->
<div class="vd-block">
    <!-- BEGIN: main_video -->
    <a href="{VIDEO.url}" target="_blank" class="vd-main" title="{VIDEO.title}">
        <img alt="{VIDEO.title}" class="vd-main-img" src="{VIDEO.thumb}" onerror="this.src='https://img.youtube.com/vi/{VIDEO.id}/0.jpg'" />
        <div class="vd-play">
            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="white">
                <polygon points="5 3 19 12 5 21 5 3"></polygon>
            </svg>
        </div>
    </a>
    <!-- END: main_video -->

    <div class="vd-sub-grid">
        <!-- BEGIN: sub_video -->
        <a href="{VIDEO.url}" target="_blank" class="vd-sub" title="{VIDEO.title}">
            <img alt="{VIDEO.title}" class="vd-sub-img" src="{VIDEO.thumb}" onerror="this.src='https://img.youtube.com/vi/{VIDEO.id}/0.jpg'" />
        </a>
        <!-- END: sub_video -->
    </div>
</div>
<!-- END: main -->
