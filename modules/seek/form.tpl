<!-- BEGIN: main -->
<div class="page panel panel-default">
    <div class="panel-body">
        <h1 class="text-center text-uppercase" style="color: #1a408b; font-weight: bold; margin-top: 40px; margin-bottom: 15px; font-size: 32px;">Tìm kiếm thông tin</h1>
        <div id="search-form">
            <form action="{DATA.action}" name="form_search" method="get" id="form_search" role="form">
                <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
                <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
                
                <div style="max-width: 650px; margin: 0 auto;">
                    <div class="input-group input-group-lg" style="margin-bottom: 30px; box-shadow: 0 4px 10px rgba(0,0,0,0.08); border-radius: 6px;">
                        <span class="input-group-addon" style="background: #fff; border: 1px solid #ced4da; border-right: none; color: #888; border-top-left-radius: 6px; border-bottom-left-radius: 6px; padding-left: 20px;">
                            <i class="fa fa-search"></i>
                        </span>
                        <input class="form-control" style="border: 1px solid #ced4da; border-left: none; box-shadow: none; height: 54px; font-size: 16px; padding-left: 10px;" id="search_query" name="q" value="{DATA.key}" maxlength="{NV_MAX_SEARCH_LENGTH}" placeholder="Nhập từ khóa tìm kiếm..." />
                        <span class="input-group-btn">
                            <button type="submit" id="search_submit" class="btn btn-primary" style="background-color: #1a408b; border-color: #1a408b; padding: 0 35px; height: 54px; font-weight: bold; font-size: 16px; border-top-right-radius: 6px; border-bottom-right-radius: 6px;">{LANG.search_title}</button>
                        </span>
                    </div>

                        <!-- Gợi ý từ khóa -->
                        <div class="text-center" style="margin-bottom: 30px;">
                            <p class="text-uppercase text-muted" style="font-size: 12px; font-weight: bold; letter-spacing: 1px; margin-bottom: 15px;">Gợi ý từ khóa</p>
                            <div class="keyword-suggestions">
                                <a href="javascript:void(0);" onclick="$('#search_query').val('tuyển sinh'); $('#form_search').submit();" class="btn btn-default btn-sm" style="border-radius: 20px; color: #666; margin: 0 5px 10px; border-color: #ddd; padding: 5px 15px;">tuyển sinh</a>
                                <a href="javascript:void(0);" onclick="$('#search_query').val('sư phạm lịch sử'); $('#form_search').submit();" class="btn btn-default btn-sm" style="border-radius: 20px; color: #666; margin: 0 5px 10px; border-color: #ddd; padding: 5px 15px;">sư phạm lịch sử</a>
                                <a href="javascript:void(0);" onclick="$('#search_query').val('sư phạm địa lý'); $('#form_search').submit();" class="btn btn-default btn-sm" style="border-radius: 20px; color: #666; margin: 0 5px 10px; border-color: #ddd; padding: 5px 15px;">sư phạm địa lý</a>
                                <a href="javascript:void(0);" onclick="$('#search_query').val('giáo dục chính trị'); $('#form_search').submit();" class="btn btn-default btn-sm" style="border-radius: 20px; color: #666; margin: 0 5px 10px; border-color: #ddd; padding: 5px 15px;">giáo dục chính trị</a>
                                <a href="javascript:void(0);" onclick="$('#search_query').val('thông báo'); $('#form_search').submit();" class="btn btn-default btn-sm" style="border-radius: 20px; color: #666; margin: 0 5px 10px; border-color: #ddd; padding: 5px 15px;">thông báo</a>
                            </div>
                        </div>

                        <!-- Các input cũ được ẩn đi để giữ nguyên chức năng -->
                        <div class="hidden" style="display: none;">
                            <select name="m" id="search_query_mod" class="form-control">
                                <option value="all">{LANG.search_on_site}</option>
                                <!-- BEGIN: select_option -->
                                <option data-adv="{MOD.adv_search}" value="{MOD.value}"{MOD.selected}>{MOD.custom_title}</option>
                                <!-- END: select_option -->
                            </select>
                            <a href="#" class="advSearch">{LANG.search_title_adv}</a>
                            <input name="l" id="search_logic_and" type="radio" {DATA.andChecked} value="1" />
                            <input name="l" id="search_logic_or" type="radio" {DATA.orChecked} value="0" />
                        </div>
                    </div>
                </div>
                <input type="hidden" name="page" value="{PAGE}" />
            </form>
        </div>
        <!-- BEGIN: search_engine_unique_ID -->
        <script async src="//cse.google.com/cse.js?cx={SEARCH_ENGINE_UNIQUE_ID}"></script>
        <div class="text-center margin-bottom-lg search_adv">
            <a href="javascript:void(0);" class="IntSearch"><i class="fa fa-eye" aria-hidden="true"></i> {LANG.search_adv_internet}</a>
        </div>
        <div id="gcse" class="hidden">
            <div class="gcse-search"></div>
        </div>
        <!-- END: search_engine_unique_ID -->
        <div id="search_result">
            <hr />
            {SEARCH_RESULT}
        </div>
    </div>
</div>
<script type="text/javascript">
function show_advSearch() {
    var data = $('#search_query_mod').find('option:selected').data();
    if (data.adv == true) {
        $("a.advSearch").show();
    } else if (data.adv == false) {
        $("a.advSearch").hide();
    } else {
        $("a.advSearch").show();
    }
}
$(function() {
    show_advSearch();
});
$('#search_query_mod').change(function() {
    show_advSearch();
});
$("a.advSearch").click(function(e) {
    e.preventDefault();
    var b = $("#form_search #search_query_mod").val();
    if ("all" == b) {
        return alert("{LANG.chooseModule}"), $("#form_search #search_query_mod").focus(), !1
    }
    var b = nv_base_siteurl + "index.php?" + nv_lang_variable + "=" + nv_lang_data + "&" + nv_name_variable + "=" + b + "&" + nv_fc_variable + "=search", a = $("#form_search #search_query").val(), a = strip_tags(a);
    {NV_MIN_SEARCH_LENGTH} <= a.length && {NV_MAX_SEARCH_LENGTH} >= a.length && (a = rawurlencode(a), b = b + "&q=" + a);

    window.location.href = b;
});
$("a.IntSearch").click(function(e) {
    e.preventDefault();
    $(".fa", this).toggleClass("fa-eye fa-eye-slash");
    $("#search-form, #gcse, #search_result").toggleClass("hidden")
});
$("#form_search").submit(function() {
    var a = $("#form_search [name=q]").val(), a = strip_tags(a), b;
    $("#form_search [name=q]").val(a);
    if ({NV_MIN_SEARCH_LENGTH} > a.length || {NV_MAX_SEARCH_LENGTH} < a.length) {
        return $("#form_search [name=q]").select(), !1
    }
    return true;
});
</script>
<!-- END: main -->
