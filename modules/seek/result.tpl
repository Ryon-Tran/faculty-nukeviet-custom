<!-- BEGIN: main -->
<input type="hidden" id="hidden_key" value="{HIDDEN_KEY}" />

<style>
    .search-results-container { max-width: 900px; margin: 0 auto; margin-top: 20px; }
    .search-results-header { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #1a408b; padding-bottom: 12px; margin-bottom: 20px; }
    .search-results-title { margin: 0; font-size: 18px; font-weight: bold; color: #333; }
    .search-results-badge { background-color: #f1f1f1; color: #555; margin-left: 8px; font-size: 14px; font-weight: normal; padding: 4px 10px; border-radius: 12px; }
    .search-results-more-btn { border-radius: 20px; font-size: 12px; padding: 5px 15px; color: #666; border: 1px solid #ddd; text-decoration: none; display: inline-block; }
    .search-result-item { padding: 15px 0; border-bottom: 1px dashed #e5e5e5; transition: background-color 0.2s; }
    .search-result-heading { margin-top: 0; margin-bottom: 8px; font-size: 18px; line-height: 1.4; }
    .search-result-link { color: #1a408b; font-weight: 600; text-decoration: none; }
    .search-result-link:hover { color: #0d2b63; }
    .search-result-content { color: #555; font-size: 14px; line-height: 1.6; }
    
    @media (max-width: 767px) {
        .search-results-title { font-size: 16px; }
        .search-results-badge { font-size: 12px; padding: 3px 8px; }
        .search-results-more-btn { font-size: 11px; padding: 4px 10px; }
        .search-result-heading { font-size: 15px; margin-bottom: 6px; }
        .search-result-content { font-size: 13px; line-height: 1.5; }
        .search-result-item { padding: 12px 0; }
        .search-results-header { padding-bottom: 8px; margin-bottom: 15px; }
    }
</style>
<div class="search-results-container">
    <div class="search-results-header">
        <h3 class="search-results-title">
            {LANG.search_on} <span style="color: #1a408b;">&quot;{MODULE_CUSTOM_TITLE}&quot;</span> 
            <span class="badge search-results-badge">{SEARCH_RESULT_NUM} kết quả</span>
        </h3>
        <!-- BEGIN: more -->
        <a href="{MORE}" class="search-results-more-btn">
            {LANG.view_all_title} <i class="fa fa-angle-right" style="margin-left: 5px;"></i>
        </a>
        <!-- END: more -->
    </div>

    <div class="search-results-list">
        <!-- BEGIN: result -->
        <div class="search-result-item">
            <h4 class="search-result-heading">
                <a href="{RESULT.link}" class="search-result-link">{RESULT.title}</a>
            </h4>
            <div class="search-result-content">
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