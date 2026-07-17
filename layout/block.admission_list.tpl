<!-- BEGIN: main -->
<ul class="admission-list">
    <!-- BEGIN: loop -->
    <li class="admission-item">
        <div class="admission-date">
            <span class="day">{ROW.day}</span>
            <span class="month">{ROW.month}</span>
        </div>
        <div class="admission-info">
            <h4><a href="{ROW.link}">{ROW.title}</a></h4>
            <!-- BEGIN: hometext -->
            <p>{ROW.hometext}</p>
            <!-- END: hometext -->
        </div>
    </li>
    <!-- END: loop -->
</ul>
<!-- END: main -->
