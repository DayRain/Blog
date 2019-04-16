<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/3/17
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>写博客</title>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-theme.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/img/favicon.ico" />
    <script type="application/javascript" src="${basePath}/jquery/jquery-3.3.1.js"></script>
    <script type="application/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/wangEditor.js"></script>
    <script type="application/javascript" src="${basePath}/js/date.js"></script>
    <script type="application/javascript" src="${basePath}/js/htmlEncode.js"></script>
</head>
<body>
<div class="container">

    <%--<div class="container">--%>
        <%--<div class="nav nav-pills">--%>
            <%--<li role="presentation" class="active"><a href="${ctx}/blogger/main">主页</a></li>--%>
            <%--<li role="presentation" class=""><a href="#">Profile</a></li>--%>
            <%--<li role="presentation" class=""><a href="#">Messages</a></li>--%>
        <%--</div>--%>
    <%--</div>--%>

        <nav class="navbar navbar-default ">
            <div class="container">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li role="presentation"><a  href="${ctx}/blogger/main" class="navbar-brand">我的主页</a></li>
                        <li role="presentation" class="active"><a href="${ctx}/blogger/writeBlog">发布文章</a></li>
                        <li role="presentation"><a href="${ctx}/blogger/backstage" >管理文章</a></li>
                        <li role="presentation"><a href="${ctx}/comment/commentManage" >评论管理</a></li>
                        <li role="presentation"><a href="${ctx}/message/messageManage">留言管理</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    <!--编辑器-->
    <div class="container" style="margin-top: 100px">

        <!--title-->
        <div style="margin-bottom: 20px">
            <span class="label label-primary">标题</span>
           <input type="text" class="form-control" id="title"/>
        </div>
        <div style="margin-bottom: 20px">
            <span class="label label-primary">分类</span>
            <input type="text" class="form-control" id="classify"/>
        </div>
        <div id="info">
            <c:if test="${not empty requestScope.classify}">
                <span class="label label-default">已有以下标签：</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach items="${requestScope.classify}" var="obj" varStatus="status">
                    <span class="label label-info myLabel" style="cursor: pointer">${obj.classifyName}</span> &nbsp;&nbsp;
                </c:forEach>
            </c:if>
        </div>
        <div style="margin-top: 10px">
        </div>
        <div id="editor">
            <c:if test="${not empty requestScope.article.articleContent}">
                ${requestScope.article.articleContent}
            </c:if>
        </div>
        <div>
            <button id="btn1" value="保存" class="btn-default" style="margin-left: 90%;margin-top: 20px">发布</button>
        </div>

    </div>


</div>

<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create();
    $(function () {
        $("#btn1").click(function () {
            if(${not empty requestScope.article.articleId}){
                var article = {
                    "articleId":${requestScope.article.articleId}+"",
                    "articleContent":editor.txt.html(),
                    "articleTitle":htmlEncode($("#title").val()),
                    "writerId":${sessionScope.blogger.bloggerId},
                    "classifyName": $("#classify").val()
                }
            }else{
                var article = {
                    "articleContent":editor.txt.html(),
                    "articleTitle":htmlEncode($("#title").val()),
                    "writerId":${sessionScope.blogger.bloggerId},
                    "classifyName": $("#classify").val()
                }
            }

            $.ajax({
                type:"post",
                url:"${ctx}/article/save",
                data:JSON.stringify(article),
                contentType:"application/json;charset=utf-8",
                success:function (data) {
                    if(data != ""){
                        alert("保存成功!");
                        window.location="${ctx}/blogger/backstage";
                    }else{
                        alert("保存失败!");
                    }
                },
                error:function () {
                    alert("连接失败");
                }
            })
        });
    })
 </script>
<%--点击标签的时候，自动添加到输入框--%>
<script>
    $(".myLabel").click(function () {
        $("#classify").val($(this).html());
    })
</script>

<script>
    if(${not empty requestScope.article.articleId}){
        $("#title").val("${requestScope.article.articleTitle}");
        $("#classify").val("${requestScope.article.classifyName}");
    }
</script>

</body>
</html>
