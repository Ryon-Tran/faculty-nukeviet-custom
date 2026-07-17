<!-- BEGIN: main -->
<div class="thongbao-container">
    <div class="thongbao-filters text-center mb-4">
        <div class="btn-group" role="group">
            <a href="{CAT.link}" class="btn btn-primary active">Tất cả</a>
            <!-- Giả lập các link chuyên mục con, người dùng có thể thay đổi link thật sau -->
            <a href="#" class="btn btn-default">Đào tạo</a>
            <a href="#" class="btn btn-default">Sinh viên</a>
            <a href="#" class="btn btn-default">Tuyển sinh</a>
            <a href="#" class="btn btn-default">Hợp tác</a>
        </div>
    </div>

    <div class="thongbao-list">
        <!-- BEGIN: viewcatloop -->
        <div class="thongbao-item panel panel-default mb-3">
            <div class="panel-body">
                <!-- BEGIN: image -->
                <div class="thongbao-img-wrap pull-left">
                    <a href="{CONTENT.link}" title="{CONTENT.title}">
                        <img alt="{HOMEIMGALT1}" src="{HOMEIMG1}" class="img-responsive img-thumbnail thongbao-img" />
                    </a>
                </div>
                <!-- END: image -->
                
                <div class="thongbao-content">
                    <div class="thongbao-meta">
                        <span class="label label-danger thongbao-label">GHIM</span>
                        <span class="thongbao-cat-name text-primary">Thông báo</span>
                    </div>
                    <h3 class="thongbao-title mt-0 mb-1">
                        <a href="{CONTENT.link}" title="{CONTENT.title}">{CONTENT.title}</a>
                        <!-- BEGIN: newday --><span class="icon_new">&nbsp;</span><!-- END: newday -->
                    </h3>
                    <div class="thongbao-date text-muted">
                        {CONTENT.publtime}
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- END: viewcatloop -->
    </div>

    <!-- BEGIN: generate_page -->
    <div class="thongbao-pagination text-center mt-4">
        {GENERATE_PAGE}
    </div>
    <!-- END: generate_page -->
</div>
<!-- END: main -->
