<!-- BEGIN: main -->
<div class="login-dropdown-wrapper" style="position: relative; display: inline-block;">
    <a href="javascript:void(0);" class="login-dropdown-toggle custom-topbar-user" style="display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600; text-decoration: none; padding: 5px 0; transition: all 0.2s;">
        <em class="fa fa-user fa-lg"></em> <span class="hidden-xs">ĐĂNG NHẬP</span>
    </a>
    
    <div class="login-dropdown-content" style="position: absolute; right: 0; top: 120%; width: 340px; background: white; box-shadow: 0 10px 40px rgba(0,0,0,0.15); border-radius: 12px; padding: 25px; z-index: 999999; opacity: 0; visibility: hidden; transform: translateY(-10px); transition: all 0.3s ease; border: 1px solid #eee;">
        <h3 style="margin-top: 0; font-size: 18px; color: #333; text-align: center; margin-bottom: 20px; font-weight: bold;">Đăng nhập hệ thống</h3>
        <!-- BEGIN: display_form -->
        {FILE "login_form.tpl"}
        <!-- END: display_form -->
        
        <!-- BEGIN: display_button -->
        {FILE "login_form.tpl"}
        <!-- END: display_button -->
    </div>
</div>

<style>
/* Cầu tàng hình chống mất hover do khoảng trống (gap) */
.login-dropdown-wrapper .login-dropdown-content::before {
    content: "";
    position: absolute;
    top: -30px; /* Bù đắp khoảng trống do top: 120% */
    left: 0;
    right: 0;
    height: 30px;
    background: transparent;
}
.login-dropdown-wrapper:hover .login-dropdown-content,
.login-dropdown-wrapper.active .login-dropdown-content {
    opacity: 1 !important;
    visibility: visible !important;
    transform: translateY(0) !important;
}
.login-dropdown-wrapper:hover .login-dropdown-toggle,
.login-dropdown-wrapper.active .login-dropdown-toggle {
    background: #1a428a !important;
    color: white !important;
}
.login-dropdown-wrapper .login-dropdown-content .panel,
.login-dropdown-wrapper .login-dropdown-content .panel-body {
    border: none !important; box-shadow: none !important; background: transparent !important; padding: 0 !important;
}
.login-dropdown-wrapper .login-dropdown-content input.form-control {
    border-radius: 8px;
    height: 42px;
}
.login-dropdown-wrapper .login-dropdown-content button[type="submit"] {
    width: 100%;
    border-radius: 8px;
    height: 42px;
    background: #c8102e;
    border: none;
    font-weight: bold;
    text-transform: uppercase;
}
.login-dropdown-wrapper .login-dropdown-content button[type="submit"]:hover {
    background: #a00d25;
}
</style>

<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{BLOCK_JS}/js/users.js"></script>
<script>
$(document).ready(function() {
    $('.login-dropdown-toggle').on('click', function(e) {
        e.preventDefault();
        var wrapper = $(this).closest('.login-dropdown-wrapper');
        $('.login-dropdown-wrapper').not(wrapper).removeClass('active');
        wrapper.toggleClass('active');
    });
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.login-dropdown-wrapper').length) {
            $('.login-dropdown-wrapper').removeClass('active');
        }
    });
});
</script>
<!-- END: main -->

<!-- BEGIN: signed -->
<div class="login-dropdown-wrapper signed" style="position: relative; display: inline-block;">
    <a href="javascript:void(0);" class="login-dropdown-toggle custom-topbar-user" style="display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600; text-decoration: none; padding: 5px 0; transition: all 0.2s;">
        <em class="fa fa-user fa-lg"></em>
    </a>
    <div class="login-dropdown-content" style="position: absolute; right: 0; top: 120%; width: 280px; background: white; box-shadow: 0 10px 40px rgba(0,0,0,0.15); border-radius: 12px; padding: 20px; z-index: 999999; opacity: 0; visibility: hidden; transform: translateY(-10px); transition: all 0.3s ease; border: 1px solid #eee;">
        
        <div class="text-center margin-bottom-lg" style="padding-bottom: 15px; border-bottom: 1px solid #f0f0f0; margin-bottom: 15px;">
            <div style="font-size: 16px; font-weight: bold; color: #333;">{USER.full_name}</div>
            <div style="font-size: 13px; color: #777;">Thành viên</div>
        </div>
        
        <ul class="nv-list-item sm" style="list-style: none; padding: 0; margin: 0 0 15px 0;">
            <li style="padding: 8px 10px; border-radius: 6px; transition: background 0.2s;"><a href="{URL_MODULE}" style="color: #333; text-decoration: none; display: block;"><em class="fa fa-user margin-right-sm"></em> {LANG.user_info}</a></li>
            <li style="padding: 8px 10px; border-radius: 6px; transition: background 0.2s;"><a href="{URL_HREF}editinfo" style="color: #333; text-decoration: none; display: block;"><em class="fa fa-edit margin-right-sm"></em> {LANG.editinfo}</a></li>
            <!-- BEGIN: admintoolbar -->
            <li style="padding: 8px 10px; border-radius: 6px; transition: background 0.2s; border-top: 1px solid #eee; margin-top: 5px;"><a href="{NV_BASE_SITEURL}{NV_ADMINDIR}/index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}" style="color: #c8102e; font-weight: bold; text-decoration: none; display: block;"><em class="fa fa-cog margin-right-sm"></em> {GLANG.admin_page}</a></li>
            <!-- END: admintoolbar -->
        </ul>
        
        <div style="border-top: 1px solid #f0f0f0; margin-top: 15px; padding-top: 15px; text-align: center;">
            <button type="button" class="btn btn-default" style="width: 100%; border-radius: 8px; font-weight: 500;" onclick="{URL_LOGOUT}(this);"><em class="icon-exit"></em> {LANG.logout_title}</button>
        </div>
    </div>
</div>
<style>
/* Cầu tàng hình chống mất hover do khoảng trống (gap) */
.login-dropdown-wrapper .login-dropdown-content::before {
    content: "";
    position: absolute;
    top: -30px; /* Bù đắp khoảng trống do top: 120% */
    left: 0;
    right: 0;
    height: 30px;
    background: transparent;
}
.login-dropdown-wrapper:hover .login-dropdown-content,
.login-dropdown-wrapper.active .login-dropdown-content {
    opacity: 1 !important;
    visibility: visible !important;
    transform: translateY(0) !important;
}
.login-dropdown-wrapper:hover .login-dropdown-toggle,
.login-dropdown-wrapper.active .login-dropdown-toggle {
    background: #1a428a !important;
    color: white !important;
}
.login-dropdown-content ul li:hover {
    background: #f8f9fa;
}
</style>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{BLOCK_JS}/js/users.js"></script>
<script>
$(document).ready(function() {
    $('.login-dropdown-toggle').on('click', function(e) {
        e.preventDefault();
        var wrapper = $(this).closest('.login-dropdown-wrapper');
        $('.login-dropdown-wrapper').not(wrapper).removeClass('active');
        wrapper.toggleClass('active');
    });
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.login-dropdown-wrapper').length) {
            $('.login-dropdown-wrapper').removeClass('active');
        }
    });
});
</script>
<!-- END: signed -->
