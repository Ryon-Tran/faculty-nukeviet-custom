<!-- BEGIN: main -->
<style>
/* CSS nhúng trực tiếp để chống Cache */
.news-grid-container { padding-top: 15px; width: 100%; display: block; }
.news-flex-grid { display: flex; flex-wrap: wrap; margin: 0 -10px; width: 100%; }
.news-col { width: 25%; padding: 0 10px; margin-bottom: 25px; box-sizing: border-box; }
@media (max-width: 991px) { .news-col { width: 50%; } }
@media (max-width: 767px) { .news-col { width: 100%; } }
.news-col .news-item { border: 1px solid #eaeaea; border-radius: 8px; overflow: hidden; background: #fff; height: 100%; transition: box-shadow 0.3s; }
.news-col .news-item:hover { box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
.news-col .news-img img { width: 100%; height: 180px; object-fit: cover; display: block; }
.news-col .news-content { padding: 15px; }
.news-col .news-title { font-size: 15px; font-weight: 600; line-height: 1.4; margin: 0 0 10px 0; height: 42px; overflow: hidden; }
.news-col .news-title a { color: #004b87; text-decoration: none; }
.news-col .news-title a:hover { color: #d11; }
.btn-xemthem { background-color: #0056b3; border-radius: 4px; padding: 8px 30px; font-weight: bold; border: none; color: #fff; display: inline-block; text-decoration: none; }
.btn-xemthem:hover { background-color: #004494; color: #fff; }
</style>

<div class="news-grid-container">
    <div class="news-flex-grid">
        
        <!-- Bài chính (Bài đầu tiên) -->
        <div class="news-col">
            <div class="news-item">
                <div class="news-img">
                    <a href="{main.link}" title="{main.title}"><img src="{main.imgsource}" alt="{main.title}" class="img-responsive"></a>
                </div>
                <div class="news-content">
                    <h3 class="news-title"><a href="{main.link}">{main.titleclean60}</a></h3>
                    <div class="news-time" style="color:#888; font-size:12px; margin-top:8px;">{main.publtime}</div>
                </div>
            </div>
        </div>
        
        <!-- BEGIN: othernews -->
        <div class="news-col">
            <div class="news-item">
                <div class="news-img">
                    <a href="{othernews.link}" title="{othernews.title}"><img src="{othernews.imgsource}" alt="{othernews.title}" class="img-responsive"></a>
                </div>
                <div class="news-content">
                    <h3 class="news-title"><a href="{othernews.link}">{othernews.titleclean60}</a></h3>
                    <div class="news-time" style="color:#888; font-size:12px; margin-top:8px;">{othernews.publtime}</div>
                </div>
            </div>
        </div>
        <!-- END: othernews -->
        
    </div>
    
    <div class="text-center" style="margin-top: 20px; margin-bottom: 30px; clear: both; width: 100%;">
        <a href="{NV_BASE_SITEURL}index.php?nv=tin-tuc" class="btn btn-primary btn-xemthem">Xem thêm</a>
    </div>
</div>
<!-- END: main -->
