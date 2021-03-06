<#compress >
    <#include "module/_macro.ftl">
    <@head title="${options.blog_title} | Sour后台管理-网站设置"></@head>
    <!-- bootstrap-switch -->
    <link rel="stylesheet" href="/static/plugins/bootstrap-switch/css/bootstrap3/bootstrap-switch.min.css">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">

    <!-- Content Wrapper. Contains page content -->
    <div class="wrapper">

        <!-- 导航栏模块 -->
        <#include "module/_navbar.ftl">

        <!-- 侧边栏模块 -->
        <#include "module/_sidebar.ftl">

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">系统</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item"><a data-pjax="true" href="#">系统</a></li>
                                <li class="breadcrumb-item active">网站设置</li>
                            </ol>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-12 col-sm-12">
                            <div class="card card-default card-outline card-tabs">
                                <div class="card-header p-0 border-bottom-0">
                                    <ul class="nav nav-tabs">

                                        <!-- 常规设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link active" id="common-settings-tab" data-toggle="pill"
                                               href="#common-settings" role="tab" aria-controls="common-settings"
                                               aria-selected="true">常规设置</a>
                                        </li>

                                        <!-- SEO设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="seo-settings-tab" data-toggle="pill"
                                               href="#seo-settings" role="tab" aria-controls="seo-settings"
                                               aria-selected="false">SEO设置</a>
                                        </li>

                                        <!-- 文章设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="post-settings-tab" data-toggle="pill"
                                               href="#post-settings" role="tab" aria-controls="post-settings"
                                               aria-selected="false">文章设置</a>
                                        </li>

                                        <!-- 评论设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="comment-settings-tab" data-toggle="pill"
                                               href="#comment-settings" role="tab" aria-controls="comment-settings"
                                               aria-selected="false">评论设置</a>
                                        </li>

                                        <!-- 后台设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="backstage-settings-tab" data-toggle="pill"
                                               href="#backstage-settings" role="tab" aria-controls="backstage-settings"
                                               aria-selected="false">后台设置</a>
                                        </li>

                                        <!-- 其他设置 -->
                                        <li class="nav-item">
                                            <a class="nav-link" id="other-settings-tab" data-toggle="pill"
                                               href="#other-settings" role="tab" aria-controls="other-settings"
                                               aria-selected="false">其他设置</a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="card-body">
                                    <div class="tab-content">

                                        <!-- 常规设置-->
                                        <form action="javascript://;" method="post" class="tab-pane fade show active"
                                              id="common-settings" aria-labelledby="common-settings-tab"
                                              aria-selected="true">
                                            <div class="form-group col-sm-6">
                                                <label for="blogTitle">* 博客标题：</label>
                                                <input type="text" class="form-control" id="blogTitle" name="blog_title"
                                                       value="${options.blog_title!}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="blogUrl">* 博客地址：</label>
                                                <input type="text" class="form-control" id="blogUrl" name="blog_url"
                                                       value="${options.blog_url!'http://localhost:8080'}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="blogLogo">Logo：</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="blogLogo"
                                                           name="blog_logo"
                                                           data-bs-target="#logo" value="${options.blog_logo!}">
                                                    <div class="input-group-append" data-bs-target="#logo"
                                                         data-toggle="datetimepicker" onclick="openAttach('blogLogo')">
                                                        <button class="btn btn-default" type="button">
                                                            选择
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="footerInfo">页脚信息：</label>
                                                <textarea class="form-control" rows="5" id="blogFooterInfo"
                                                          name="blog_footer_info"
                                                          style="resize: none;">${options.blog_footer_info!}</textarea>
                                            </div>
                                            <div class="card-footer">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                        onclick="saveOptions('common-settings')">保存
                                                </button>
                                            </div>
                                        </form>

                                        <!-- SEO设置 -->
                                        <form action="javascript://;" method="post" class="tab-pane fade"
                                              id="seo-settings" role="tabpanel"
                                              aria-labelledby="seo-settings-tab" aria-selected="true">
                                            <div class="form-group col-sm-6">
                                                <label for="keywords">关键词：</label>
                                                <input type="text" class="form-control" id="keywords"
                                                       placeholder="">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="siteDesc">站点描述：</label>
                                                <input type="text" class="form-control" id="siteDesc"
                                                       placeholder="">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="baiduToken">百度推送Token：</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="baiduToken"
                                                           data-bs-target="#logo">
                                                    <div class="input-group-append" data-bs-target="#logo"
                                                         data-toggle="datetimepicker" onclick="openAttach()">
                                                        <button class="btn btn-default" type="button">
                                                            推送
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                        onclick="saveOptions('seo-settings');">保存
                                                </button>
                                            </div>
                                        </form>

                                        <!-- 文章设置 -->
                                        <form action="javascript://;" method="post" class="tab-pane fade"
                                              id="post-settings" role="tabpanel"
                                              aria-labelledby="post-settings-tab" aria-selected="true">
                                            <div class="form-group col-sm-6">
                                                <label for="indexPosts">首页显示条数：</label>
                                                <input type="text" class="form-control" id="indexPosts"
                                                       name="index_posts"
                                                       value="${options.index_posts!'10'}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="rssPosts">RSS显示条数：</label>
                                                <input type="text" class="form-control" id="rssPosts" name="rss_posts"
                                                       value="${options.rss_posts!}">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="postSummary">文章摘要字数：</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="postSummary"
                                                           name="post_summary"
                                                           data-bs-target="#logo" value="${options.post_summary!'50'}">
                                                    <div class="input-group-append" data-bs-target="#logo"
                                                         data-toggle="datetimepicker" onclick="updateAllSummary();">
                                                        <button class="btn btn-default" type="button">
                                                            更新
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                        onclick="saveOptions('post-settings');">保存
                                                </button>
                                            </div>
                                        </form>

                                        <!-- 评论设置 -->
                                        <form action="javascript://;" method="post" class="tab-pane fade"
                                              id="comment-settings" role="tabpanel"
                                              aria-labelledby="comment-settings-tab" aria-selected="true">
                                            <div class="form-group row">
                                                <label for="commentSystem" class="col-sm-2">评论系统：</label>
                                                <div class="col-sm-4">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" id="commentSystem"
                                                               name="comment_system" value="native">
                                                        <label class="form-check-label">原生</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" id="commentSystem"
                                                               name="comment_system" value="valine">
                                                        <label class="form-check-label">Valine</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" id="commentSystem"
                                                               name="comment_system" value="disqus">
                                                        <label class="form-check-label">Disqus</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" id="commentSystem"
                                                               name="comment_system" value="livere">
                                                        <label class="form-check-label">Livere</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" id="commentSystem"
                                                               name="comment_system" value="changyan">
                                                        <label class="form-check-label">畅言</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 原生设置 -->
                                            <div class="native-options" style="display: none;">
                                                <div class="form-group row">
                                                    <label for="commentSystem" class="col-sm-2">是否启用：</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-check-inline">
                                                            <input class="form-check-input" type="radio"
                                                                   id="commentSystem"
                                                                   name="comment_system" value="native">
                                                            <label class="form-check-label">启用</label>
                                                        </div>
                                                        <div class="form-check-inline">
                                                            <input class="form-check-input" type="radio"
                                                                   id="commentSystem"
                                                                   name="comment_system" value="native">
                                                            <label class="form-check-label">禁用</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- valine选项 -->
                                            <div class="valine-options" style="display: none;">
                                                <div class="form-group">
                                                    <label for="valineAppId">APP ID：</label>
                                                    <input type="text" class="form-control col-sm-6" id="valineAppId"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="valineAppKey">APP KEY：</label>
                                                    <input type="text" class="form-control col-sm-6" id="valineAppKey"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="valineAvatar">头像类型：</label>
                                                    <input type="text" class="form-control col-sm-6" id="valineAvatar"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="valinePlaceholder">占位提示：</label>
                                                    <input type="text" class="form-control col-sm-6"
                                                           id="valinePlaceholder"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="valineCss">自定义CSS：</label>
                                                    <textarea class="form-control col-sm-6" rows="5" id="valineCss"
                                                              style="resize: none;"></textarea>
                                                </div>
                                            </div>

                                            <!-- disqus选项 -->
                                            <div class="disqus-options" style="display: none;">
                                                <div class="form-group">
                                                    <label for="disqusShortName">DisqusShortName：</label>
                                                    <input type="text" class="form-control col-sm-6"
                                                           id="disqusShortName"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="disqusCss">自定义CSS：</label>
                                                    <textarea class="form-control col-sm-6" rows="5" id="disqusCss"
                                                              style="resize: none;"></textarea>
                                                </div>
                                            </div>

                                            <!-- livere选项 -->
                                            <div class="livere-options" style="display: none;">
                                                <div class="form-group">
                                                    <label for="livereDataUid">livere data-uid：</label>
                                                    <input type="text" class="form-control col-sm-6" id="livereDataUid"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="livereCss">自定义CSS：</label>
                                                    <textarea class="form-control col-sm-6" rows="5" id="livereCss"
                                                              style="resize: none;"></textarea>
                                                </div>
                                            </div>

                                            <!-- 畅言选项 -->
                                            <div class="changyan-options" style="display: none;">
                                                <div class="form-group">
                                                    <label for="changyanAppId">APP ID：</label>
                                                    <input type="text" class="form-control col-sm-6" id="changyanAppId"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="changyanConf">CONF：</label>
                                                    <input type="text" class="form-control col-sm-6" id="changyanConf"
                                                           placeholder="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="changyanCss">自定义CSS：</label>
                                                    <textarea class="form-control col-sm-6" rows="5" id="changyanCss"
                                                              style="resize: none;"></textarea>
                                                </div>
                                            </div>

                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-primary btn-sm">保存</button>
                                            </div>
                                        </form>

                                        <!-- 后台设置 -->
                                        <form action="javascript://;" method="post" class="tab-pane fade"
                                              id="backstage-settings" role="tabpanel"
                                              aria-labelledby="backstage-settings-tab" aria-selected="true">
                                            <div class="form-group row">
                                                <label for="adminPjax" class="col-sm-2">启动pjax：</label>
                                                <div class="col-sm-4">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="admin_pjax"
                                                               value="true">
                                                        <label class="form-check-label">启动</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="admin_pjax"
                                                               value="false">
                                                        <label class="form-check-label">禁用</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="adminLayout" class="col-sm-2">后台布局：</label>
                                                <div class="col-sm-4">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="admin_layout"
                                                               value="" ${((options.admin_layout!'')=='')?string('checked','')}>
                                                        <label class="form-check-label">正常布局</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="admin_layout"
                                                               value="layout-boxed" ${((options.admin_layout!'')=='layout-boxed')?string('checked','')}>
                                                        <label class="form-check-label">盒子布局</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="adminTheme" class="col-sm-2">后台主题：</label>
                                                <select class="form-control select2-blue col-sm-4" style="width: 100%;"
                                                        name="" id="adminTheme">
                                                    <option selected="selected">默认主题</option>
                                                    <option>上篮左白</option>
                                                    <option>上白左黑</option>
                                                    <option>上白左白</option>
                                                    <option>上绿左黑</option>
                                                    <option>上绿左白</option>
                                                    <option>上紫左黑</option>
                                                    <option>上紫左白</option>
                                                </select>
                                            </div>
                                            <div class="form-group row">
                                                <label for="sidebarStyle" class="col-sm-2">侧边栏样式：</label>
                                                <div class="col-sm-4">
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="sidebar_style"
                                                               value="" ${((options.sidebar_style!'')=='')?string('checked','')}>
                                                        <label class="form-check-label">展开</label>
                                                    </div>
                                                    <div class="form-check-inline">
                                                        <input class="form-check-input" type="radio" name="sidebar_style"
                                                               value="sidebar-collapse" ${((options.sidebar_style!'')=='sidebar-collapse')?string('checked','')}>
                                                        <label class="form-check-label">收拢</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="postEditor" class="col-sm-2">文章编辑器：</label>
                                                <select class="form-control select2-blue col-sm-4" style="width: 100%;"
                                                        name="" id="postEditor">
                                                    <option selected="selected">Markdown</option>
                                                    <option>富文本</option>
                                                </select>
                                            </div>
                                            <div class="form-group row">
                                                <label for="pageEditor" class="col-sm-2">页面编辑器：</label>
                                                <select class="form-control select2-blue col-sm-4" style="width: 100%;"
                                                        name="" id="pageEditor">
                                                    <option selected="selected">Markdown</option>
                                                    <option>富文本</option>
                                                </select>
                                            </div>
                                            <div class="card-footer">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                        onclick="saveOptions('backstage-settings');">保存
                                                </button>
                                            </div>
                                        </form>

                                        <!-- 其他设置 -->
                                        <form action="javascript://;" method="post" class="tab-pane fade"
                                              id="other-settings" role="tabpanel"
                                              aria-labelledby="other-settings-tab" aria-selected="true">
                                            <div class="form-group col-sm-6">
                                                <label for="statisticsCode">代码统计：</label>
                                                <textarea class="form-control" rows="5" id="statisticsCode"
                                                          style="resize: none;"></textarea>
                                            </div>
                                            <div class="card-footer">
                                                <button type="submit" class="btn btn-primary btn-sm">保存</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>

    <!-- bootstrap-switch -->
    <script src="/static/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <!-- layer -->
    <script src="/static/plugins/layer/layer.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
    <script>
        $(function () {
            $("input[data-bostrap-switch]").each(function () {
                $(this).bootstrapSwitch('state', $(this).prop('checked'));
            });
            checkCommentOption();
        });

        function checkCommentOption() {
            const native = $('input:radio[value=native]:checked').val();
            const valine = $('input:radio[value=valine]:checked').val();
            const disqus = $('input:radio[value=disqus]:checked').val();
            const livere = $('input:radio[value=livere]:checked').val();
            const changyan = $('input:radio[value=changyan]:checked').val();
            if (native != null) {
                $('.native-options').show();
            } else {
                $('.native-options').hide();
            }
            if (valine != null) {
                $('.valine-options').show();
            } else {
                $('.valine-options').hide();
            }
            if (disqus != null) {
                $('.disqus-options').show();
            } else {
                $('.disqus-options').hide();
            }
            if (livere != null) {
                $('.livere-options').show();
            } else {
                $('.livere-options').hide();
            }
            if (changyan != null) {
                $('.changyan-options').show();
            } else {
                $('.changyan-options').hide();
            }
        }

        $('input[name=comment_system]').click(function () {
            checkCommentOption();
        });

        function openAttach(id) {
            layer.open({
                type: 2,
                title: '所有附件',
                maximum: true,
                shadeClose: true,
                shade: 0.5,
                area: ['90%', '90%'],
                content: '/admin/attachments/select?id=' + id,
                scrollbar: false
            });
        }

        function updateAllSummary() {
            $.ajax({
                type: 'get',
                url: '/admin/posts/updateSummary',
                data: {
                    postSummary: $('#postSummary').val()
                },
                success: function (data) {
                    if (data === true) {
                        showMsg("所有文章闪耀更新成功！", "success", 1000);
                    } else {
                        showMsg("更新失败！", "error", 2000);
                    }
                }
            })
        }

        function saveOptions(option) {
            const param = $('#' + option).serialize();
            $.ajax({
                type: 'post',
                url: '/admin/option/save',
                data: param,
                success: function (result) {
                    showMsg("保存成功！", "success", 2000);
                }
            });
        }

        function showMsg(text, icon, timer) {
            Swal.fire({
                toast: true,
                timer: timer,
                text: text,
                icon: icon,
                position: 'top-end',
                showConfirmButton: false
            });
        }

    </script>

    <@footer></@footer>
</#compress>