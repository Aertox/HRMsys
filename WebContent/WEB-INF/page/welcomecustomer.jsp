<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title></title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/public/css/font.css">
        <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
        <script type="text/javascript" src="${ctx}/public/js/echarts.min.js"></script>
    </head>


    <body>

    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">
            欢迎用户：
            <span class="x-red">${sessionScope.user_session.username }</span>
            当前时间:
            <span class="x-red" id="dateTime"></span></blockquote>

        <fieldset class="layui-elem-field">
            <legend>公告通知</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                    <tr>
                        <td >
                            <a class="x-a" href="/" target="_blank">请于6.22日之前到后勤部领取端午福利</a>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <a class="x-a" href="http://www.bing.com" target="_blank">项目上线倒计时</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                <div id="main1" style="width: 800px; height:600px;" ></div><!--   -->

            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
        <legend>个人信息</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>入职人数</th>
                    <td>${dept.loginname}</td></tr>
                <tr>
                    <th>离职人数</th>
                    <td>10</td></tr>
                <tr>
                    <th>部门入职人数</th>
                    <td>6</td></tr>
                <tr>
                    <th>部门离职人数</th>
                    <td>1</td></tr>
                </tbody>
            </table>
            <div id="container" style="width: 300px; height:300px;" ></div><!--   -->


        </div>
    </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">等待开发</blockquote>
    </div>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>

        <script>
            var echart = echarts.init(document.getElementById("main1"))
            // 主题，light，dark，自定义
            // var echart = echarts.init(document.getElementById("container"),'purple-passion')
            //  定义配置项
            var option = {
                // 调色盘
                // color:["#55aaff","#aaff7f","#55007f","#ffff00"],
                // 图表的标题
                title:{
                    text:"我的第一个图表"
                },
                // 图表的提示
                tooltip:{},
                // 图例
                legend:{data:["睡眠时长","玩游戏时长","上课时长"]},
                // x轴线
                xAxis:{data:["周一","周二","周三","周四","周五","周六","周日"]},
                // y轴线
                yAxis:{},
                // 设置数据
                series:[
                    {
                        // 数据名称
                        name:"睡眠时长",
                        // 类型为柱状图
                        type:"bar",
                        // 数据data
                        data:[8,10,4,5,9,4,8],
                        color:["#ac4cff"]
                    },
                    {
                        // 数据名称
                        name:"玩游戏时长",
                        // 类型为柱状图
                        type:"line",
                        // 数据data
                        data:[2,4,1,5,6,8,5]
                    },
                    {
                        // 数据名称
                        name:"上课时长",
                        // 类型为柱状图
                        type:"line",
                        smooth:true,
                        // 数据data
                        data:[6,7,5,8,6,1,0],
                        // areaStyle:"#f70"

                    },
                    {
                        name:"成绩",
                        // 饼形图
                        type:"pie",
                        // radius:80,
                        // 半径
                        radius:[80,50],
                        // 位移
                        left:-80,
                        top:-270,
                        // 数据
                        data:[
                            {name:"js",value:90},
                            {name:"html",value:85,itemStyle:{
                                    color:"#ffaa00"
                                }},
                            {name:"jq",value:90,
                                itemStyle:{
                                    normal:{color:"#93da6c"},
                                    emphasis:{color:"#bcff57"}
                                }
                            },
                            {name:"vue",value:50},
                        ]
                    }
                ]
            }
            // 更新配置
            echart.setOption(option);



    </script>
    <script type="text/javascript">

        Date.prototype.format = function (fmt) {
            var o = {
                "y+": this.getFullYear, //年
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds() //秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }

        //获取到     页面id为dateTime的div
        setInterval("document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');", 1000);

    </script>



    </body>
</html>