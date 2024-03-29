<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>借书</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <!---高级查询图书-->
    <div class="layui-form-item">
        <label class="layui-form-label required">图书编号</label>
        <div class="layui-input-block">
            <input class="layui-input" name="id" id="id" autocomplete="off" data-type="reload">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">图书名称</label>
        <div class="layui-input-block">
            <input class="layui-input" name="name" id="name" autocomplete="off" data-type="reload">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">图书列表</label>
        <div class="layui-input-block">
           <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">学号</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" lay-reqtext="学号不能为空" placeholder="请输入学号" value="" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认借书</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function(){
        // var table = layui.table;
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
        //方法级渲染
        table.render({
            elem: '#currentTableId'
            ,url: '${pageContext.request.contextPath}/bookAll'
            ,cols: [[
                {type: "checkbox", width: 50, align: 'center'},
                {field: 'id', width: 100, title: '序号', sort: true, align: 'center'},
                {field: 'isbn', miniWidth: 150, title: '图书编号ISBN', align: 'center'},
                //获取对象中的属性 对象
                {templet:'<div>{{d.typeInfo.name}}</div>', miniWidth: 80, title: '图书类型', align: 'center'},
                {field: 'name', miniWidth: 180, title: '图书名称', align: 'center'},
                {field: 'author', miniWidth: 80, title: '作者', align: 'center'},
                {field: 'price', miniWidth: 80, title: '价格', align: 'center'},
                {field: 'stock', miniWidth: 80, title: '库存', align: 'center'},
                {title:"图书状态",miniWidth: 100,align: 'center',templet:function(res){
                        if(res.status=='1'){
                            return '<span class="layui-badge layui-bg-blue">可借阅</span>'
                        }else if(res.status=='0'){
                            return '<span class="layui-badge layui-bg-red">已被借阅!</span>'
                        }
                    }},
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,  <!--默认显示15条-->
            page: true,
            skin: 'line',
            id:'testReload'
        });
        var $ = layui.$, active = {
            reload: function(){
                var name = $('#name').val(),
                    id = $('#id').val()
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        name:name,
                        id:id
                    }
                }, 'data');
            }
        };

        $('input[name=name]').change(function() {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('input[id=id]').change(function() {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        /**
         * 获取选中记录的id信息
         */
        function getCheackId(data){
            var arr=new Array();
            for(var i=0;i<data.length;i++){
                arr.push(data[i].id);
            }
            //拼接id
            return arr.join(",");
        };

        /**
         * form添加操作
         */
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            var selectData = layui.table.checkStatus('testReload').data;
            var ids=getCheackId(selectData);
            var username=datas.username;
            var  value={username:username,ids:ids};
            lendBook(value);
        });


        /**
         * 提交删除功能
         */
        function lendBook(datas){
            //向后台发送请求
            $.ajax({
                url: "addLend",
                type: "POST",
                data: datas,
                success: function (result) {
                    if (result.code == 0) {//如果成功
                        layer.msg('借书成功',{
                            icon:6,
                            time:500
                        },function(){
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    } else {
                        layer.msg(result.msg);
                    }
                }
            })
        };


    });
</script>
</body>
</html>
