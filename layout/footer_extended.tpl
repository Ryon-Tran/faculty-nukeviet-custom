    <!-- Bắt đầu Footer React -->
    <footer class="bg-[#002452] w-full text-white mt-auto border-t border-slate-800 font-['Inter']">
      <style>
        /* Tự động làm đẹp tiêu đề Block của NukeViet trong Footer */
        .footer-cols .panel { background: transparent !important; border: none !important; box-shadow: none !important; margin: 0 !important; }
        .footer-cols .panel-heading,
        .footer-cols .panel-heading a,
        .footer-cols .panel-heading span,
        .footer-cols .panel-heading h3 {
            color: #ffcc00 !important;
            text-transform: uppercase !important;
            font-weight: 800 !important;
            font-size: 14px !important;
            text-decoration: none !important;
            line-height: 1.2 !important;
            margin: 0 !important;
        }
        .footer-cols .panel-heading {
            padding: 0 0 0 12px !important;
            margin-bottom: 20px !important;
            border-left: 3px solid #c8102e !important;
            background: transparent !important;
            border-top: none !important; border-right: none !important; border-bottom: none !important;
        }
        @media (min-width: 640px) { 
            .footer-cols .panel-heading,
            .footer-cols .panel-heading a,
            .footer-cols .panel-heading span,
            .footer-cols .panel-heading h3 { font-size: 15px !important; } 
        }
        .footer-cols .panel-body { padding: 0 !important; }
        
        /* Responsive sizes cho Cột 1 */
        .f-logo { width: 60px; height: 60px; min-width: 60px; }
        .f-site-name { font-size: 18px; }
        .f-site-desc { font-size: 13px; }
        .f-contact-icon { width: 18px; height: 18px; min-width: 18px; }
        .f-contact-text { font-size: 14px; }
        .f-menu-text { font-size: 15px; }
        
        @media (min-width: 640px) {
            .f-logo { width: 80px; height: 80px; min-width: 80px; }
            .f-site-name { font-size: 22px; }
            .f-site-desc { font-size: 15px; }
            .f-contact-icon { width: 22px; height: 22px; min-width: 22px; }
            .f-contact-text { font-size: 16px; }
            .f-menu-text { font-size: 16px; }
        }
      </style>
      <div class="w-full px-4 sm:px-6 lg:px-8 py-10 md:py-12" style="max-width: 1280px; margin: 0 auto;">
        <div class="footer-cols grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8 md:gap-10 pb-8 border-b border-white/10">
          <!-- Col 1: Brand info -->
          <div class="flex flex-col gap-5 sm:col-span-2 lg:col-span-2">
            <!-- Logo & Site Name -->
            <div class="flex items-center gap-4 sm:gap-5">
                <div class="bg-white rounded-xl p-1.5 shrink-0 flex items-center justify-center f-logo">
                    <img src="{LOGO_SRC}" alt="{SITE_NAME}" class="max-w-full max-h-full object-contain" />
                </div>
                <div class="flex flex-col gap-1 sm:gap-1.5">
                    <div class="font-bold text-white leading-tight f-site-name">{SITE_NAME}</div>
                    <div class="text-slate-300 f-site-desc">{SITE_DESCRIPTION}</div>
                </div>
            </div>

            <!-- Contact Info -->
            <ul class="flex flex-col gap-4 m-0 p-0 list-none mt-2 sm:mt-4">
                <li class="flex items-start gap-3 text-slate-300 f-contact-text">
                    <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00] mt-0.5 f-contact-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.243-4.243a8 8 0 1111.314 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                    <span>459 Tôn Đức Thắng, Phường Hòa Khánh Nam, Quận Liên Chiểu, TP. Đà Nẵng</span>
                </li>
                <li class="flex items-center gap-3 text-slate-300 f-contact-text">
                    <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00] f-contact-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" /></svg>
                    <span>+84 0236 3733 290</span>
                </li>
                <li class="flex items-center gap-3 text-slate-300 f-contact-text">
                    <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00] f-contact-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" /></svg>
                    <span>sdct@ued.udn.vn</span>
                </li>
            </ul>
          </div>

          <!-- Col 2: Chuyên mục chính -->
          <div class="flex flex-col gap-4">
            [FOOTER_COL2]
          </div>

          <!-- Col 3: Liên kết nhanh -->
          <div class="flex flex-col gap-4">
            [FOOTER_COL3]
          </div>
        </div>
      </div>
    </footer>


