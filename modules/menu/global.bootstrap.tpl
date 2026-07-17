<!-- BEGIN: submenu -->
<ul class="py-2 list-none m-0 p-0 flex flex-col">
    <!-- BEGIN: loop -->
    <li class="relative group/sub">
        <a href="{SUBMENU.link}" title="{SUBMENU.note}"{SUBMENU.target} class="block px-4 py-2.5 text-sm font-['Inter'] text-slate-700 hover:text-[#c8102e] hover:bg-slate-50 transition-colors no-underline">
            <!-- BEGIN: icon --><img src="{SUBMENU.icon}" alt="{SUBMENU.note}" class="inline-block h-4 mr-1" /><!-- END: icon -->
            {SUBMENU.title_trim}
            <!-- BEGIN: item -->
            <svg xmlns="http://www.w3.org/2000/svg" class="absolute right-3 top-3 h-3.5 w-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
            <!-- END: item -->
        </a>
        <!-- BEGIN: item -->
        <div class="custom-submenu nested-submenu hidden group-hover/sub:block absolute left-full top-0 ml-0 z-50 bg-white shadow-lg border border-slate-100 rounded-lg min-w-[200px]">
            {SUB}
        </div>
        <!-- END: item -->
    </li>
    <!-- END: loop -->
</ul>
<!-- END: submenu -->

