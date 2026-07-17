<!-- BEGIN: main -->
<div class="student-activities-wrapper">
    <h3 class="section-title">Hoạt động sinh viên</h3>
    <!-- BEGIN: loop -->
    <div class="activity-featured">
        <a href="{ROW.link}" title="{ROW.title}">
            <img src="{ROW.thumb}" alt="{ROW.title}" class="img-responsive">
        </a>
        <div class="activity-info">
            <h4><a href="{ROW.link}">{ROW.title}</a></h4>
            <p>{ROW.hometext}</p>
            <div class="text-right">
                <a href="{ROW.link}" class="view-more">Xem thêm</a>
            </div>
        </div>
    </div>
    <!-- END: loop -->
</div>
<!-- END: main -->
