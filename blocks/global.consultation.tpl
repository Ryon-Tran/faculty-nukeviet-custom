<!-- BEGIN: main -->
<div class="w-full bg-gradient-to-br from-[#1a428a] to-[#0d2a60] rounded-3xl p-6 sm:p-10 text-white shadow-xl flex flex-col md:flex-row gap-8 items-center border border-white/10 relative overflow-hidden">
    <div class="absolute -right-20 -top-20 w-64 h-64 bg-white/5 rounded-full blur-3xl"></div>
    <div class="absolute -left-20 -bottom-20 w-64 h-64 bg-white/5 rounded-full blur-3xl"></div>
    
    <div class="flex-1 flex flex-col gap-4 relative z-10 text-center md:text-left">
        <div class="inline-flex items-center justify-center md:justify-start gap-2 text-yellow-400 font-bold text-xs uppercase tracking-widest mb-1">
            <span class="w-8 h-px bg-yellow-400/60 hidden md:block"></span>
            Hỗ trợ 24/7
        </div>
        <h3 class="font-['Inter'] font-extrabold text-2xl sm:text-3xl lg:text-4xl leading-tight m-0 drop-shadow-md">
            Đăng Ký Tư Vấn<br />Tuyển Sinh Trực Tuyến
        </h3>
        <p class="font-['Inter'] font-normal text-slate-200 text-sm sm:text-base leading-relaxed m-0 max-w-md mx-auto md:mx-0">
            Để lại thông tin để được giải đáp thắc mắc về các ngành học, phương thức xét tuyển và học phí tại Khoa.
        </p>
        <div class="flex items-center justify-center md:justify-start gap-6 mt-2 text-sm font-medium">
            <div class="flex items-center gap-2"><span class="text-lg">📞</span>0236 3733 290</div>
            <div class="flex items-center gap-2"><span class="text-lg">✉️</span>sdct@ued.udn.vn</div>
        </div>
    </div>

    <div class="w-full md:w-[400px] shrink-0 bg-white rounded-2xl p-6 shadow-2xl relative z-10 border border-slate-100">
        <form action="{NV_BASE_SITEURL}index.php?nv=contact" method="post" class="flex flex-col gap-4">
            <h4 class="font-['Inter'] font-bold text-slate-800 text-lg m-0 text-center mb-2">Thông tin đăng ký</h4>
            <div class="flex flex-col gap-1.5">
                <label class="text-xs font-semibold text-slate-600 ml-1">Họ và tên *</label>
                <input type="text" name="f_name" placeholder="Nhập họ và tên..." class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-700 focus:outline-none focus:ring-2 focus:ring-[#1a428a]/20 focus:border-[#1a428a] transition-all" required />
            </div>
            <div class="flex flex-col gap-1.5">
                <label class="text-xs font-semibold text-slate-600 ml-1">Số điện thoại *</label>
                <input type="tel" name="f_phone" placeholder="Nhập số điện thoại..." class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-700 focus:outline-none focus:ring-2 focus:ring-[#1a428a]/20 focus:border-[#1a428a] transition-all" required />
            </div>
            <div class="flex flex-col gap-1.5">
                <label class="text-xs font-semibold text-slate-600 ml-1">Ngành quan tâm</label>
                <select name="f_title" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-700 focus:outline-none focus:ring-2 focus:ring-[#1a428a]/20 focus:border-[#1a428a] transition-all appearance-none cursor-pointer">
                    <option value="Tư vấn tuyển sinh">-- Chọn ngành học --</option>
                    <option value="Tư vấn Sư phạm Lịch sử">Sư phạm Lịch sử</option>
                    <option value="Tư vấn Sư phạm Địa lý">Sư phạm Địa lý</option>
                    <option value="Tư vấn Cử nhân Địa lý">Cử nhân Địa lý (Chuyên ngành Địa lý Du lịch)</option>
                    <option value="Tư vấn Cử nhân Việt Nam học">Cử nhân Việt Nam học</option>
                    <option value="Tư vấn Sư phạm Lịch sử - Địa lý">Sư phạm Lịch sử - Địa lý</option>
                </select>
            </div>
            <input type="hidden" name="f_con" value="Yêu cầu tư vấn tuyển sinh từ trang chủ" />
            <input type="hidden" name="f_email" value="no-email@tuvan.com" />
            <input type="hidden" name="submit" value="1" />
            <button type="submit" class="w-full bg-[#c8102e] hover:bg-[#a00c24] text-white font-bold text-sm py-3.5 rounded-xl shadow-md hover:shadow-lg transition-all active:scale-[0.98] mt-2">
                Gửi Yêu Cầu Tư Vấn
            </button>
            <p class="text-[10px] text-slate-400 text-center m-0 mt-2">
                Thông tin của bạn được bảo mật tuyệt đối.
            </p>
        </form>
    </div>
</div>
<!-- END: main -->
