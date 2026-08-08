<!-- BEGIN: main -->
<div class="w-full flex flex-col gap-3 sm:gap-4">
    <!-- Main Video Section -->
    <!-- BEGIN: main_video -->
    <div class="w-full">
        <div class="relative w-full aspect-video sm:aspect-[21/9] lg:aspect-[24/9] max-h-[460px] rounded-2xl overflow-hidden shadow-xl border border-slate-200 bg-black">
            <!-- BEGIN: embed -->
            <iframe id="main-video-iframe" class="w-full h-full border-0" src="https://www.youtube.com/embed/{MAIN_VIDEO.youtube_id}?rel=0" title="{MAIN_VIDEO.title}" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <!-- END: embed -->
            <!-- BEGIN: no_embed -->
            <a href="{MAIN_VIDEO.url}" title="{MAIN_VIDEO.title}" class="group relative block w-full h-full no-underline">
                <img src="{MAIN_VIDEO.thumb}" alt="{MAIN_VIDEO.title}" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105" />
                <div class="absolute inset-0 bg-gradient-to-t from-black/85 via-black/40 to-transparent flex flex-col justify-between p-4 sm:p-6 lg:p-8">
                    <div class="self-end">
                        <span class="inline-flex items-center justify-center w-12 h-12 sm:w-16 sm:h-16 rounded-full bg-red-600/90 text-white shadow-xl">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 sm:w-8 sm:h-8 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
                        </span>
                    </div>
                    <div>
                        <span class="inline-block px-3 py-1 bg-red-600 text-white text-xs font-semibold uppercase tracking-wider rounded-md mb-2">Video Nổi Bật</span>
                        <h4 class="font-['Inter'] font-bold text-white text-lg sm:text-2xl lg:text-3xl line-clamp-2 leading-snug">{MAIN_VIDEO.title}</h4>
                    </div>
                </div>
            </a>
            <!-- END: no_embed -->
        </div>
    </div>
    <!-- END: main_video -->

    <!-- Sub Videos Grid (4 Horizontal Columns) -->
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-2.5 sm:gap-3">
        <!-- BEGIN: sub_video -->
        <div onclick="playSelectedVideo('{SUB_VIDEO.youtube_id}', '{SUB_VIDEO.url}')" class="aspect-[4/3] relative rounded-xl overflow-hidden shadow-sm group cursor-pointer block border border-slate-200 bg-slate-900 transition-all hover:scale-[1.02]">
            <img src="{SUB_VIDEO.thumb}" alt="{SUB_VIDEO.title}" class="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-110 opacity-90 group-hover:opacity-100" />
            <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent flex flex-col justify-end p-2.5 sm:p-3 text-white">
                <div class="w-7 h-7 rounded-full bg-red-600/90 flex items-center justify-center mb-1.5 shadow group-hover:scale-110 transition-transform">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-3.5 h-3.5 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
                </div>
                <h5 class="font-['Inter'] font-semibold text-[11px] sm:text-xs leading-snug line-clamp-2">{SUB_VIDEO.title}</h5>
            </div>
        </div>
        <!-- END: sub_video -->
    </div>

    <!-- BEGIN: nodata -->
    <div class="w-full flex flex-col gap-3 sm:gap-4">
        <div class="w-full">
            <div class="relative w-full aspect-video sm:aspect-[21/9] lg:aspect-[24/9] max-h-[460px] rounded-2xl overflow-hidden shadow-xl border border-slate-200 bg-black">
                <iframe id="main-video-demo-iframe" class="w-full h-full border-0" src="https://www.youtube.com/embed/HmopevVXBNI?rel=0" title="Video Giới Thiệu" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-2.5 sm:gap-3">
            <div onclick="document.getElementById('main-video-demo-iframe').src='https://www.youtube.com/embed/HmopevVXBNI?autoplay=1'" class="aspect-[4/3] relative rounded-xl overflow-hidden shadow-sm group cursor-pointer border border-slate-200 bg-slate-900 hover:scale-[1.02] transition-all">
                <img src="https://img.youtube.com/vi/HmopevVXBNI/hqdefault.jpg" alt="Video 1" class="absolute inset-0 w-full h-full object-cover opacity-90 group-hover:scale-110 transition-transform duration-500" />
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent flex flex-col justify-end p-2.5 sm:p-3 text-white">
                    <div class="w-7 h-7 rounded-full bg-red-600/90 flex items-center justify-center mb-1.5 shadow"><svg xmlns="http://www.w3.org/2000/svg" class="w-3.5 h-3.5 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg></div>
                    <h5 class="font-['Inter'] font-semibold text-[11px] sm:text-xs line-clamp-2">Giới Thiệu Khoa</h5>
                </div>
            </div>
            <div onclick="document.getElementById('main-video-demo-iframe').src='https://www.youtube.com/embed/5qap5aO4i9A?autoplay=1'" class="aspect-[4/3] relative rounded-xl overflow-hidden shadow-sm group cursor-pointer border border-slate-200 bg-slate-900 hover:scale-[1.02] transition-all">
                <img src="https://img.youtube.com/vi/5qap5aO4i9A/hqdefault.jpg" alt="Video 2" class="absolute inset-0 w-full h-full object-cover opacity-90 group-hover:scale-110 transition-transform duration-500" />
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent flex flex-col justify-end p-2.5 sm:p-3 text-white">
                    <div class="w-7 h-7 rounded-full bg-red-600/90 flex items-center justify-center mb-1.5 shadow"><svg xmlns="http://www.w3.org/2000/svg" class="w-3.5 h-3.5 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg></div>
                    <h5 class="font-['Inter'] font-semibold text-[11px] sm:text-xs line-clamp-2">Lễ Khai Giảng</h5>
                </div>
            </div>
            <div onclick="document.getElementById('main-video-demo-iframe').src='https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1'" class="aspect-[4/3] relative rounded-xl overflow-hidden shadow-sm group cursor-pointer border border-slate-200 bg-slate-900 hover:scale-[1.02] transition-all">
                <img src="https://img.youtube.com/vi/dQw4w9WgXcQ/hqdefault.jpg" alt="Video 3" class="absolute inset-0 w-full h-full object-cover opacity-90 group-hover:scale-110 transition-transform duration-500" />
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent flex flex-col justify-end p-2.5 sm:p-3 text-white">
                    <div class="w-7 h-7 rounded-full bg-red-600/90 flex items-center justify-center mb-1.5 shadow"><svg xmlns="http://www.w3.org/2000/svg" class="w-3.5 h-3.5 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg></div>
                    <h5 class="font-['Inter'] font-semibold text-[11px] sm:text-xs line-clamp-2">Hội Thảo KH</h5>
                </div>
            </div>
            <div onclick="document.getElementById('main-video-demo-iframe').src='https://www.youtube.com/embed/HmopevVXBNI?autoplay=1'" class="aspect-[4/3] relative rounded-xl overflow-hidden shadow-sm group cursor-pointer border border-slate-200 bg-slate-900 hover:scale-[1.02] transition-all">
                <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=400&auto=format&fit=crop" alt="Video 4" class="absolute inset-0 w-full h-full object-cover opacity-90 group-hover:scale-110 transition-transform duration-500" />
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent flex flex-col justify-end p-2.5 sm:p-3 text-white">
                    <div class="w-7 h-7 rounded-full bg-red-600/90 flex items-center justify-center mb-1.5 shadow"><svg xmlns="http://www.w3.org/2000/svg" class="w-3.5 h-3.5 fill-current translate-x-0.5" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg></div>
                    <h5 class="font-['Inter'] font-semibold text-[11px] sm:text-xs line-clamp-2">Hoạt Động SV</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- END: nodata -->
</div>

<script>
function playSelectedVideo(ytId, pageUrl) {
    var iframe = document.getElementById('main-video-iframe');
    if (iframe && ytId) {
        iframe.src = 'https://www.youtube.com/embed/' + ytId + '?autoplay=1';
        iframe.scrollIntoView({ behavior: 'smooth', block: 'center' });
    } else if (pageUrl) {
        window.location.href = pageUrl;
    }
}
</script>
<!-- END: main -->
