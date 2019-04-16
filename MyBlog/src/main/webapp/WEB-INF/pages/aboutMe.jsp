<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/4/2
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getContextPath();
String basePath=request.getScheme()+";//"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>关于作者</title>
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
    <nav class="navbar navbar-default " style="color: #2aabd2">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li role="presentation"><a  href="${ctx}/blogger/main" class="navbar-brand">主页</a></li>
                    <li role="presentation" ><a href="${ctx}/message/toLeaveMessage">留言</a></li>
                    <li role="presentation"  class="active"><a href="${ctx}/blogger/aboutMe" >关于</a></li>
                    <li role="presentation" ><a href="${ctx}/message/toDetailMessages" >留言板</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="jumbotron">
        <h1>你好！</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 感谢访问，网站写的很粗糙，结构也很不合理，日后有时间继续重构完善。
            控制台管理等部分功能需要登录后使用，暂不开放。相册模块暂未实现。
        另附联系方式：
        </p>
        <p>博客园：<a href="https://www.cnblogs.com/phdeblog/" target="_blank">https://www.cnblogs.com/phdeblog/</a></p>
        <p>邮箱：1376034301@qq.com</p>
    </div>
</div>
</body>
</html>
