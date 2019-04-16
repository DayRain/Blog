<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li role="presentation" class="active"><a href="${ctx}/blogger/backstage" >文章管理</a></li>
                        <li role="presentation"><a href="${ctx}/comment/commentManage" >评论管理</a></li>
                        <li role="presentation"><a href="${ctx}/message/messageManage">留言管理</a></li>
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

    <div class="container" style="margin-top: 50px">
        <table class="table table-bordered">
            <thead class='table'>
            <tr><td colspan="8" style="text-align: center">文章列表</td></tr>
            <tr><td class='col-md-1'>编号</td><td  class='col-md-4'>题目</td><td class='col-md-1'>状态</td><td class='col-md-1'>评论数</td><td class='col-md-1'>阅读数</td><td class='col-md-2'>发布日期</td><td class='col-md-1'>操作</td><td class='col-md-1'>操作</td></tr>
            </thead>
            <c:forEach items="${requestScope.article}" var="u" varStatus="status">
                <tr>
                    <td class='col-md-1'>${status.count+(requestScope.page.currPage-1)*8}</td>
                    <td class='col-md-4'><a href="/article/articleDetail/${u.articleId}/${0-requestScope.page.currPage}" class="title">${u.articleTitle}<a/></td>
                    <td class='col-md-1'>已发布</td>
                    <td class='col-md-1'>${u.articleComments}</td>
                    <td class='col-md-1'>${u.articlePageview}</td>
                    <td class='col-md-2'><fmt:formatDate value="${u.articleCreateTime}"/></td>
                    <td class='col-md-1'><a href="${ctx}/blogger/writeBlog?articleId=${u.articleId}">编辑</a></td>
                    <td class='col-md-1'><a href='${ctx}/article/delArticle/${u.articleId}' onclick="return confirm('确认删除吗？')">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div style="text-align: right">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${requestScope.page.currPage != 1}">
                    <li>
                        <a href="${ctx}/blogger/backstage?currPage=1" aria-label="首页">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="${ctx}/blogger/backstage?currPage=${requestScope.page.currPage-1}">上一页</a></li>
                </c:if>

                <c:if test="${requestScope.page.currPage != requestScope.page.totalPage}">
                    <li><a href="${ctx}/blogger/backstage?currPage=${requestScope.page.currPage+1}">下一页</a></li>
                    <li>
                        <a href="${ctx}/blogger/backstage?currPage=${requestScope.page.totalPage}" aria-label="尾页">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

            </ul>
        </nav>
    </div>
</div>

</body>
</html>
