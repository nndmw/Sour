<#compress >
    <#include "module/_macro.ftl">
    <@head title="${options.blog_title} | Sour后台管理-友情链接"></@head>
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.css">

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
                            <h1 class="m-0">友情链接</h1>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a data-pjax="true" href="/admin">首页</a></li>
                                <li class="breadcrumb-item"><a data-pjax="true" href="#">页面</a></li>
                                <li class="breadcrumb-item active">友情链接</li>
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
                        <!-- left column -->
                        <div class="col-md-5">
                            <!-- general form elements -->
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">添加友情链接</h3>
                                </div>
                                <!-- /.card-header -->

                                <#if updateLink??>
                                    <!-- form start-->
                                    <form action="/admin/page/links/save" method="post" role="form"
                                          onsubmit="return isNull();">
                                        <input type="hidden" name="linkId" value="${updateLink.linkId}">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="linkName">* 网站名称</label>
                                                <input type="text" class="form-control" id="linkName" name="linkName"
                                                       value="${updateLink.linkName}">
                                            </div>
                                            <div class="form-group">
                                                <label for="linkUrl">* 网站地址</label>
                                                <input type="text" class="form-control" id="linkUrl" name="linkUrl"
                                                       value="${updateLink.linkUrl}">
                                                <small>* 需要加上 https://</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="linkPic">Logo</label>
                                                <input type="text" class="form-control" id="linkPic" name="linkPic"
                                                       value="${updateLink.linkPic}">
                                            </div>
                                            <div class="form-group">
                                                <label for="linkDesc">描述</label>
                                                <textarea class="form-control" rows="3" id="linkDesc" name="linkDesc"
                                                          style="resize: none;">${updateLink.linkDesc}</textarea>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary btn-sm">${statusName}</button>
                                            <a data-pjax="true" href="/admin/page/links" class="btn btn-sm btn-default">返回添加</a>
                                        </div>
                                    </form>
                                <#else >
                                    <!-- form start-->
                                    <form action="/admin/page/links/save" method="post" role="form"
                                          onsubmit="return isNull();">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="linkName">* 网站名称</label>
                                                <input type="text" class="form-control" id="linkName" name="linkName">
                                            </div>
                                            <div class="form-group">
                                                <label for="linkUrl">* 网站地址</label>
                                                <input type="text" class="form-control" id="linkUrl" name="linkUrl">
                                                <small>* 需要加上 https://</small>
                                            </div>
                                            <div class="form-group">
                                                <label for="linkPic">Logo</label>
                                                <input type="text" class="form-control" id="linkPic" name="linkPic">
                                            </div>
                                            <div class="form-group">
                                                <label for="linkDesc">描述</label>
                                                <textarea class="form-control" rows="3" id="linkDesc" name="linkDesc"
                                                          style="resize: none;"></textarea>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->

                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary btn-sm">${statusName}</button>
                                        </div>
                                    </form>
                                </#if>
                            </div>
                        </div>

                        <!-- right column -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">所有友情链接</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"
                                                title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="card-body table-responsive p-0" style="display: block;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>网址</th>
                                            <th>描述</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#list links as link>
                                            <tr>
                                                <td>${link.linkName}</td>
                                                <td><a href="${link.linkUrl}">${link.linkUrl}</a></td>
                                                <td>${link.linkDesc}</td>
                                                <td>
                                                    <a data-pjax="true"
                                                       href="/admin/page/links/edit?linkId=${link.linkId}"
                                                       class="btn btn-xs bg-info">编辑</a>
                                                    <button class="btn btn-xs bg-danger"
                                                            onclick="modelShow('/admin/page/links/remove?linkId=${link.linkId}');">
                                                        删除
                                                    </button>
                                                </td>
                                            </tr>
                                        </#list>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item">
                                            <a class="page-link" href="#">«</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">1</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">2</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">»</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 删除确认弹出层 -->
            <div class="modal fade" id="removeLinkModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">提示信息</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>您确定要删除吗？</p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="url">
                            <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                            <a onclick="removeIt()" class="btn btn-sm btn-danger" data-dismiss="modal">确定</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal -->

        </div>
        <!-- /.content-wrapper -->

        <!-- footer -->
        <#include "module/_footer.ftl">

    </div>
    <@footer></@footer>

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.5/dist/sweetalert2.min.js"></script>
    <script>
        function isNull() {
            const name = $('#linkName').val();
            const url = $('#linkUrl').val();
            // const pic = $('#linkPic').val();
            // const desc = $('#linkDesc').val();
            if (name === "" || url === "") {
                showMsg("请输入完整信息！", "info", 2000);
                return false;
            }
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

        function removeIt() {
            window.location.href = $.trim($("#url").val());
        }

        function modelShow(url) {
            $('#url').val(url);
            $('#removeLinkModal').modal();
        }
    </script>

</#compress>