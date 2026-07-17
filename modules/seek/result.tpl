<!-- BEGIN: main -->
<input type="hidden" id="hidden_key" value="{HIDDEN_KEY}" />

<div class="search-results-container" style="max-width: 900px; margin: 0 auto; margin-top: 20px;">
    <div class="search-results-header" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #1a408b; padding-bottom: 12px; margin-bottom: 20px;">
        <h3 style="margin: 0; font-size: 18px; font-weight: bold; color: #333;">
            {LANG.search_on} <span style="color: #1a408b;">&quot;{MODULE_CUSTOM_TITLE}&quot;</span> 
            <span class="badge" style="background-color: #f1f1f1; color: #555; margin-left: 8px; font-size: 14px; font-weight: normal; padding: 4px 10px; border-radius: 12px;">{SEARCH_RESULT_NUM} kết quả</span>
        </h3>
        <!-- BEGIN: more -->
        <a href="{MORE}" class="btn btn-default btn-sm" style="border-radius: 20px; font-size: 12px; padding: 5px 15px; color: #666; border-color: #ddd;">
            {LANG.view_all_title} <i class="fa fa-angle-right" style="margin-left: 5px;"></i>
        </a>
        <!-- END: more -->
    </div>

    <div class="search-results-list">
        <!-- BEGIN: result -->
        <div class="search-result-item" style="padding: 15px 0; border-bottom: 1px dashed #e5e5e5; transition: background-color 0.2s;">
            <h4 style="margin-top: 0; margin-bottom: 8px; font-size: 18px; line-height: 1.4;">
                <a href="{RESULT.link}" style="color: #1a408b; font-weight: 600; text-decoration: none;" onmouseover="this.style.color='#0d2b63'" onmouseout="this.style.color='#1a408b'">{RESULT.title}</a>
            </h4>
            <div class="search-result-content" style="color: #555; font-size: 14px; line-height: 1.6;">
                {RESULT.content}
            </div>
        </div>
        <!-- END: result -->
    </div>

    <!-- BEGIN: generate_page -->
    <div class="text-center" style="margin-top: 30px;">
        {GENERATE_PAGE}
    </div>
    <!-- END: generate_page -->
</div>
<!-- END: main -->