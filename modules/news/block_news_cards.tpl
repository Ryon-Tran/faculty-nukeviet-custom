<!-- BEGIN: main -->
<div class="block-news-cards row">
    <!-- BEGIN: loop -->
    <div class="{ROW.col_class}" style="margin-bottom: 20px;">
        <div class="card-item" style="border: 1px solid #f0f0f0; border-radius: 8px; overflow: hidden; background: #fff; height: 100%; transition: box-shadow 0.3s ease; display: flex; flex-direction: column; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
            <div class="card-image" style="position: relative; padding-top: 65%;">
                <a href="{ROW.link}" title="{ROW.title}">
                    <img src="{ROW.imgurl}" alt="{ROW.title}" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; border: none; padding: 0; margin: 0;" />
                </a>
                <span class="card-badge" style="position: absolute; top: 10px; left: 10px; background-color: #d92d2d; color: #fff; padding: 4px 12px; font-size: 11px; font-weight: bold; text-transform: uppercase; border-radius: 4px; z-index: 10;">
                    {ROW.cattitle}
                </span>
            </div>
            <div class="card-content" style="padding: 15px; display: flex; flex-direction: column; flex-grow: 1;">
                <h3 style="margin: 0 0 10px 0; font-size: 14px; line-height: 1.5; flex-grow: 1;">
                    <a href="{ROW.link}" title="{ROW.title}" style="color: #1a408b; font-weight: bold; text-transform: uppercase; text-decoration: none; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                        {ROW.title_clean}
                    </a>
                </h3>
                <div class="card-date" style="font-size: 11px; color: #888; border-top: 1px dashed #eee; padding-top: 10px;">
                    {ROW.publtime}
                </div>
            </div>
        </div>
    </div>
    <!-- END: loop -->
</div>

<style>
.block-news-cards.row {
    display: flex;
    flex-wrap: wrap;
}
.block-news-cards .card-item:hover {
    box-shadow: 0 8px 25px rgba(0,0,0,0.12) !important;
}
.block-news-cards .card-item img {
    transition: transform 0.4s ease;
}
.block-news-cards .card-item:hover img {
    transform: scale(1.05);
}
</style>
<!-- END: main -->
