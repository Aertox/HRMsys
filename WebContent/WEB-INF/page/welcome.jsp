<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${ctx}/public/logo.ico" type="image/x-icon"/>
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

    }


</style>


<body>

<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote">
        欢迎管理员:<span class="x-red">${sessionScope.user_session.username }</span>
        当前时间:<span class="x-red" id="dateTime"></span></blockquote>
    <fieldset class="layui-elem-field">
        <legend>公告通知</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody>
                <tr>
                    <td>
                        <a class="x-a" href="/" target="_blank">请于6.22日之前到后勤部领取端午福利</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="x-a" href="https://github.com/Aertox/hrmsys2.0" target="_blank">项目上线倒计时</a>
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
                    <th>90天之内入职人数</th>
                    <td>15</td>
                </tr>
                <tr>
                    <th>90天之内离职人数</th>
                    <td>10</td>
                </tr>
                <tr>
                    <th>在职人数</th>
                    <td>121</td>
                </tr>

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
            data: ['销售额']
        },
        xAxis: {
            data: ["6.17", "6.18", "6.19", "6.20", "6.21", "6.22"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [4232, 7312, 4115, 3892, 3211, 2998],
            itemStyle: {
                color: '#23606E'
            }
        }]
    };


    var app = {};
    var option2;

    const categories = (function () {
        let now = new Date();
        let res = [];
        let len = 10;
        while (len--) {
            res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
            now = new Date(+now - 2000);
        }
        return res;
    })();
    const categories2 = (function () {
        let res = [];
        let len = 10;
        while (len--) {
            res.push(10 - len - 1);
        }
        return res;
    })();
    const data = (function () {
        let res = [];
        let len = 10;
        while (len--) {
            res.push(Math.round(Math.random() * 400));
        }
        return res;
    })();
    const data2 = (function () {
        let res = [];
        let len = 0;
        while (len < 10) {
            res.push(Math.floor(Math.random() * 10 + 20));
            len++;
        }
        return res;
    })();
    option2 = {
        title: {
            text: ' 后台数据'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#283b56'
                }
            }
        },
        legend: {},
        toolbox: {
            show: true,
            feature: {
                dataView: {readOnly: false},
                restore: {},
                saveAsImage: {}
            }
        },
        dataZoom: {
            show: false,
            start: 0,
            end: 100
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: true,
                data: categories
            },
            {
                type: 'category',
                boundaryGap: true,
                data: categories2
            }
        ],
        yAxis: [
            {
                type: 'value',
                scale: true,
                name: 'Price',
                max: 100,
                min: 0,
                boundaryGap: [0.2, 0.2]
            },
            {
                type: 'value',
                scale: true,
                name: 'Order',
                max: 500,
                min: 0,
                boundaryGap: [0.2, 0.2]
            }
        ],
        series: [
            {
                name: '成交金额',
                type: 'bar',
                xAxisIndex: 1,
                yAxisIndex: 1,
                data: data,
                itemStyle: {
                    color: '#008F8C' // 设置柱状图的颜色为红色
                }
            },
            {
                name: '在线人数',
                type: 'line',
                data: data2,
                itemStyle: {
                    color: '#ffa6a5'
                }
            }
        ]
    };
    app.count = 11;
    setInterval(function () {
        let axisData = new Date().toLocaleTimeString().replace(/^\D*/, '');
        data.shift();
        data.push(Math.round(Math.random() * 400));
        data2.shift();
        data2.push(Math.floor(Math.random() * 10 + 20));
        categories.shift();
        categories.push(axisData);
        categories2.shift();
        categories2.push(app.count++);
        chart2.setOption({
            xAxis: [
                {
                    data: categories
                },
                {
                    data: categories2
                }
            ],
            series: [
                {
                    data: data
                },
                {
                    data: data2
                }
            ]
        });
    }, 2100);


    chart1.setOption(option1);
    chart2.setOption(option2);

    // 监听窗口大小变化，让图表自适应容器大小
    window.addEventListener('resize', function () {
        chart1.resize();
        chart2.resize();
    });

</script>


<script>
    //人数统计图表
    var chart3 = echarts.init(document.getElementById("chart3"));
    var chart4 = echarts.init(document.getElementById('chart4'));


    var option3 = {
        title: {text: "人数统计"},
        legend: {data: ["入职人数", "离职人数"]},
        // tooltip提示  trigger触发器 axis轴线触发，item 当前项触发
        tooltip: {trigger: "axis"},
        yAxis: {data: ["技术部", "市场部", "人事部"]},
        xAxis: {},
        series: [
            {
                name: "入职人数",
                type: "bar",
                data: [30, 13, 21],
                stack: true,
                // stack堆叠，label 标签，position位置，inside内部，right右侧，formmater格式
                // \n 代表换行，{a}系列名 "xxx" {b}数值名 "vue"  {c}数值  80    #FA7F08
                itemStyle: {
                    color: '#253659'
                },

                label:
                    {
                        show: true,
                        position: "insideRight",
                        formatter: "{a}\n{c}人"
                    }
            },
            {
                name: "离职人数",
                type: "bar",
                data: [4, 5, 6],
                stack: true,
                itemStyle: {
                    color: '#008F8C'
                },
                label:
                    {
                        show: true,
                        position: "insideRight",
                        formatter: "{a}\n{c}人"
                    }
            }
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
                    {value: 31, name: '技术部', itemStyle: {color: '#5D8A66'}},
                    {value: 35, name: '运营部', itemStyle: {color: '#1A6566'}},
                    {value: 20, name: '财务部', itemStyle: {color: '#21445B'}},
                    {value: 12, name: '行政部', itemStyle: {color: '#323050'}},
                    {value: 20, name: '市场部', itemStyle: {color: '#45214A'}}

                ]
            }
        ]
    };


    chart3.setOption(option3);
    chart4.setOption(option4);

    // 监听窗口大小变化，让图表自适应容器大小
    window.addEventListener('resize', function () {
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