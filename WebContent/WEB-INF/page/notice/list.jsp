<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>公告信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon"/>
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>公告信息</cite></a>
      </span>
    <c:choose>
        <c:when test="${sessionScope.tip  == 1 }">
            <button type="button" onclick="x_admin_show('增加','${ctx}/notice/add')" class="layui-btn layui-btn-small"
                    style="line-height:1.6em;margin-top:3px;margin-left:75%;;"><i class="layui-icon">&#xe608;</i>增加
            </button>
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon">&#xe640;</i>批量删除
            </button>
        </c:when>
    </c:choose>


</div>
<div class="x-body">
    <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="get" action="${ctx }/notice/list">
            <!-- <input class="layui-input" placeholder="开始日" name="start" id="start">
            <input class="layui-input" placeholder="截止日" name="end" id="end"> -->
            <input type="text" name="content" style="width:50%;" placeholder="请输入查找标题" autocomplete="off"
                   class="layui-input">
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:0px;" href="${ctx }/notice/list"
               title="刷新">
                <i class="layui-icon" style="line-height:38px">&#xe666;
                </i></a>
            <!--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>-->
        </form>
    </div>
    <!--<xblock>
         <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      <button class="layui-btn" onclick="x_admin_show('添加用户','${ctx}/dept/add')"><i class="layui-icon"></i>添加</button>
      <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>-->


    <table  id="test1" class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>标题</th>
            <th>内容</th>
            <th>发布日期</th>
            <th>发布用户</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="notice" varStatus="stat">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i
                            class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${notice.id }</td>
                <td>${notice.title }</td>
                <td>${notice.content }</td>
                <td>${notice.create_date }</td>
                <td>${notice.user.name }</td>

                <!--  <td class="td-status">
                   <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td> -->
                <c:choose>
                    <c:when test="${sessionScope.tip  == 1 }">
                        <td class="td-manage">
                            <!--  <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                               <i class="layui-icon">&#xe601;</i>
                             </a> -->
                                <%-- <a title="编辑"  onclick="x_admin_show('编辑','${ctx}/job/add?id=${dept.id }');" href="javascript:;"> --%>
                            <button class="layui-btn layui-btn-normal" title="编辑" onclick="x_admin_show('编辑','${ctx}/notice/add?id=${notice.id }');"
                               href="javascript:;">
                                编辑 <i class="layui-icon">&#xe642;</i>
                            </button>
                            <button class="layui-btn layui-btn-warm" title="删除" onclick="member_del(this,'${notice.id }')">
                                删除<i class="layui-icon">&#xe640;</i>
                            </button>
                        </td>
                    </c:when>

                </c:choose>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <!--  <div class="page">
       <div>
         <a class="prev" href="">&lt;&lt;</a>
         <a class="num" href="">1</a>
         <span class="current">2</span>
         <a class="num" href="">3</a>
         <a class="num" href="">489</a>
         <a class="next" href="">&gt;&gt;</a>
       </div>
     </div> -->



</div>
<script>

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $.get("${ctx}/notice/delete?id=" + id);
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>

</body>

</html>