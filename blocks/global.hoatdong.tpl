<!-- BEGIN: main -->
<div class="flex items-center justify-between gap-4 w-full">
    <h2 class="font-['Inter'] font-black text-xl sm:text-2xl lg:text-3xl m-0 uppercase tracking-tight text-[#c8102e]">
        Hoạt động sinh viên
    </h2>
    <a href="{CATEGORY_LINK}" class="font-['Inter'] font-semibold text-xs sm:text-sm text-slate-500 hover:text-[#c8102e] flex items-center gap-1 transition-colors no-underline group whitespace-nowrap">
        Xem tất cả
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="group-hover:translate-x-1 transition-transform">
            <line x1="5" y1="12" x2="19" y2="12"></line>
            <polyline points="12 5 19 12 12 19"></polyline>
        </svg>
    </a>
</div>

<!-- BEGIN: loop -->
<a href="{ROW.link}" class="no-underline group">
    <div class="bg-white flex flex-col overflow-hidden rounded-2xl border border-slate-200/60 shadow-sm transition-all duration-300 hover:-translate-y-1.5 hover:shadow-lg hover:border-[#1a428a]/20 h-full">
        <div class="aspect-video relative w-full bg-slate-100 overflow-hidden shrink-0">
            <img src="{ROW.thumb}" alt="{ROW.title}" class="absolute inset-0 object-cover size-full group-hover:scale-105 transition-transform duration-500 ease-out" />
            <div class="absolute top-3 left-3 px-2.5 py-1 rounded-md text-[10px] font-bold uppercase tracking-wider text-white shadow-sm backdrop-blur-md bg-[#1a428a]">
                Hoạt động nổi bật
            </div>
        </div>
        <div class="p-5 sm:p-6 flex flex-col gap-2.5 flex-1 bg-gradient-to-b from-white to-slate-50/30">
            <h3 class="font-['Inter'] font-extrabold text-lg sm:text-xl text-slate-800 m-0 leading-snug line-clamp-2 group-hover:text-[#1a428a] transition-colors">
                {ROW.title}
            </h3>
            <p class="font-['Inter'] font-normal text-sm mt-1 text-slate-500 line-clamp-3 m-0">
                {ROW.hometext_clean}
            </p>
        </div>
    </div>
</a>
<!-- END: loop -->
<!-- END: main -->
