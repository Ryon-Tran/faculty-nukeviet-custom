<noscript>
        <div class="alert alert-danger">{LANG.nojs}</div>
    </noscript>

    
    <header class="border-b border-slate-100 w-full bg-white transition-all font-['Inter']">
      <div class="flex flex-wrap lg:flex-nowrap items-center justify-between gap-3 py-3 md:h-28 md:py-6 w-full" style="max-width: 1280px; margin: 0 auto; padding: 0 15px;">
        <!-- Brand / Logo Section -->
        <a href="{THEME_SITE_HREF}" title="{SITE_NAME}" class="flex w-auto max-w-[25%] min-w-0 gap-2.5 sm:gap-3.5 items-center shrink-0 no-underline text-left group focus:outline-none focus:ring-2 focus:ring-[#1a428a]/30 rounded-xl p-1 -ml-1 transition-transform active:scale-[0.99]">
          <style>
            .custom-logo-wrapper {
              width: 48px; height: 48px;
            }
            @media (min-width: 640px) { .custom-logo-wrapper { width: 56px; height: 56px; } }
            @media (min-width: 768px) { .custom-logo-wrapper { width: 64px; height: 64px; } }
            @media (min-width: 1024px) { .custom-logo-wrapper { width: 80px; height: 80px; } }
          </style>
          <div class="bg-[#f5f7fa] flex items-center justify-center relative rounded-full shrink-0 custom-logo-wrapper p-2 shadow-sm border border-slate-200/60 overflow-hidden group-hover:border-[#1a428a]/40 transition-colors">
            <div class="relative shrink-0 w-full h-full flex items-center justify-center">
              <img alt="{SITE_NAME}" style="max-width: 100%; max-height: 100%; object-fit: contain;" src="{LOGO_SRC}" />
            </div>
          </div>
          <style>
            @media (min-width: 1024px) {
                .desktop-massive-title { font-size: 32px !important; line-height: 1 !important; }
                .desktop-massive-desc { font-size: 12px !important; }
            }
            @media (min-width: 1280px) {
                .desktop-massive-title { font-size: 32px !important; }
                .desktop-massive-desc { font-size: 14px !important; }
            }
          </style>
          <div class="flex min-w-0 flex-col gap-2 md:gap-2 lg:gap-3 items-start leading-[normal] shrink w-full">
            <h1 class="desktop-massive-title font-['Inter'] font-bold text-[#1a428a] text-2xl sm:text-2xl md:text-4xl leading-tight tracking-[-0.01em] group-hover:text-[#c8102e] transition-colors uppercase whitespace-normal break-words">
              {SITE_NAME}
            </h1>
            <p class="desktop-massive-desc font-['Inter'] font-normal italic text-slate-500 text-sm sm:text-sm md:text-lg m-0 whitespace-normal break-words">
              {SITE_DESCRIPTION}
            </p>
          </div>
        </a>

        <!-- Mobile Hamburger Button -->
        <div class="flex items-center gap-2 shrink-0 mobile-menu-btn">
          <button type="button" aria-label="Menu" onclick="document.getElementById('main-navigation').classList.toggle('mobile-menu-active')" class="w-11 h-11 flex flex-col items-center justify-center gap-1.5 rounded-xl bg-slate-100/80 hover:bg-slate-200 active:bg-slate-300 transition-colors focus:outline-none focus:ring-2 focus:ring-[#1a428a]">
            <span class="h-0.5 w-5 bg-slate-800 rounded-full transition-transform duration-300"></span>
            <span class="h-0.5 w-5 bg-slate-800 rounded-full transition-opacity duration-300"></span>
            <span class="h-0.5 w-5 bg-slate-800 rounded-full transition-transform duration-300"></span>
          </button>
        </div>

        <!-- Vùng dành cho block tìm kiếm hoặc các block khác bên phải Header -->
        <style>
          /* Loại bỏ viền xanh/đen mặc định của trình duyệt khi click vào link/nút */
          a:focus, button:focus, input:focus {
            outline: none !important;
            box-shadow: none !important;
          }
          
          .head-right-wrapper {
             width: 100%;
          }
          @media (min-width: 1024px) {
            .head-right-wrapper {
               width: 450px !important;
               margin-left: auto !important; /* Đẩy sang phải */
               display: flex !important;
               justify-content: flex-end !important;
            }
          }
          @media (min-width: 1280px) {
            .head-right-wrapper {
               width: 550px !important;
            }
          }
          .head-right-wrapper, .head-right-wrapper > div {
            min-height: 60px !important;
            height: 100% !important;
            display: flex;
            align-items: center;
          }
          /* Khắc phục tình trạng lỗi class Tailwind chưa được biên dịch */
          .head-right-wrapper form {
            width: 100% !important;
          }
          .head-right-wrapper form div {
            background-color: #f4f5f7 !important;
            border-radius: 9999px !important;
            border: none !important;
            height: 56px !important;
            padding: 0 10px 0 20px !important;
            box-shadow: none !important;
            width: 100% !important;
            display: flex !important;
            align-items: center !important;
          }
          .head-right-wrapper input {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
            outline: none !important;
            font-size: 16px !important;
            flex: 1 !important;
            width: 100% !important;
            height: 100% !important;
            padding: 0 !important;
            color: #334155 !important;
          }
          .head-right-wrapper button {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
            cursor: pointer !important;
            color: #64748b !important;
          }
        </style>
        <div class="order-3 md:order-2 w-full lg:w-[450px] xl:w-[550px] shrink-0 flex justify-end ml-auto head-right-wrapper">
            [HEAD_RIGHT]
        </div>
      </div>
    </header>

    <!-- Navigation -->
    <style>
        .custom-nav-container {
            border-bottom: 1px solid rgba(226, 232, 240, 0.8);
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(12px);
            position: sticky;
            top: 0;
            z-index: 30;
            width: 100%;
        }
        
        .mobile-overlay { display: none; }
        .mobile-drawer-header { display: none; }
        .mobile-drawer-footer { display: none; }

        @media (max-width: 767px) {
            .custom-nav-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: transparent;
                border: none;
                pointer-events: none;
                visibility: hidden;
            }
            .custom-nav-container.mobile-menu-active {
                pointer-events: auto;
                visibility: visible;
            }
            .mobile-overlay {
                display: block;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                opacity: 0;
                transition: opacity 0.3s;
            }
            .custom-nav-container.mobile-menu-active .mobile-overlay {
                opacity: 1;
            }
            .nav-drawer {
                position: absolute;
                top: 0;
                left: -100%;
                width: 85%;
                max-width: 320px;
                height: 100%;
                background: #fff;
                transition: left 0.3s ease;
                display: flex;
                flex-direction: column;
                box-shadow: 2px 0 15px rgba(0,0,0,0.1);
            }
            .custom-nav-container.mobile-menu-active .nav-drawer {
                left: 0;
            }
            .desktop-menu-wrapper {
                padding: 0 !important;
                flex-grow: 1;
                overflow-y: auto;
                display: block;
            }
            
            .mobile-drawer-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 16px;
                border-bottom: 1px solid #f1f5f9;
            }
            .close-btn {
                background: #fff;
                border: 1px solid #e2e8f0;
                border-radius: 8px;
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #64748b;
                flex-shrink: 0;
            }
            .mobile-drawer-footer {
                display: block;
                padding: 16px;
                background: #f8fafc;
                border-top: 1px solid #f1f5f9;
                margin-top: auto;
            }
            .mobile-menu-btn { display: flex !important; }
            
            /* Ép menu thành cột dọc trên mobile */
            .nav-drawer .nv-main-menu {
                flex-direction: column !important;
                align-items: stretch !important;
                padding: 16px !important;
                gap: 6px !important;
                width: 100% !important;
            }
            .nav-drawer .nv-main-menu > li {
                width: 100% !important;
            }
            .nav-drawer .nv-main-menu > li > a {
                padding: 12px 16px !important;
                border: none !important;
                border-radius: 8px !important;
                justify-content: space-between !important;
                font-size: 14px !important;
                text-transform: capitalize !important;
                color: #475569 !important;
                display: flex !important;
                align-items: center !important;
            }
            .nav-drawer .nv-main-menu > li.active > a, 
            .nav-drawer .nv-main-menu > li.current > a {
                background-color: #c8102e !important;
                color: #ffffff !important;
                font-weight: 600 !important;
            }
            .nav-drawer .nv-main-menu > li:hover > a {
                color: #c8102e !important;
            }
            .nav-drawer .nv-main-menu > li.active:hover > a {
                background-color: #c8102e !important;
                color: #ffffff !important;
            }
            
            .nav-drawer .nv-main-menu .mobile-chevron {
                display: block !important;
            }
            .nav-drawer .nv-main-menu .menu-arrow {
                display: none !important;
            }
        }
        @media (min-width: 768px) {
            .mobile-menu-btn { display: none !important; }
            .mobile-chevron { display: none !important; }
        }
    </style>
    
    <nav id="main-navigation" aria-label="Menu chính" class="custom-nav-container font-['Inter']">
      <!-- Overlay for mobile -->
      <div class="mobile-overlay" onclick="document.getElementById('main-navigation').classList.remove('mobile-menu-active')"></div>
      
      <!-- Drawer -->
      <div class="nav-drawer">
        <!-- Mobile Drawer Header -->
        <div class="mobile-drawer-header">
            <div class="flex items-center gap-3">
                <div style="width: 60px; height: 60px; min-width: 60px; border-radius: 50%; border: 1px solid #e2e8f0; background: #f5f7fa; display: flex; align-items: center; justify-content: center; overflow: hidden; padding: 4px;">
                    <img src="{LOGO_SRC}" alt="Logo" style="max-width: 100%; max-height: 100%; object-fit: contain; display: block;" />
                </div>
                <div class="font-bold text-[#1a428a] text-[13px] leading-tight" style="white-space: normal; padding-right: 10px;">{SITE_NAME}</div>
            </div>
            <button type="button" class="close-btn" onclick="document.getElementById('main-navigation').classList.remove('mobile-menu-active')">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
            </button>
        </div>
        
        <!-- Menu Items -->
        <div class="w-full flex justify-center desktop-menu-wrapper" style="max-width: 1280px; margin: 0 auto; padding: 0 15px;">
            [MENU_SITE]
        </div>

      </div>
    </nav>

    <!-- Vùng dành riêng cho Slider / Banner toàn màn hình -->
    <div class="w-full block">
        [SLIDER]
    </div>

    [THEME_ERROR_INFO]
