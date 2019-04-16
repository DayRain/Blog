<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/3/26
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%      String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + path;
%>
<html>
<head>

    <title>
        <c:if test="${not empty requestScope.article.articleTitle}">
            ${requestScope.article.articleTitle}
        </c:if>
        <c:if test="${empty requestScope.article.articleTitle}">
            查看文章
        </c:if>
    </title>
    <script type="text/javascript" src="${basePath}/js/wangEditor.js"></script>
    <script type="application/javascript" src="${basePath}/jquery/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-theme.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/img/favicon.ico" />
    <script type="application/javascript" src="${basePath}/js/htmlEncode.js"></script>
    <script type="application/javascript" src="${basePath}/js/EmailCheck.js"></script>
    <script type="application/javascript" src="${basePath}/js/date.js"></script>
    <script type="application/javascript" src="${basePath}/js/bootstrap.min.js"></script>
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
        <div class="well well-lg well-sm" style="color: #2b669a;">
            <span id="myName" > 欢迎来到 <c:choose><c:when test="${not empty sessionScope.blogger.bloggerPassword}">${sessionScope.blogger.bloggerName}</c:when>
                <c:otherwise>小楼</c:otherwise>
            </c:choose> 的博客！ </span>
            <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
            <span style="margin-left: 65%" id="lastLoginTime">
            上次登录时间为：<fmt:formatDate value="${sessionScope.blogger.lastLogintime}"/>
            </span>
            </c:if>
        </div>
        <hr/>
        <div class="row">

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

                <div id="middlePanel">
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">${article.articleTitle}</h3>
                    </div>
                    <div class="panel-body">
                        ${article.articleContent}

                        <div>
                            <p style="text-align: right">创建日期: <fmt:formatDate type="both"
                                                     dateStyle="medium" timeStyle="medium"
                                                     value="${article.articleCreateTime}" /></p>
                        </div>
                    </div>
                </div>
                </div>

                <div>
                    <div style="display: inline">
                        <span style="cursor:pointer;float: left;font-size: 24px;color: #2aabd2" id="comment">评论</span>
                    </div>
                    <%--分页--%>
                    <c:choose>
                        <c:when test="${requestScope.beforePage>0}">
                            <div style="float: right">
                                <a href="${ctx}/blogger/main?currPage=${requestScope.beforePage}" style="text-align: right;font-size: 24px;color: #2aabd2">返回 </a>
                            </div>
                        </c:when>
                        <c:when test="${requestScope.beforePage<0}">
                            <div style="float: right">
                                <a href="${ctx}/blogger/backstage?currPage=${0-requestScope.beforePage}" style="text-align: right;font-size: 24px;color: #2aabd2">返回</a>
                            </div>
                        </c:when>
                    </c:choose>
                </div>

                <%--Comment--%>
                <div id="commentCode" hidden>
                    <div id="commentEmail" class="input-group">

                        <div class="form-group">
                            <label for="commentName" class="label label-info">昵称</label>
                            <input type="text" class="form-control" id="commentName" placeholder="name">
                        </div>
                        <div class="form-group">
                            <label for="email" class="label label-info">邮箱</label>
                            <div >
                                <input type="email" class="form-control" placeholder="email needed" id="email"s>
                                <label id="info" class="label" ></label>
                            </div>

                        </div>

                    </div>
                    <div id="editor" >
                    </div>
                    <div id="subComment">
                        <button id="btn1" value="保存" class="btn btn-default" style="margin-left: 90%;margin-top: 20px">提交</button>
                    </div>
                </div>

                <%--评论列表--%>
                <div style="margin-top: 50px">
                    <p style="color: #2aabd2">评论列表</p>
                    <br/>
                    <c:forEach items="${comments}" var="obj" varStatus="status">
                        <strong>${status.count}楼 &nbsp;&nbsp; &nbsp;日期：
                            <fmt:formatDate type="both"  dateStyle="medium" timeStyle="medium" value="${obj.commentCreateTime}" />
                            &nbsp;&nbsp; &nbsp;||&nbsp;&nbsp;@ &nbsp;${obj.commentName}
                            <c:if test="${not empty sessionScope.blogger.bloggerPassword}">
                                &nbsp;&nbsp;&nbsp;  <a href="/comment/delCommentAtPage/${obj.commentId}/${article.articleId}/${requestScope.beforePage}" onclick="return confirm('确认删除吗？')">删除</a>
                            </c:if>
                        </strong>
                        <p>${obj.commentContent}</p>
                        <hr/>
                    </c:forEach>
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
                <%--        留言展示--%>
                <div style="margin-top: 20px">
                    <p style="color: black">最近留言&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/message/toDetailMessages">查看更多</a></p>
                    <div style="margin-top: 10px">
                        <div>
                            <div class="well well-lg" style="color: #2aabd2">
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
        <div style="margin-top: 10px">
            <footer >
                <div class="panel-default" style="text-align: center;color: black">
                    欢迎来访，有问题请联系本人：1376034301@qq.com
                </div>
            </footer>
        </div>
    </div>


    <script type="text/javascript">

        $(function () {
            $('#aboutMe').click(function () {
                window.location="${ctx}/blogger/aboutMe"
            });
            $('[data-toggle="popover"]').popover();
            $("#msg").click(function () {
                window.location.href="${ctx}/message/toLeaveMessage";
            });
            $("#comment").one("click",function () {
                //组件显示
                $("#commentCode").toggle();
                //富文本编辑器
                var E = window.wangEditor;
                var editor = new E('#editor');
                // 或者 var editor = new E( document.getElementById('editor') )
                editor.create();
                $("#btn1").click(function () {
                    var comment = {
                        "articleId":${article.articleId},
                        "commentContent":editor.txt.html(),
                        "commentEmail":$("#email").val(),
                        "commentName":$("#commentName").val()
                    };
                    if(checkEmail(comment.commentEmail)){
                        $.ajax({
                        type:"post",
                        url:"${ctx}/comment/save",
                        data:JSON.stringify(comment),
                        contentType:"application/json;charset=utf-8",
                        success:function (data) {
                        if(data==1){
                        alert("提交成功!");
                        window.location="${ctx}/blogger/main";
                        }else{
                        alert("提交失败,可能的原因有：字数超过上限、未写评论。若不是以上原因请联系管理员。");
                        }
                        },
                        error:function () {
                        alert("连接失败");
                        }
                        })
                    }else{
                        alert("邮箱格式不正确,或未填写");
                    }
                });
            })




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
                    alert(searchContent);
                    window.location.href="/blogger/searchMain?keyWords="+searchContent;
                }
            })
            //    组件加载end


            $("#email").blur(function () {
                var value = $("#email").val();
                var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if (reg.test(value)) {
                    $("#info").html("邮箱格式正确");
                    $("#info").css("color","blue")
                } else {
                    $("#info").html("邮箱格式不正确!");
                    $("#info").css("color","red");
                }
            })

        })
    </script>
</body>
</html>
