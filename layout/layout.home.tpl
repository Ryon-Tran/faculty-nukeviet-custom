<!-- BEGIN: main -->
{FILE "header_only.tpl"}
[TOP_BAR]
{FILE "header_extended.tpl"}
<main aria-label="Nội dung chính" class="flex-1 flex flex-col min-w-0 pb-12 mt-6 w-full" style="max-width: 1280px; margin: 0 auto; padding: 0 15px;">
    

    [TOP]
    <!-- 2. NEWS SECTION (2 columns) -->
    <section aria-label="Tin tức nổi bật" class="home-columns-section">
        <div class="home-col home-col-left">
            [HOME_COL1]
        </div>
        <div class="home-col home-col-right">
            [HOME_COL2]
        </div>
    </section>

    <!-- Nơi đổ Module Content của NukeViet (nếu có sử dụng các block nội dung tĩnh) -->
    <div style="display: none;">
        {MODULE_CONTENT}
    </div>
[BOTTOM]
</main>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->
