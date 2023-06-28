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
    <style>
        .chart-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            width: 1200px;
            height:400px;
        }

        .chart {
            flex: 1;
            height: 400px;
            width: 45%;
        }
        .chart-container2 {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            width: 1200px;
            height:400px;
        }


    </style>


    <body>

    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">
            欢迎管理员：
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
                            <a class="x-a" href="http://www.w3school.com.cn" target="_blank">项目上线倒计时</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>

        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="chart-container">
                    <div id="chart1" class="chart"></div>
                    <div id="chart2" class="chart"></div>
                </div>
            </div>
        </fieldset>


        <fieldset class="layui-elem-field">
            <legend>人数信息</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>入职人数</th>
                            <td>65</td></tr>
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
                <!-- <div id="container" style="width: 600px; height:400px;" ></div>   -->
                <div class="chart-container2">
                    <div id="chart3" class="chart"></div>
                    <div id="chart4" class="chart"></div>
                </div>
            </div>
        </fieldset>

        <blockquote class="layui-elem-quote layui-quote-nm">等待开发</blockquote>
    </div>


        <script>
        var chart1 = echarts.init(document.getElementById('chart1'));
        var chart2 = echarts.init(document.getElementById('chart2'));

        var option1 = {
            // chart1的配置
            title: {
                text: '销售额统计'
            },
            tooltip: {},
            legend: {
                data:['销售额']
            },
            xAxis: {
                data: ["6.17","6.18","6.19","6.20","6.21","6.22"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [4232, 2312, 4115, 3892,3211, 2998]
            }]
        };

        var option2 = {
            title:{text:"薪资来源"},
            legend:{data:["底薪","绩效","年终奖"]},
            tooltip:{},
            series:[
                {type:"pie",radius:[150,80],data:[
                        {name:"底薪",value:5000,label:{
                                show:false,
                                position:"center",
                                // {d}百分比 {big|内容} 使用样式
                                formatter:"{big|{d}}{small|%}\n{b}",
                                // 定义样式（富文本）
                                rich:{
                                    big:{
                                        color:"#404ed8",
                                        fontSize:"48px",
                                        fontWeight:900,
                                    },
                                    small:{
                                        color:"#404ed8"
                                    }
                                }
                            },
                            tooltip:{show:true},
                            //itemStyle:{color:"#384a99"},
                        },
                        {name:"绩效",value:500,label:{
                                show:false,
                                position:"center",
                                // {d}百分比 {big|内容} 使用样式
                                formatter:"{big|{d}}{small|%}\n{b}",
                                // 定义样式（富文本）
                                rich:{
                                    big:{
                                        color:"#8c4cf9",
                                        fontSize:"48px",
                                        fontWeight:900,
                                    },
                                    small:{
                                        color:"#8c4cf9"
                                    }
                                }},
                            // 样式灰色
                            itemStyle:{color:"#8c4cf9"},
                            // 提示不显示
                            tooltip:{show:true},
                        },
                        {name:"年终奖",value:2500,label:{
                                show:false,
                                position:"center",
                                // {d}百分比 {big|内容} 使用样式
                                formatter:"{big|{d}}{small|%}\n{b}",
                                // 定义样式（富文本）
                                rich:{
                                    big:{
                                        color:"#00796B",
                                        fontSize:"48px",
                                        fontWeight:900,
                                    },
                                    small:{
                                        color:"#00796B"
                                    }
                                }},
                            // 样式灰色
                            itemStyle:{color:"#00796B"},
                            // 提示不显示
                            tooltip:{show:true},
                        },

                    ]}
            ],
        };

        chart1.setOption(option1);
        chart2.setOption(option2);

        // 监听窗口大小变化，让图表自适应容器大小
        window.addEventListener('resize', function() {
            chart1.resize();
            chart2.resize();
        });

    </script>


        <script>
        //人数统计图表
        var chart3 = echarts.init(document.getElementById("chart3"));
        var chart4 = echarts.init(document.getElementById('chart4'));


        var option3 = {
            title:{text:"人数统计"},
            legend:{data:["入职人数","离职人数"]},
            // tooltip提示  trigger触发器 axis轴线触发，item 当前项触发
            tooltip:{trigger:"axis"},
            yAxis:{data:["技术部","后勤部","人事部"]},
            xAxis:{},
            series:[
                {name:"入职人数",type:"bar",data:[30,13,21],stack:true,
                    // stack堆叠，label 标签，position位置，inside内部，right右侧，formmater格式
                    // \n 代表换行，{a}系列名 "陈康" {b}数值名 "vue"  {c}数值  80
                    label:{show:true,position:"insideRight",formatter:"{a}\n{c}人"}},
                {name:"离职人数",type:"bar",data:[4,5,6],stack:true,
                    label:{show:true,position:"insideRight",formatter:"{a}\n{c}人"}}
            ]
        }

        

        var option4 = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                top: '5%',
                left: 'center'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    itemStyle: {
                        borderRadius: 10,
                        borderColor: '#fff',
                        borderWidth: 2
                    },
                    label: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        label: {
                            show: true,
                            fontSize: 40,
                            fontWeight: 'bold'
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        { value: 1048, name: 'Search Engine' },
                        { value: 735, name: 'Direct' },
                        { value: 580, name: 'Email' },
                        { value: 484, name: 'Union Ads' },
                        { value: 300, name: 'Video Ads' }
                    ]
                }
            ]
        };


        chart3.setOption(option3);
        chart4.setOption(option4);

        // 监听窗口大小变化，让图表自适应容器大小
        window.addEventListener('resize', function() {
            chart3.resize();
            chart4.resize();
        });
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