<!-- BEGIN: main -->
<div class="ts-block-container">
    <div class="ts-list">
        <!-- BEGIN: loop -->
        <a href="{ROW.link}" title="{ROW.title}" class="ts-item">
            <!-- Date Badge -->
            <div class="ts-date-badge">
                <span class="ts-day">{ROW.day}</span>
                <span class="ts-month">THÁNG {ROW.month}</span>
            </div>
            <!-- Content -->
            <div class="ts-content">
                <h3 class="ts-title">{ROW.title}</h3>
                <p class="ts-desc">{ROW.hometext_clean}</p>
            </div>
        </a>
        <!-- END: loop -->
    </div>
</div>

<style>
.ts-block-container {
    width: 100% !important;
    font-family: 'Inter', system-ui, -apple-system, sans-serif !important;
}
.ts-list {
    display: flex !important;
    flex-direction: column !important;
}
.ts-item {
    display: flex !important;
    flex-direction: row !important;
    align-items: flex-start !important;
    gap: 16px !important;
    padding: 16px 0 !important;
    border-bottom: 1px solid #e2e8f0 !important;
    text-decoration: none !important;
    background: transparent !important;
    transition: all 0.2s ease !important;
}
.ts-item:last-child {
    border-bottom: none !important;
}

/* Badge styling */
.ts-date-badge {
    width: 64px !important;
    min-width: 64px !important;
    height: 64px !important;
    min-height: 64px !important;
    border-radius: 12px !important;
    background-color: #143a7c !important;
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    padding: 4px !important;
    box-sizing: border-box !important;
    flex-shrink: 0 !important;
    overflow: hidden !important;
}
.ts-item:nth-child(4) .ts-date-badge,
.ts-item:last-child:not(:first-child) .ts-date-badge {
    background-color: #c8102e !important;
}

/* Force white text inside badge so theme/link colors never override it */
.ts-date-badge .ts-day {
    color: #ffffff !important;
    font-size: 24px !important;
    font-weight: 900 !important;
    line-height: 1 !important;
    margin: 0 !important;
    padding: 0 !important;
    display: block !important;
    letter-spacing: -0.5px !important;
}
.ts-date-badge .ts-month {
    color: #ffffff !important;
    font-size: 9px !important;
    font-weight: 700 !important;
    line-height: 1 !important;
    text-transform: uppercase !important;
    margin-top: 4px !important;
    padding: 0 !important;
    display: block !important;
    white-space: nowrap !important;
    opacity: 0.95 !important;
}

/* Content styling */
.ts-content {
    flex: 1 1 0% !important;
    min-width: 0 !important;
    display: flex !important;
    flex-direction: column !important;
    padding-top: 2px !important;
}
.ts-title {
    color: #0f2c59 !important;
    font-size: 15px !important;
    font-weight: 700 !important;
    line-height: 1.4 !important;
    text-transform: uppercase !important;
    margin: 0 0 4px 0 !important;
    padding: 0 !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    overflow: hidden !important;
    transition: color 0.2s ease !important;
}
.ts-item:hover .ts-title {
    color: #c8102e !important;
}
.ts-desc {
    color: #64748b !important;
    font-size: 13px !important;
    font-weight: 400 !important;
    line-height: 1.5 !important;
    margin: 0 !important;
    padding: 0 !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 2 !important;
    -webkit-box-orient: vertical !important;
    overflow: hidden !important;
}
</style>
<!-- END: main -->
