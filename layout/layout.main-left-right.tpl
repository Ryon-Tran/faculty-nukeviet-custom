<!-- BEGIN: main -->
{FILE "header_only.tpl"}
[TOP_BAR]
{FILE "header_extended.tpl"}
<main aria-label="Nội dung chính" class="w-full flex-1 flex flex-col min-w-0 pb-12 mt-6" style="max-width: 1280px; margin: 0 auto; padding: 0 15px;">
<div class="row">
	[HEADER]
</div>
<div class="row">
	<div class="col-sm-12 col-md-13">
		[TOP]
		{MODULE_CONTENT}
		[BOTTOM]
	</div>
	<div class="col-sm-6 col-md-6 col-sm-push-6 col-md-push-5">
        [RIGHT]
    </div>
	<div class="col-sm-6 col-md-5 col-sm-pull-6 col-md-pull-6">
		[LEFT]
	</div>
</div>
<div class="row">
	[FOOTER]
</div>
</main>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->
