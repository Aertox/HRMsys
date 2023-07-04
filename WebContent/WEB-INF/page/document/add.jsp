<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>HRM员工之家</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form" method="POST" id="deptForm" enctype="multipart/form-data" action="${ctx}/document/add">
        <input type="hidden" name="id" id="id" value="${doc.id }">
        <div class="layui-form-item">
            <label for="title" class="layui-form-label">
                <i class="layui-icon">&#xe655;
                </i>标题
            </label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${doc.title }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="remark" class="layui-form-label">
                <i class="layui-icon">
                </i>描述
            </label>
            <div class="layui-input-inline">
                <input type="text" id="remark" name="remark" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${doc.remark }">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="file" class="layui-form-label">
                <i class="layui-icon">
                </i>上传文件
            </label>
            <div class="layui-input-inline">
                <input type="file" id="file" name="file">
            </div>

        </div>
        <div class="layui-form-item">
            <label for="text" class="layui-form-label">
            </label>
            <input type="submit" value="提交" class="layui-btn" lay-filter="add" lay-submit=""/>
        </div>
    </form>



</div>



</body>

</html>