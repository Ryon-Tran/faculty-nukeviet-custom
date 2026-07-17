<!-- BEGIN: main -->
<div class="ts-block">
    <div class="ts-list">
        <!-- BEGIN: loop -->
        <a href="{ROW.link}" title="{ROW.title}" class="ts-item">
            <div class="ts-date">
                <span class="ts-day" data-raw="{ROW.publtime_format}">01</span>
                <span class="ts-month" data-raw="{ROW.publtime_format}">THÁNG 1</span>
            </div>
            <div class="ts-content">
                <h3 class="ts-title">{ROW.title}</h3>
                <p class="ts-desc">{ROW.hometext_clean}</p>
            </div>
        </a>
        <!-- END: loop -->
    </div>
    <div class="ts-footer">
        <a href="{CATEGORY_LINK}" class="ts-btn-more">XEM THÊM</a>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var items = document.querySelectorAll('.ts-item');
    for (var i = 0; i < items.length; i++) {
        var dayEl = items[i].querySelector('.ts-day');
        var monthEl = items[i].querySelector('.ts-month');
        if (dayEl && monthEl) {
            var raw = dayEl.getAttribute('data-raw') || '';
            var parts = raw.split('/');
            if (parts.length >= 2) {
                dayEl.textContent = parts[0].trim();
                monthEl.textContent = 'THÁNG ' + parseInt(parts[1], 10);
            }
        }
    }
});
</script>
<!-- END: main -->
