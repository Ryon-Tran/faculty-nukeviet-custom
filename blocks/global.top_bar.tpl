<!-- BEGIN: main -->
<style>
  .custom-topbar {
    width: 100%;
    background-color: #002452;
    color: #ffffff;
    font-size: 14px;
    padding: 8px 0;
    font-family: 'Inter', sans-serif;
    border-bottom: 1px solid rgba(255,255,255,0.1);
    position: relative;
    z-index: 999999;
  }
  .custom-topbar-inner {
    max-width: 1170px;
    margin: 0 auto;
    padding: 0 15px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
  }
  .custom-topbar-left {
    display: flex;
    align-items: center;
    gap: 16px;
    font-size: 13px;
  }
  .custom-topbar-right {
    display: flex;
    align-items: center;
    gap: 16px;
  }
  .custom-topbar-socials {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .custom-topbar-divider {
    width: 1px;
    height: 14px;
    background-color: rgba(255,255,255,0.4);
  }
  .custom-topbar .custom-topbar-link,
  .custom-topbar .custom-topbar-link:link,
  .custom-topbar .custom-topbar-link:visited,
  .custom-topbar .custom-topbar-link:focus {
    color: #ffffff !important;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 6px;
    transition: color 0.2s;
    opacity: 1;
  }
  .custom-topbar .custom-topbar-link:hover {
    color: #ffd700 !important; /* Vàng sáng khi hover */
  }
  .custom-topbar .custom-topbar-user,
  .custom-topbar .custom-topbar-user:link,
  .custom-topbar .custom-topbar-user:visited,
  .custom-topbar .custom-topbar-user:focus {
    color: #ffffff !important;
    text-decoration: none;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    transition: color 0.2s;
    opacity: 1;
  }
  .custom-topbar .custom-topbar-user:hover {
    color: #ffd700 !important;
  }

  @media (max-width: 639px) {
    .custom-topbar {
      border-radius: 0 !important;
      overflow: visible !important;
      padding: 0;
    }
    .custom-topbar-inner {
      flex-direction: row;
      align-items: center;
      justify-content: space-between;
      gap: 4px;
      padding: 6px 10px;
    }
    .custom-topbar-left {
      width: auto;
      flex-direction: row;
      gap: 6px;
      font-size: 12px;
    }
    .custom-topbar-left svg {
      width: 14px !important;
      height: 14px !important;
    }
    .custom-topbar-right {
      width: auto;
      justify-content: flex-end;
      flex-wrap: nowrap;
      padding-top: 0;
      border-top: none;
      gap: 8px;
    }
    .custom-topbar-socials {
      gap: 6px;
    }
    .custom-topbar-socials svg {
      width: 14px !important;
      height: 14px !important;
    }
    .custom-topbar-user {
      font-size: 11px;
    }
    .email-block {
      display: none !important;
    }
    .custom-topbar-divider {
      display: none !important;
    }
  }
</style>

<div class="custom-topbar">
  <div class="custom-topbar-inner">
    
    <!-- Bên trái: Thông tin liên hệ -->
    <div class="custom-topbar-left">
      <!-- BEGIN: has_email -->
      <a href="mailto:{TOP_EMAIL}" class="custom-topbar-link email-block">
        <svg style="width: 16px; height: 16px; min-width: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
        <span>{TOP_EMAIL}</span>
      </a>
      <!-- END: has_email -->
      
      <!-- BEGIN: has_phone -->
      <a href="tel:{TOP_PHONE}" class="custom-topbar-link">
        <svg style="width: 16px; height: 16px; min-width: 16px;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
        <span>{TOP_PHONE}</span>
      </a>
      <!-- END: has_phone -->
    </div>
    
    <!-- Bên phải: Mạng xã hội & Hỗ trợ -->
    <div class="custom-topbar-right">
      <div class="custom-topbar-socials">
        <!-- BEGIN: has_fb -->
        <a href="{TOP_FB}" target="_blank" rel="noopener noreferrer" class="custom-topbar-link" aria-label="Facebook">
          <svg style="width: 16px; height: 16px;" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1v2h3v3h-3v6.95c5.05-.5 9-4.76 9-9.95z"></path></svg>
        </a>
        <!-- END: has_fb -->
        
        <!-- BEGIN: has_tele -->
        <a href="{TOP_TELE}" target="_blank" rel="noopener noreferrer" class="custom-topbar-link" aria-label="Telegram">
          <svg style="width: 16px; height: 16px;" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm4.64 6.8c-.15 1.58-.8 5.42-1.13 7.19-.14.75-.42 1-.68 1.03-.58.05-1.02-.38-1.58-.75-.88-.58-1.38-.94-2.23-1.5-.99-.65-.35-1.01.22-1.59.15-.15 2.71-2.48 2.76-2.69a.2.2 0 00-.05-.18c-.06-.05-.14-.03-.21-.02-.09.02-1.49.95-4.22 2.79-.4.27-.76.41-1.08.4-.36-.01-1.04-.2-1.55-.37-.63-.2-1.12-.31-1.08-.66.02-.18.27-.36.74-.55 2.92-1.27 4.86-2.11 5.83-2.51 2.78-1.16 3.35-1.36 3.73-1.36.08 0 .27.02.39.12.1.08.13.19.14.27-.01.06.01.24 0 .38z"></path></svg>
        </a>
        <!-- END: has_tele -->
        
        <!-- BEGIN: has_yt -->
        <a href="{TOP_YT}" target="_blank" rel="noopener noreferrer" class="custom-topbar-link" aria-label="YouTube">
          <svg style="width: 16px; height: 16px;" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M21.582 6.186a2.685 2.685 0 00-1.884-1.884C18.04 3.843 12 3.843 12 3.843s-6.04 0-7.698.459a2.685 2.685 0 00-1.884 1.884C1.959 7.844 1.959 12 1.959 12s0 4.156.459 5.814a2.685 2.685 0 001.884 1.884c1.658.459 7.698.459 7.698.459s6.04 0 7.698-.459a2.685 2.685 0 001.884-1.884c.459-1.658.459-5.814.459-5.814s0-4.156-.459-5.814zM9.959 15.195v-6.39l6.39 3.195-6.39 3.195z"></path></svg>
        </a>
        <!-- END: has_yt -->
      </div>
      <span class="custom-topbar-divider"></span>
      {LOGIN_DROPDOWN}
    </div>
  </div>
</div>
<!-- END: main -->
