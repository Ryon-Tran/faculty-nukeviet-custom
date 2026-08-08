<!-- BEGIN: main -->
<div class="block-news-cards-container" id="block-news-cards-{BLOCK_ID}">
    <!-- Header Block with Dynamic Category Title & Tab Filters -->
    <div class="block-cards-header" style="margin-bottom: 22px;">
        <h2 class="block-cards-title" style="color: #a31424; font-size: 22px; font-weight: 700; text-transform: uppercase; margin: 0 0 16px 0; letter-spacing: 0.5px; font-family: inherit;">
            {CAT_TITLE}
        </h2>
        
        <!-- BEGIN: filter -->
        <div class="filter-tabs-wrapper" style="display: flex; gap: 10px; flex-wrap: wrap; align-items: center;">
            <button type="button" class="btn-filter-pill active" data-filter="all">
                Tất cả
            </button>
            <!-- BEGIN: subcat -->
            <button type="button" class="btn-filter-pill" data-filter="{SUBCAT.catid}" data-title="{SUBCAT.title}">
                {SUBCAT.title}
            </button>
            <!-- END: subcat -->
        </div>
        <!-- END: filter -->
    </div>

    <!-- News Cards Grid -->
    <div class="block-news-cards row">
        <!-- BEGIN: loop -->
        <div class="{ROW.col_class} news-card-item" data-catid="{ROW.catid}" style="margin-bottom: 20px;">
            <div class="card-item" style="border: 1px solid #eef0f3; border-radius: 12px; overflow: hidden; background: #ffffff; height: 100%; transition: box-shadow 0.3s ease, transform 0.3s ease; display: flex; flex-direction: column; box-shadow: 0 4px 12px rgba(0,0,0,0.04);">
                <div class="card-image" style="position: relative; padding-top: 62%; overflow: hidden;">
                    <a href="{ROW.link}" title="{ROW.title}">
                        <img src="{ROW.imgurl}" alt="{ROW.title}" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; border: none; padding: 0; margin: 0;" />
                    </a>
                    <span class="card-badge" style="position: absolute; top: 12px; left: 12px; background-color: #c81d25; color: #ffffff; padding: 4px 12px; font-size: 11px; font-weight: 700; text-transform: uppercase; border-radius: 4px; z-index: 10; letter-spacing: 0.3px;">
                        {ROW.cattitle}
                    </span>
                </div>
                <div class="card-content" style="padding: 16px; display: flex; flex-direction: column; flex-grow: 1;">
                    <h3 style="margin: 0 0 12px 0; font-size: 14px; line-height: 1.5; flex-grow: 1;">
                        <a href="{ROW.link}" title="{ROW.title}" style="color: #194d8c; font-weight: 700; text-transform: uppercase; text-decoration: none; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                            {ROW.title_clean}
                        </a>
                    </h3>
                    <div class="card-date" style="font-size: 11px; color: #888888; border-top: 1px dashed #e2e8f0; padding-top: 10px; margin-top: auto;">
                        {ROW.publtime}
                    </div>
                </div>
            </div>
        </div>
        <!-- END: loop -->
    </div>
</div>

<style>
#block-news-cards-{BLOCK_ID} .btn-filter-pill {
    padding: 7px 24px;
    border-radius: 20px;
    border: 1px solid #e2e8f0;
    background-color: #ffffff;
    color: #4a5568;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.25s ease;
    outline: none;
}
#block-news-cards-{BLOCK_ID} .block-news-cards.row {
    display: flex;
    flex-wrap: wrap;
}
#block-news-cards-{BLOCK_ID} .card-item:hover {
    box-shadow: 0 8px 24px rgba(0,0,0,0.1) !important;
}
#block-news-cards-{BLOCK_ID} .card-item img {
    transition: transform 0.4s ease;
}
#block-news-cards-{BLOCK_ID} .card-item:hover img {
    transform: scale(1.05);
}
#block-news-cards-{BLOCK_ID} .btn-filter-pill.active {
    background-color: #194d8c !important;
    border-color: #194d8c !important;
    color: #ffffff !important;
}
#block-news-cards-{BLOCK_ID} .btn-filter-pill:hover:not(.active) {
    background-color: #f1f5f9 !important;
    color: #194d8c !important;
}
</style>

<script type="text/javascript">
if (typeof jQuery !== 'undefined') {
    $(document).ready(function() {
        var $block = $('#block-news-cards-{BLOCK_ID}');
        $block.find('.btn-filter-pill').on('click', function() {
            var filterCatId = $(this).attr('data-filter');
            var subcatTitle = $(this).attr('data-title');

            $block.find('.btn-filter-pill').removeClass('active');
            $(this).addClass('active');

            $block.find('.news-card-item').each(function() {
                var itemCatId = $(this).attr('data-catid');
                if (filterCatId === 'all' || itemCatId === filterCatId) {
                    $(this).fadeIn(300);
                } else {
                    $(this).hide();
                }
            });
        });
    });
}
</script>
<!-- END: main -->
