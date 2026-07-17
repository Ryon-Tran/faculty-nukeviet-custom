<!-- BEGIN: main -->
<div class="flex flex-col gap-5 font-['Inter']" itemscope itemtype="http://schema.org/LocalBusiness">
    
    <!-- Logo & Site Name -->
    <div class="flex items-center gap-4">
        <div class="bg-white rounded-xl p-1 shrink-0 flex items-center justify-center w-12 h-12 sm:w-16 sm:h-16" style="width: 64px; height: 64px; min-width: 64px;">
            <img src="{LOGO_SRC}" alt="{SITE_NAME}" class="max-w-full max-h-full object-contain" itemprop="image" />
        </div>
        <div class="flex flex-col gap-1">
            <div class="font-bold text-white text-lg sm:text-xl leading-tight" itemprop="name">{SITE_NAME}</div>
            <div class="text-slate-300 text-xs sm:text-sm">{SITE_DESCRIPTION}</div>
        </div>
    </div>

    <!-- Contact Info -->
    <ul class="flex flex-col gap-3 m-0 p-0 list-none mt-2">
        <!-- BEGIN: company_address -->
        <li class="flex items-start gap-3 text-slate-300 text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00] mt-0.5" style="width: 20px; height: 20px; min-width: 20px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.243-4.243a8 8 0 1111.314 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
            <span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress"><span itemprop="addressLocality">{DATA.company_address}</span></span>
        </li>
        <!-- END: company_address -->
        
        <!-- BEGIN: company_phone -->
        <li class="flex items-center gap-3 text-slate-300 text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00]" style="width: 20px; height: 20px; min-width: 20px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" /></svg>
            <span><!-- BEGIN: item --><!-- BEGIN: comma --> - <!-- END: comma --><!-- BEGIN: href --><a href="tel:{PHONE.href}" class="text-slate-300 hover:text-white no-underline transition-colors"><!-- END: href --><span itemprop="telephone">{PHONE.number}</span><!-- BEGIN: href2 --></a><!-- END: href2 --><!-- END: item --></span>
        </li>
        <!-- END: company_phone -->
        
        <!-- BEGIN: company_email -->
        <li class="flex items-center gap-3 text-slate-300 text-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="shrink-0 text-[#ffcc00]" style="width: 20px; height: 20px; min-width: 20px;" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" /></svg>
            <span><!-- BEGIN: item --><!-- BEGIN: comma --> - <!-- END: comma --><a href="mailto:{EMAIL}" class="text-slate-300 hover:text-white no-underline transition-colors"><span itemprop="email">{EMAIL}</span></a><!-- END: item --></span>
        </li>
        <!-- END: company_email -->
    </ul>

</div>
<!-- END: main -->
