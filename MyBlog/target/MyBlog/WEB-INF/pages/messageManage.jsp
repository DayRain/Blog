<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/3/17
  Time: 14:07
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
    <title>后台管理</title>

    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-theme.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/img/favicon.ico" />
    <script type="application/javascript" src="${basePath}/jquery/jquery-3.3.1.js"></script>
    <script type="application/javascript" src="${basePath}/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var article = $(".title");
            for(var i=0;i<article.length;i++){
                var title = article[i].innerText;
                title = $.trim(title);
                title = title.replace(/\t/ig,'');
                title = title.replace(/n/ig,'');
                if(title.length>30){
                    title = title.substring(0,30)+"...";
                }
                article[i].innerText=title;
            }
        })
    </script>
</head>
<body>
<div class="container">
    <div >
        <nav class="navbar navbar-default ">
            <div class="container">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li role="presentation"><a  href="${ctx}/blogger/main" class="navbar-brand">我的主页</a></li>
                        <li role="presentation"><a href="${ctx}/blogger/writeBlog">发布文章</a></li>
                        <li role="presentation"><a href="${ctx}/blogger/backstage" >文章管理</a></li>
                        <li role="presentation"><a href="${ctx}/comment/commentManage" >评论管理</a></li>
                        <li role="presentation"  class="active"><a href="${ctx}/message/messageManage">留言管理</a></li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <div style="margin-top: 50px">
        <div>
            <div class="col-md-8">
                <for:forEach items="${requestScope.messages}" var="u" varStatus="status">
                    <blockquote class="">
                        <p>${u.messageContent}</p>
                        <footer>${u.messageName}  &nbsp;&nbsp;<cite title="Source Title">
                            <fmt:formatDate value="${u.messageCreateTime}"/>
                            &nbsp;
                            <c:if test="${u.messageOpen == 0}">
                            私密
                            </c:if>
                            <c:if test="${u.messageOpen == 1}">
                             公开
                            </c:if>
                            &nbsp;&nbsp;&nbsp;
                            <a href="${ctx}/message/delMessage/${u.messageId}" onclick="return confirm('确认删除吗？')">删除</a>
                            <a href="${ctx}/message/chmod/${u.messageId}/${u.messageOpen}">更改权限</a>
                        </cite></footer>
                    </blockquote>
                </for:forEach>
                <div style="margin-top: 100px;text-align: left">
                    <a href="${ctx}/blogger/main" style="color: gray">返回主页</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
