<!-- BEGIN: main -->
{FILE "header_only.tpl"}
[TOP_BAR]
{FILE "header_extended.tpl"}
<main aria-label="Nội dung chính" class="w-full flex-1 flex flex-col min-w-0 pb-12 mt-6" style="max-width: 1280px; margin: 0 auto; padding: 0 15px;">
<div class="row">
	<div class="col-md-24">
		[HEADER]
	</div>
</div>
<div class="row">
	<div class="col-sm-16 col-md-18">
		[TOP]
		{MODULE_CONTENT}
		[BOTTOM]
	</div>
	<div class="col-sm-8 col-md-6">
		[RIGHT]
	</div>
</div>
<div class="row">
		[FOOTER]
</div>
</main>
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->
