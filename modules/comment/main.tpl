<!-- BEGIN: main -->
<!-- BEGIN: header -->
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE_JS}/js/comment.js"></script>
<link rel="StyleSheet" href="{NV_BASE_SITEURL}themes/{TEMPLATE_CSS}/css/comment.css" type="text/css" />
<!-- END: header -->
<div id="idcomment" class="nv-fullbg" data-module="{MODULE_COMM}" data-content="{MODULE_DATA}_commentcontent" data-area="{AREA_COMM}" data-id="{ID_COMM}" data-allowed="{ALLOWED_COMM}" data-checkss="{CHECKSS_COMM}">
    <div class="row clearfix margin-bottom-lg" style="border-bottom: 2px solid #1a408b; padding-bottom: 12px; margin-bottom: 20px; display: flex; align-items: center;">
        <div class="col-sm-12 col-xs-24 text-left">
            <h3 class="comment-title" style="margin: 0; font-size: 18px; font-weight: bold; color: #1a408b; text-transform: uppercase;">
                <em class="fa fa-comments" style="margin-right: 5px;">&nbsp;</em> {LANG.comment}
            </h3>
        </div>
        <div class="col-sm-12 col-xs-24 text-right" style="display: flex; justify-content: flex-end; gap: 10px;">
            <select class="form-control" onchange="nv_comment_sort_change(event, this)" style="border-radius: 4px; border: 1px solid #ddd; display: inline-block; width: auto; background-color: #f9f9f9;">
                <!-- BEGIN: sortcomm -->
                <option value="{OPTION.key}"{OPTION.selected}>{OPTION.title}</option>
                <!-- END: sortcomm -->
            </select>
            <button type="button" class="btn btn-default btn-sm" style="border-radius: 4px; border-color: #ddd; background-color: #f9f9f9;" onclick="$('.fa', this).toggleClass('fa-eye fa-eye-slash'),nv_show_hidden('showcomment',2);" title="{LANG.comment_hide_show}">
                <em class="fa fa-eye-slash"></em>
            </button>
        </div>
    </div>
    <div id="showcomment" class="margin-bottom-lg">{COMMENTCONTENT}</div>
    <div id="formcomment" class="comment-form">
        <!-- BEGIN: allowed_comm -->
        <form method="post" role="form" target="submitcommentarea" action="{FORM_ACTION}" onsubmit="return nv_comment_submit(this);" autocomplete="off" novalidate data-gfxnum="{GFX_NUM}" data-editor="{EDITOR_COMM}"{ENCTYPE}<!-- BEGIN: recaptcha3 --> data-recaptcha3="1"<!-- END: recaptcha3 -->>
            <input type="hidden" name="module" value="{MODULE_COMM}" />
            <input type="hidden" name="area" value="{AREA_COMM}" />
            <input type="hidden" name="id" value="{ID_COMM}" />
            <input type="hidden" name="pid" value="0" />
            <input type="hidden" name="allowed" value="{ALLOWED_COMM}" />
            <input type="hidden" name="checkss" value="{CHECKSS_COMM}" />
            <div class="form-group clearfix" style="margin-bottom: 20px;">
                <div class="row">
                    <div class="col-sm-12 col-xs-24" style="margin-bottom: 10px;">
                        <input type="text" name="name" value="{NAME}" {DISABLED} class="form-control" placeholder="{LANG.comment_name}" style="height: 48px; border-radius: 6px; border: 1px solid #e0e0e0; background: #fafafa; font-size: 15px; box-shadow: none;" />
                    </div>
                    <div class="col-sm-12 col-xs-24" style="margin-bottom: 10px;">
                        <input type="email" name="email" value="{EMAIL}" {DISABLED} class="form-control" placeholder="{LANG.comment_email}" style="height: 48px; border-radius: 6px; border: 1px solid #e0e0e0; background: #fafafa; font-size: 15px; box-shadow: none;" />
                    </div>
                </div>
            </div>
            <div class="form-group clearfix">
                <textarea class="form-control" style="width: 100%; border-radius: 6px; border: 1px solid #e0e0e0; padding: 15px; background: #fafafa; font-size: 15px; box-shadow: none; resize: vertical;" name="content" id="commentcontent" cols="20" rows="5" placeholder="Mời bạn để lại bình luận..."></textarea>
                <!-- BEGIN: editor -->
                <link rel="stylesheet" href="{NV_STATIC_URL}{NV_EDITORSDIR}/ckeditor5-classic/ckeditor.css?t={TIMESTAMP}">
                <script type="text/javascript" src="{NV_STATIC_URL}{NV_EDITORSDIR}/ckeditor5-classic/ckeditor.js?t={TIMESTAMP}"></script>
                <script type="text/javascript" src="{NV_STATIC_URL}{NV_EDITORSDIR}/ckeditor5-classic/language/{NV_LANG_INTERFACE}.js?t={TIMESTAMP}"></script>
                <script type="text/javascript">
                (async () => {
                    await ClassicEditor
                    .create(document.getElementById("commentcontent"), {
                        language: '{NV_LANG_INTERFACE}',
                        removePlugins: ["NVBox"],
                        image: {insert: {integrations: ["url"]}},
                        nvmedia: {insert: {integrations: ["url"]}},
                        toolbar: {
                            items: [
                                'undo',
                                'redo',
                                'selectAll',
                                '|',
                                'link',
                                'bookmark',
                                'imageInsert',
                                'nvmediaInsert',
                                'insertTable',
                                'nviframeInsert',
                                'nvdocsInsert',
                                'code',
                                'codeBlock',
                                'horizontalLine',
                                'specialCharacters',
                                'pageBreak',
                                '|',
                                'findAndReplace',
                                'showBlocks',
                                '|',
                                'bulletedList',
                                'numberedList',
                                'outdent',
                                'indent',
                                'blockQuote',
                                'heading',
                                'fontSize',
                                'fontFamily',
                                'fontColor',
                                'fontBackgroundColor',
                                'highlight',
                                'alignment',
                                '|',
                                'bold',
                                'italic',
                                'underline',
                                'emoji',
                                'strikethrough',
                                'subscript',
                                'superscript',
                                '|',
                                'sourceEditing',
                                'nvtools',
                                'removeFormat',
                                'fullscreen'
                            ],
                            shouldNotGroupWhenFull: false
                        },
                        nukeviet: {
                            editorId: 'commentcontent'
                        }
                    }).then(editor => {
                        editor.editing.view.document.on('keydown', (event, data) => {
                            if (data.ctrlKey && data.keyCode == 13) {
                                $('#formcomment form').submit();
                            }
                        });
                    }).catch(error => {
                        console.error(error);
                    });
                })();
                </script>
                <!-- END: editor -->
            </div>
            <!-- BEGIN: attach -->
            <div class="form-group">
                <div class="row">
                    <label class="col-sm-8 col-md-6 control-label">{LANG.attach}</label>
                    <div class="col-sm-16 col-md-18">
                        <input type="file" name="fileattach" />
                    </div>
                </div>
            </div>
            <!-- END: attach -->
            <!-- BEGIN: captcha -->
            <div class="form-group clearfix">
                <label class="hidden-xs">{LANG.comment_seccode}</label>
                <div class="row">
                    <div class="col-xs-12">
                        <img class="captchaImg" alt="{N_CAPTCHA}" src="{SRC_CAPTCHA}" width="{GFX_WIDTH}" height="{GFX_HEIGHT}" /> &nbsp;<em class="fa fa-pointer fa-refresh fa-lg" onclick="change_captcha('#commentseccode');">&nbsp;</em>
                    </div>
                    <div class="col-xs-12">
                        <input id="commentseccode" type="text" class="form-control" maxlength="{GFX_NUM}" name="code" />
                    </div>
                </div>
            </div>
            <!-- END: captcha -->
            <!-- BEGIN: recaptcha -->
            <div class="form-group clearfix">
                <div class="nv-recaptcha-default">
                    <div id="{RECAPTCHA_ELEMENT}" data-toggle="recaptcha" data-pnum="3" data-btnselector="[type=submit]"></div>
                </div>
            </div>
            <!-- END: recaptcha -->
            <div class="form-group text-center" style="margin-top: 25px; padding-bottom: 20px;">
                <input type="button" value="{GLANG.reset}" class="reset btn btn-default" style="padding: 10px 30px; border-radius: 30px; border: 1px solid #ccc; font-weight: 600; color: #555; background: #fff; margin-right: 15px; transition: all 0.3s;" onclick="nv_comment_reset(event, this.form);" onmouseover="this.style.background='#f0f0f0'" onmouseout="this.style.background='#fff'" /> 
                <input type="submit" value="{LANG.comment_submit}" class="btn btn-primary" style="padding: 10px 35px; border-radius: 30px; background-color: #1a408b; border-color: #1a408b; font-weight: bold; font-size: 15px; box-shadow: 0 4px 10px rgba(26,64,139,0.3); transition: all 0.3s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='translateY(0)'" />
            </div>
        </form>
        <iframe class="hidden" id="submitcommentarea" name="submitcommentarea"></iframe>
        <!-- END: allowed_comm -->
        <!-- BEGIN: form_login-->
        <div class="alert alert-danger fade in">
            <!-- BEGIN: message_login -->
            <a title="{GLANG.loginsubmit}" href="#" onclick="return loginForm('');">{LOGIN_MESSAGE}</a>
            <!-- END: message_login -->
            <!-- BEGIN: message_register_group -->
            {LANG_REG_GROUPS}
            <!-- END: message_register_group -->
        </div>
        <!-- END: form_login -->
    </div>
</div>
<!-- END: main -->
