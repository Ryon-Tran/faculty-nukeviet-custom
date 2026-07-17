<!-- BEGIN: main -->
<div class="page panel panel-default">
    <div class="panel-body">
        <h2 class="margin-bottom-lg">{LANG.user_info}</h2>
        
        <div style="display: flex; align-items: center; gap: 20px; margin-bottom: 25px;">
            <div onclick="changeAvatar('{URL_AVATAR}');" style="cursor: pointer; position: relative; flex-shrink: 0;">
                <img src="{IMG.src}" alt="{USER.username}" title="{USER.username}" style="width: 100px; height: 100px; border-radius: 50%; border: 2px solid #eee; object-fit: cover; background: #fff;" class="img-thumbnail" />
                <div style="position: absolute; bottom: 0; right: 0; background: #eee; border-radius: 50%; width: 28px; height: 28px; display: flex; align-items: center; justify-content: center; border: 1px solid #ddd;" title="{IMG.title}">
                    <em class="fa fa-camera"></em>
                </div>
            </div>
            <div style="flex-grow: 1;">
                <h3 style="margin: 0 0 10px 0; font-weight: bold; font-size: 20px;">{USER.username}</h3>
                <div class="text-muted" style="margin-bottom: 5px;"><em class="fa fa-envelope-o margin-right-sm"></em>{USER.email}</div>
                <div style="display: flex; gap: 15px; flex-wrap: wrap; color: #555;">
                    <div><em class="fa fa-shield margin-right-sm"></em>{USER.current_mode}</div>
                    <div><em class="fa fa-globe margin-right-sm"></em>{LANG.ip}: {USER.current_ip}</div>
                </div>
            </div>
        </div>

        <!-- BEGIN: crossdomain_listener -->
        <script type="text/javascript">
        function SSOReciver(event) {
            if (event.origin !== '{SSO_REGISTER_ORIGIN}') {
                return false;
            }
            location.reload();
        }
        window.addEventListener("message", SSOReciver, false);
        </script>
        <!-- END: crossdomain_listener -->

        <!-- BEGIN: change_login_note -->
        <div class="alert alert-danger">
            <em class="fa fa-exclamation-triangle margin-right-sm"></em> {USER.change_name_info}
        </div>
        <!-- END: change_login_note -->
        <!-- BEGIN: pass_empty_note -->
        <div class="alert alert-danger">
            <em class="fa fa-exclamation-triangle margin-right-sm"></em> {USER.pass_empty_note}
        </div>
        <!-- END: pass_empty_note -->
        <!-- BEGIN: question_empty_note -->
        <div class="alert alert-danger">
            <em class="fa fa-exclamation-triangle margin-right-sm"></em> {USER.question_empty_note}
        </div>
        <!-- END: question_empty_note -->

        <div class="table-responsive margin-bottom-lg">
            <table class="table table-hover" style="border-bottom: 1px solid #ddd;">
                <colgroup>
                    <col style="width:35%; font-weight: bold; color: #555;" />
                    <col style="width:65%" />
                </colgroup>
                <tbody>
                    <tr>
                        <td>{LANG.name}</td>
                        <td>{USER.full_name}</td>
                    </tr>
                    <tr>
                        <td>{LANG.birthday}</td>
                        <td>{USER.birthday}</td>
                    </tr>
                    <tr>
                        <td>{LANG.gender}</td>
                        <td>{USER.gender}</td>
                    </tr>
                    <tr>
                        <td>{LANG.showmail}</td>
                        <td>{USER.view_mail}</td>
                    </tr>
                    <tr>
                        <td>{LANG.regdate}</td>
                        <td>{USER.regdate}</td>
                    </tr>
                    <!-- BEGIN: field -->
                    <!-- BEGIN: loop -->
                    <tr>
                        <td>{FIELD.title}</td>
                        <td>{FIELD.value}</td>
                    </tr>
                    <!-- END: loop -->
                    <!-- END: field -->
                    <!-- BEGIN: group_manage -->
                    <tr>
                        <td>{LANG.group_manage_count}</td>
                        <td>{USER.group_manage} <a href="{URL_GROUPS}" title="{LANG.group_manage_list}">({LANG.group_manage_list})</a></td>
                    </tr>
                    <!-- END: group_manage -->
                    <tr>
                        <td>{LANG.st_login2}</td>
                        <td>{USER.st_login}</td>
                    </tr>
                    <tr>
                        <td>{LANG.2step_status}</td>
                        <td>{USER.active2step} (<a href="{URL_2STEP}">{LANG.2step_link}</a>)</td>
                    </tr>
                    <tr>
                        <td>{LANG.last_login}</td>
                        <td>{USER.last_login}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <ul class="nav nav-pills">
            <!-- BEGIN: navbar --><li><a href="{NAVBAR.href}"><em class="fa fa-cog margin-right-sm"></em>{NAVBAR.title}</a></li><!-- END: navbar -->
        </ul>
    </div>
</div>
<!-- END: main -->