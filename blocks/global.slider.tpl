<!-- BEGIN: main -->
<section aria-label="Banner nổi bật" class="relative w-full bg-slate-900 overflow-hidden shadow-md font-['Inter']" id="tailwind-hero-slider">
    
    <div class="slider-wrapper relative size-full">
        <!-- BEGIN: item -->
        <div class="slider-slide absolute inset-0 z-10 transition-opacity duration-1000 ease-in-out {SLIDE.active_class}" style="opacity: 0;">
            <img alt="{SLIDE.title}" class="size-full object-cover object-bottom" src="{SLIDE.image}" />
            <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent"></div>
            
            <!-- BEGIN: caption -->
            <div class="absolute inset-x-0 bottom-12 z-20 px-6 max-w-4xl mx-auto text-center flex flex-col items-center gap-3">
                <span class="bg-[#c8102e] text-white text-[11px] sm:text-xs font-bold uppercase tracking-widest px-3 py-1 rounded-full shadow-sm">
                    {SLIDE.desc}
                </span>
                <h2 class="font-['Inter'] font-black text-white text-xl sm:text-2xl md:text-3xl lg:text-4xl leading-tight m-0 drop-shadow-md tracking-tight">
                    {SLIDE.title}
                </h2>
                <!-- BEGIN: link -->
                <a href="{SLIDE.link}" class="mt-2 px-6 py-2 bg-white text-[#c8102e] font-bold rounded-full hover:bg-slate-100 transition-colors no-underline">Tìm hiểu thêm</a>
                <!-- END: link -->
            </div>
            <!-- END: caption -->
        </div>
        <!-- END: item -->
    </div>

    <!-- Pagination Bullets -->
    <div class="absolute bottom-4 left-1/2 -translate-x-1/2 flex items-center gap-2.5 z-30 slider-indicators">
        <!-- BEGIN: indicator -->
        <button aria-label="Slide {INDEX}" data-index="{INDEX}" class="slider-dot transition-all duration-300 rounded-full border-none cursor-pointer p-0 focus:outline-none focus:ring-2 focus:ring-white size-2.5 bg-white/60 hover:bg-white {SLIDE.active_dot}"></button>
        <!-- END: indicator -->
    </div>
    
    <style>
        #tailwind-hero-slider { height: 300px; }
        @media (min-width: 640px) { #tailwind-hero-slider { height: 400px; } }
        @media (min-width: 768px) { #tailwind-hero-slider { height: 500px; } }
        @media (min-width: 1024px) { #tailwind-hero-slider { height: 550px; } }
        @media (min-width: 1280px) { #tailwind-hero-slider { height: 650px; } }
        @media (min-width: 1536px) { #tailwind-hero-slider { height: 700px; } }
        .slider-slide.active { opacity: 1 !important; z-index: 20; }
        .slider-dot.active { width: 32px !important; background-color: #c8102e !important; }
    </style>
    
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var slider = document.getElementById('tailwind-hero-slider');
        if(!slider) return;
        var slides = slider.querySelectorAll('.slider-slide');
        var dots = slider.querySelectorAll('.slider-dot');
        var currentIndex = 0;
        var interval;

        if (slides.length <= 1) {
            if (slides.length === 1) slides[0].classList.add('active');
            if (dots.length > 0) dots[0].style.display = 'none';
            return;
        }

        // Initialize first
        slides[0].classList.add('active');
        dots[0].classList.add('active');

        function showSlide(index) {
            slides.forEach(function(s) { s.classList.remove('active'); });
            dots.forEach(function(d) { d.classList.remove('active'); });
            
            slides[index].classList.add('active');
            dots[index].classList.add('active');
            currentIndex = index;
        }

        function nextSlide() {
            var next = (currentIndex + 1) % slides.length;
            showSlide(next);
        }

        dots.forEach(function(dot, idx) {
            dot.addEventListener('click', function() {
                clearInterval(interval);
                showSlide(idx);
                interval = setInterval(nextSlide, 5000);
            });
        });

        interval = setInterval(nextSlide, 5000);
    });
    </script>
</section>
<!-- END: main -->