<!-- BEGIN: main -->
<style>
    @media (min-width: 768px) {
        .custom-main-menu {
            gap: 8px !important;
        }
        .custom-main-menu > li,
        .custom-main-menu .custom-submenu li {
            position: relative !important;
        }
        .custom-main-menu > li > a {
            min-height: 56px;
            padding: 0 18px !important;
            color: #334155 !important;
            font-size: 15px !important;
            font-weight: 700 !important;
            letter-spacing: 0.01em !important;
            text-transform: uppercase !important;
            background-color: transparent !important;
        }
        .custom-main-menu > li > a:hover,
        .custom-main-menu > li > a:focus,
        .custom-main-menu > li.active > a,
        .custom-main-menu > li.current > a {
            color: #c8102e !important;
            background-color: #f8fafc !important;
            font-weight: 800 !important;
        }
        .custom-main-menu > li > a .mobile-chevron {
            display: none !important;
        }
        .custom-main-menu .custom-submenu {
            display: none !important;
            visibility: hidden;
            opacity: 0;
            transform: translateY(6px);
            transition: opacity 0.18s ease, transform 0.18s ease;
            min-width: 230px !important;
            padding: 8px 0 !important;
            border-radius: 6px !important;
            box-shadow: 0 14px 28px rgba(15, 23, 42, 0.14) !important;
        }
        /* Cầu tàng hình giúp giữ menu không bị mất khi hover qua khoảng trống */
        .custom-main-menu .custom-submenu::before {
            content: "";
            position: absolute;
            top: -15px;
            left: 0;
            right: 0;
            height: 15px;
            background: transparent;
        }
        /* Cầu tàng hình cho menu cấp 2 trở lên (nằm ngang) */
        .custom-main-menu .nested-submenu::after {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: -15px;
            width: 15px;
            background: transparent;
        }
        .custom-main-menu > li > .custom-submenu {
            top: calc(100% + 1px) !important;
        }
        .custom-main-menu .custom-submenu ul {
            display: flex !important;
            flex-direction: column !important;
            gap: 0 !important;
            padding: 0 !important;
            margin: 0 !important;
        }
        .custom-main-menu .custom-submenu a {
            display: flex !important;
            align-items: center !important;
            min-height: 40px !important;
            padding: 10px 16px !important;
            color: #334155 !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            line-height: 1.35 !important;
            text-decoration: none !important;
            white-space: nowrap !important;
            background: #ffffff !important;
        }
        .custom-main-menu .custom-submenu a:hover,
        .custom-main-menu .custom-submenu a:focus {
            color: #c8102e !important;
            background: #f8fafc !important;
        }
        .custom-main-menu > li:hover > .custom-submenu,
        .custom-main-menu > li:focus-within > .custom-submenu,
        .custom-submenu li:hover > .nested-submenu,
        .custom-submenu li:focus-within > .nested-submenu {
            display: block !important;
            visibility: visible;
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<div class="w-full font-['Inter'] relative z-40">
    <ul class="nv-main-menu custom-main-menu flex flex-wrap items-center justify-center gap-1 lg:gap-2 m-0 p-0 list-none">
        <li class="group">
            <a href="{THEME_SITE_HREF}" title="Trang chủ" class="flex items-center px-3.5 lg:px-4 py-3.5 no-underline transition-all font-['Inter'] text-xs lg:text-[13px] capitalize tracking-wide whitespace-nowrap focus:outline-none text-slate-700 font-medium hover:text-[#c8102e] hover:bg-slate-50 hover:font-bold">
                Trang chủ
                <svg xmlns="http://www.w3.org/2000/svg" class="mobile-chevron opacity-50 ml-2" style="width: 14px; height: 14px; min-width: 14px; min-height: 14px; margin-left: auto;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
            </a>
        </li>
        <!-- BEGIN: top_menu -->
        <li class="{TOP_MENU.li_class}">
            <a href="{TOP_MENU.link}" title="{TOP_MENU.note}"{TOP_MENU.target} class="flex items-center px-3.5 lg:px-4 py-3.5 no-underline transition-all font-['Inter'] text-xs lg:text-[13px] capitalize tracking-wide whitespace-nowrap focus:outline-none text-slate-700 font-medium hover:text-[#c8102e] hover:bg-slate-50 hover:font-bold">
                <!-- BEGIN: icon --><img src="{TOP_MENU.icon}" alt="{TOP_MENU.note}" class="mr-1 h-4 w-auto" /><!-- END: icon -->
                {TOP_MENU.title_trim}
                <!-- BEGIN: has_sub -->
                <svg xmlns="http://www.w3.org/2000/svg" class="ml-1 menu-arrow" style="width: 14px; height: 14px; min-width: 14px; min-height: 14px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
                <!-- END: has_sub -->
                <svg xmlns="http://www.w3.org/2000/svg" class="mobile-chevron opacity-50 ml-2" style="width: 14px; height: 14px; min-width: 14px; min-height: 14px; margin-left: auto;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" /></svg>
            </a>
            <!-- BEGIN: sub -->
            <div class="custom-submenu hidden group-hover:block absolute top-full left-0 z-50 bg-white border border-slate-100">
                {SUB}
            </div>
            <!-- END: sub -->
        </li>
        <!-- END: top_menu -->
    </ul>
</div>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var menu = document.querySelector('.custom-main-menu');
    if (!menu) return;

    var currentPath = window.location.pathname.replace(/\/+$/, '');
    var currentParams = new URLSearchParams(window.location.search);
    var currentNv = currentParams.get('nv');
    var links = menu.querySelectorAll('a[href]');

    links.forEach(function (link) {
        var url;
        try {
            url = new URL(link.getAttribute('href'), window.location.origin);
        } catch (e) {
            return;
        }

        var linkPath = url.pathname.replace(/\/+$/, '') || '/';
        var actualCurrentPath = currentPath || '/';
        var linkNv = url.searchParams.get('nv');
        
        var isCurrentPage = false;

        if (linkNv && currentNv && linkNv === currentNv) {
            isCurrentPage = true;
        } 
        else if (linkPath === actualCurrentPath) {
            isCurrentPage = true;
        }

        if (isCurrentPage) {
            var item = link.closest('li');
            if (item) item.classList.add('current');
        }
    });

    // Hide chevron if there is no submenu
    var allChevrons = menu.querySelectorAll('.mobile-chevron');
    allChevrons.forEach(function(chevron) {
        var li = chevron.closest('li');
        if (li && !li.querySelector('.custom-submenu')) {
            chevron.style.setProperty('display', 'none', 'important');
        }
    });

    // Mobile submenu toggle using event delegation
    document.addEventListener('click', function(e) {
        var chevron = e.target.closest('.mobile-chevron');
        if (chevron && window.innerWidth < 768) {
            e.preventDefault();
            e.stopPropagation();
            
            var li = chevron.closest('li');
            var submenu = li.querySelector('.custom-submenu');
            
            if (submenu) {
                submenu.classList.toggle('active');
                chevron.style.transform = submenu.classList.contains('active') ? 'rotate(180deg)' : 'rotate(0deg)';
            }
        }
    });
});
</script>
<!-- END: main -->
