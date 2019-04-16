<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/4/2
  Time: 10:50
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
    <title>留言板</title>
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
                            <li role="presentation"><a href="${ctx}/message/toLeaveMessage">留言</a></li>
                            <li role="presentation"><a href="${ctx}/blogger/aboutMe" >关于</a></li>
                            <li role="presentation"  class="active"><a href="${ctx}/message/toDetailMessages" >留言板</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div style="margin-top: 100px"></div>
            <div>
            <div class="col-md-8">

                <c:if test="${empty requestScope.messages}">
                    暂无留言
                </c:if>
                <for:forEach items="${requestScope.messages}" var="u" varStatus="status">
                    <blockquote class="">
                        <p>${u.messageContent}</p>
                        <footer>${u.messageName}  &nbsp;&nbsp;<cite title="Source Title">
<%--                            <fmt:formatDate value="${u.messageCreateTime}"/>--%>
                            <fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${u.messageCreateTime}" />
                        </cite></footer>
                    </blockquote>
                </for:forEach>
                <div style="margin-top: 100px;text-align: left">
                    <a href="${ctx}/blogger/main" style="color: gray">返回主页</a>
                </div>
            </div>
            </div>
        </div>
</body>
</html>