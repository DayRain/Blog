<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/3/16
  Time: 19:54
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
    <title>
     <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
         ${sessionScope.blooger.bloggerName}的主页
     </c:if>
     <c:if test="${empty sessionScope.blogger.bloggerPassword}">
         小楼的主页
     </c:if>
    </title>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-theme.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/img/favicon.ico" />
    <script type="application/javascript" src="${basePath}/jquery/jquery-3.3.1.js"></script>
    <script type="application/javascript" src="${basePath}/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            //对文章的处理
            var article = $(".content");
            for(var i=0;i<article.length;i++){
                var con = article[i].innerText;
                con = $.trim(con);
                con = con.replace(/\t/ig,'');
                con = con.replace(/n/ig,'');
                if(con.length>150){
                    con = con.substring(0,150)+"...查看更多";
                }
                article[i].innerText=con;
            }
            //对标题的处理
                var title = $(".title");
                for(var i=0;i<title.length;i++){
                    con = title[i].innerText;
                    con = $.trim(con);
                    con = con.replace(/\t/ig,'');
                    con = con.replace(/n/ig,'');
                    if(con.length>20){
                        con = con.substring(0,20)+"...";
                    }
                    title[i].innerText=con;
                }
        })
    </script>
    <style>
        .row {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
        }
        .row > [class*='col-'] {
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
<div class="container">
    <!--nav-->
    <nav class="navbar navbar-default" style="color: #2aabd2">
        <div class="container-fluid">
            <div class="navbar-header">
                <span id="myName" style="font-size: 24px"> 欢迎来到 <c:choose><c:when test="${not empty sessionScope.blogger.bloggerPassword}">${sessionScope.blogger.bloggerName}</c:when>
                <c:otherwise>小楼</c:otherwise>
                </c:choose> 的博客！ </span>
            </div>

            <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
            <span style="margin-left: 20%;font-size: 24px" id="lastLoginTime">
            上次登录时间为：<fmt:formatDate value="${sessionScope.blogger.lastLogintime}"/>
            </span>
            </c:if>
            <div class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search" id="searchKeyWords">
                </div>
                <button class="btn btn-default" id="searchBtn">站内搜索</button>
            </div>
        </div>
    </nav>

    <hr/>
    <div class="row">
        <!--left-->
        <div class="col-md-2" style="background-color: #66afe9">
            <div class="container-fluid" style="text-align: center">
                <h1><label class="label label-primary" style="">${sessionScope.blogger.bloggerName}</label></h1>
            </div>

            <div style="text-align: center">
                <img src="${basePath}/img/头像.jpg" class="img-circle" width="60%">
            </div>

            <div style="text-align: left;margin-top: 50px">
                <p style="margin-left: 20%">博龄：0年</p>
                <p style="margin-left: 20%">关注：0</p>
                <p style="margin-left: 20%">粉丝：0</p>
            </div>
            <div style="margin-top: 50px;">
            </div>
            <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
                <div class="list-group">
                    <a href="#" class="list-group-item">未读留言<span class="badge">0</span></a>
                    <a href="#" class="list-group-item">未读评论<span class="badge" id="uncheckedComments">0</span></a>
                    <a href="#" class="list-group-item">待办事项<span class="badge">0</span></a>
                </div>
            </c:if>
            <%--标签--%>
            <span class="list-group-item" style="color: #2aabd2">文章分类</span>
            <div>
                <div class="list-group">
                <c:forEach items="${requestScope.classify}" var="obj" varStatus="status">
                    <a class="list-group-item" href="${ctx}/blogger/mainAfterClassify/${obj.classifyName}">${obj.classifyName}<span class="badge">${obj.articles.size()}</span></a>
                </c:forEach>
                </div>
            </div>

        </div>
        
        <!--middle-->
        <div class='col-md-8'>

            <div style="margin-top: 10px"></div>

            <div id="middlePanel">
                <for:forEach items="${requestScope.article}" var="u" varStatus="status">
                    <div>
                    <div class='panel panel-primary ' style='margin: 0 auto'>
                        <div class='panel-heading'>
                            <h3 class='panel-title'><a href='${ctx}/article/articleDetail/${u.articleId}/${requestScope.page.currPage}' style='text-decoration: none' class="title">${u.articleTitle}</a></h3>
                            </div>
                        <div class='panel-body'>
                            <a href='${ctx}/article/articleDetail/${u.articleId}/${requestScope.page.currPage}' style='text-decoration: none ' class="content">
                                  <div>  ${u.articleContent}</div>
                            </a>
                            </div>
                        </div>
                    </div><div style="margin-top: 15px"></div>
                </for:forEach>

            </div>

            <%--分页--%>
            <div style="align-self: flex-end">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${requestScope.page.currPage != 1}">
                                <li>
                                    <a href="${ctx}/blogger/main?currPage=1" aria-label="首页">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="${ctx}/blogger/main?currPage=${requestScope.page.currPage-1}">上一页</a></li>
                            </c:when>
                            <c:when test="${requestScope.page.currPage != requestScope.page.totalPage && requestScope.page.totalPage != 0}">
                                <li><a href="${ctx}/blogger/main?currPage=${requestScope.page.currPage+1}">下一页</a></li>
                                <li>
                                    <a href="${ctx}/blogger/main?currPage=${requestScope.page.totalPage}" aria-label="尾页">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${requestScope.page.totalPage != 0 }">
                                    <li><a href="${ctx}/blogger/main">返回</a></li>
                                </c:if>

                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>
        </div>
        <!--middle end-->
        <div class="clearfix visible-xs-block"></div>
        <!--right-->
        <div class="col-md-2" style="background-color: #66afe9">
            <div style="margin-top: 10px">
                <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
                <a href="${ctx}/blogger/backstage" style="font-size: 16px">控制台</a><br/>
                <a href="#" style="font-size: 16px">留言板</a><br/>
                <a href="${ctx}/blogger/writeBlog" style="font-size: 16px">写博客</a><br/>
                <a href="#" style="font-size: 16px">记事本</a><br/>
                </c:if>
            </div>
            <button type="button" class="btn btn-info" data-container="body" data-placement="left" id="aboutMe">
                关于作者
            </button>
            <button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-placement="left" data-content="尚未实现">
                查看相册
            </button>
            <button type="button" class="btn btn-info" data-container="body" data-toggle="popover" id="msg">
                给我留言
            </button>
            <button type="button" class="btn btn-info" data-container="body" data-placement="left" id="login">
                注册登录
            </button>
            <%--        留言展示--%>
            <div style="margin-top: 20px">
                <p style="color: black">最近留言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/message/toDetailMessages">查看更多</a></p>
                <div style="margin-top: 10px">
                    <div>
                        <div class="well well-lg" style="color: #2aabd2">
                            <c:if test="${empty requestScope.messages}">
                                <p>暂无公开的留言</p>
                            </c:if>
                            <c:if test="${not empty requestScope.messages}">
                                <c:forEach items="${requestScope.messages}" var="obj" varStatus="status">
                                    <p>${obj.messageContent}</p>
                                    <p style="text-align: right">——${obj.messageName}</p>
                                    <p style="text-align: right"><fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${obj.messageCreateTime}" /></p>
                                    <br/>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
<%--    right end--%>
    <div style="margin-top: 10px">
        <footer >
            <div class="panel-default" style="text-align: center;color: black">
                欢迎来访，有问题请联系本人：1376034301@qq.com
            </div>
        </footer>
    </div>
</div>
<script>
    $(function () {
        $('[data-toggle="popover"]').popover();
        $('#aboutMe').click(function () {
            window.location="${ctx}/blogger/aboutMe"
        })
        $("#msg").click(function () {
            window.location.href="${ctx}/message/toLeaveMessage";
        });
        $("#login").click(function () {
            window.location.href="${ctx}/blogger/login";
        });
        //未读评论数
        $.ajax({
            type:"post",
            url:"${ctx}/comment/countUncheckedComments",
            data:${blogger.bloggerId}+"",
            contentType:"application/json;charset=utf-8",
            success:function (data) {
                 $("#uncheckedComments").html(data);
            },
            error:function () {
                alert("服务器连接失败！");
            }
        })

        $('#searchBtn').click(function () {
            var searchContent = $("#searchKeyWords").val();
            if(searchContent == ""){
                alert("尚未输入");
            }else{
                window.location.href="/blogger/searchMain?keyWords="+searchContent;
            }
        })
    })
</script>
</body>
</html>
