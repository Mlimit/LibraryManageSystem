<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>公告查看</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="demoTable">
            公告主题：
            <div class="layui-inline">
                <input class="layui-input" name="topic" id="topic" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>

        <!--表单，查询出的数据在这里显示-->
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="query">查询详情</a>
        </script>

    </div>
</div>

<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/noticeAll',//查询类型数据
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                //{type: "checkbox", width: 50, align: 'center'},
                {field: 'id', width: 100, title: '序号', sort: true, align: 'center'},
                {field: 'topic', minWidth: 150, title: '公告主题', align: 'center'},
                {field: 'content', minWidth: 200, title: '公告内容', align: 'center'},
                {field: 'author', minWidth: 100, title: '发布者', align: 'center'},
                {templet:"<div>{{layui.util.toDateString(d.createDate,'yyyy-MM-dd HH:mm:ss')}}</div>", minWidth: 200, title: '发布时间', align: 'center'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: 'center'}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,  <!--默认显示15条-->
            page: true,
            skin: 'line',
            id:'testReload'
        });

        var $ = layui.$, active = {
            reload: function(){
                var topic = $('#topic').val();
                console.log(name)
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        topic: topic
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        /**
         * tool操作栏监听事件
         */
        table.on('tool(currentTableFilter)', function (obj) {
            var data=obj.data;
            if (obj.event === 'query') {  // 监听查询详情操作
                var index = layer.open({
                    title: '查看公告',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['60%', '60%'],
                    content: '${pageContext.request.contextPath}/queryNoticeById?id='+data.id,
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            }
        });
    });
</script>

</body>
</html>
