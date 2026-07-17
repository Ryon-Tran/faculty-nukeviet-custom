<form action="{USER_LOGIN}" method="post" onsubmit="return login_validForm(this);" autocomplete="off" novalidate<!-- BEGIN: recaptcha3 --> data-recaptcha3="1"<!-- END: recaptcha3 -->>
    <div class="nv-info margin-bottom" data-default="{GLANG.logininfo}" style="text-align: center; color: #666; font-size: 14px; margin-bottom: 20px;">{GLANG.logininfo}</div>
    <div class="form-detail" style="max-width: 400px; margin: 0 auto;">
        <div class="form-group loginstep1" style="margin-bottom: 15px;">
            <div style="position: relative;">
                <em class="fa fa-user" style="position: absolute; left: 15px; top: 15px; color: #888;"></em>
                <input type="text" class="required form-control" style="width: 100%; height: 48px; padding-left: 40px; border-radius: 8px; border: 1px solid #ddd; font-size: 15px; outline: none; transition: border-color 0.2s;" placeholder="{GLANG.username_email}" value="" name="nv_login" maxlength="100" data-pattern="/^(.){1,}$/" onkeypress="validErrorHidden(this);" data-mess="{GLANG.username_empty}">
            </div>
        </div>

        <div class="form-group loginstep1" style="margin-bottom: 20px;">
            <div style="position: relative;">
                <em class="fa fa-lock" style="position: absolute; left: 15px; top: 15px; color: #888;"></em>
                <input type="password" autocomplete="off" class="required form-control" style="width: 100%; height: 48px; padding-left: 40px; border-radius: 8px; border: 1px solid #ddd; font-size: 15px; outline: none; transition: border-color 0.2s;" placeholder="{GLANG.password}" value="" name="nv_password" maxlength="100" data-pattern="/^(.){3,}$/" onkeypress="validErrorHidden(this);" data-mess="{GLANG.password_empty}">
            </div>
        </div>

        <div class="form-group loginstep2 hidden">
            <label class="margin-bottom">{GLANG.2teplogin_totppin_label}</label>
            <div class="input-group margin-bottom">
                <span class="input-group-addon"><em class="fa fa-key fa-lg fa-fix"></em></span>
                <input type="text" class="required form-control" placeholder="{GLANG.2teplogin_totppin_placeholder}" value="" name="nv_totppin" maxlength="6" data-pattern="/^(.){6,}$/" onkeypress="validErrorHidden(this);" data-mess="{GLANG.2teplogin_totppin_placeholder}">
            </div>
            <div class="text-center">
                <a href="javascript:void(0)" onclick="login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
            </div>
        </div>

        <div class="form-group loginstep3 hidden">
            <label class="margin-bottom">{GLANG.2teplogin_code_label}</label>
            <div class="input-group margin-bottom">
                <span class="input-group-addon"><em class="fa fa-key fa-lg fa-fix"></em></span>
                <input type="text" class="required form-control" placeholder="{GLANG.2teplogin_code_placeholder}" value="" name="nv_backupcodepin" maxlength="8" data-pattern="/^(.){8,}$/" onkeypress="validErrorHidden(this);" data-mess="{GLANG.2teplogin_code_placeholder}">
            </div>
            <div class="text-center">
                <a href="javascript:void(0)" onclick="login2step_change(this);">{GLANG.2teplogin_other_menthod}</a>
            </div>
        </div>

        <!-- BEGIN: captcha -->
        <div class="form-group loginCaptcha">
            <div class="middle text-center clearfix">
                <img class="captchaImg display-inline-block" src="{SRC_CAPTCHA}" width="{GFX_WIDTH}" height="{GFX_HEIGHT}" alt="{N_CAPTCHA}" title="{N_CAPTCHA}" /><em class="fa fa-pointer fa-refresh margin-left margin-right" title="{CAPTCHA_REFRESH}" onclick="change_captcha('.bsec');"></em><input type="text" style="width:100px;" class="bsec required form-control display-inline-block" name="nv_seccode" value="" maxlength="{GFX_MAXLENGTH}" placeholder="{GLANG.securitycode}" data-pattern="/^(.){{GFX_MAXLENGTH},{GFX_MAXLENGTH}}$/" onkeypress="validErrorHidden(this);" data-mess="{GLANG.securitycodeincorrect}" />
            </div>
        </div>
        <!-- END: captcha -->

        <!-- BEGIN: recaptcha -->
        <div class="form-group loginCaptcha">
            <div class="middle text-center clearfix">
                <!-- BEGIN: default --><div class="nv-recaptcha-default"><div id="{RECAPTCHA_ELEMENT}" data-toggle="recaptcha" data-pnum="4" data-btnselector="[type=submit]"></div></div><!-- END: default -->
                <!-- BEGIN: compact --><div class="nv-recaptcha-compact"><div id="{RECAPTCHA_ELEMENT}" data-toggle="recaptcha" data-pnum="4" data-btnselector="[type=submit]" data-size="compact"></div></div><!-- END: compact -->
            </div>
        </div>
        <!-- END: recaptcha -->

        <div class="text-center margin-bottom-lg" style="margin-bottom: 20px;">
            <!-- BEGIN: header --><input name="nv_header" value="{NV_HEADER}" type="hidden" /><!-- END: header -->
            <!-- BEGIN: redirect --><input name="nv_redirect" value="{REDIRECT}" type="hidden" /><!-- END: redirect -->
            <button class="bsubmit btn btn-primary" type="submit" style="width: 100%; height: 48px; background-color: #1a428a; border: none; border-radius: 8px; font-weight: 600; font-size: 16px; text-transform: uppercase; transition: background-color 0.2s;">{GLANG.loginsubmit}</button>
        </div>

        <div style="display: flex; justify-content: space-between; font-size: 14px; margin-top: 15px;">
            <!-- BEGIN: allowuserreg_linkform -->
            <a href="{USER_REGISTER}" style="color: #1a428a; font-weight: 500; text-decoration: none;">{GLANG.register}</a>
            <!-- END: allowuserreg_linkform -->
            <!-- BEGIN: allowuserreg2_form -->
            <a href="javascript:void(0)" onclick="modalShowByObj('#guestReg_{BLOCKID}', 'recaptchareset')" style="color: #1a428a; font-weight: 500; text-decoration: none;">{GLANG.register}</a>
            <!-- END: allowuserreg2_form -->
            <a href="{URL_LOSTPASS}" style="color: #666; text-decoration: none;">{GLANG.lostpass}</a>
        </div>

        <!-- BEGIN: openid -->
           <div class="text-center openid-btns">
              <!-- BEGIN: server -->
            <div class="btn-group m-bottom btn-group-justified">
                <button class="btn openid-{OPENID.server} disabled" type="button" tabindex="-1"><i class="fa fa-fw fa-{OPENID.icon}"></i></button>
                <a class="btn openid-{OPENID.server}" href="{OPENID.href}" onclick="return openID_load(this);">{LANG.login_with} {OPENID.title}</a>
            </div>
            <!-- END: server -->
           </div>
           <!-- END: openid -->
    </div>
</form>
