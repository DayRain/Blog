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
    <title>留言</title>
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
                    <li role="presentation" class="active"><a href="${ctx}/message/toLeaveMessage">写留言</a></li>
                    <li role="presentation"><a href="${ctx}/blogger/aboutMe" >关于</a></li>
                    <li role="presentation" ><a href="${ctx}/message/toDetailMessages" >留言板</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div style="margin-top: 100px"></div>
    <div class="form-horizontal">
        <div class="form-group">
            <label for="name" class="control-label col-md-2">昵称</label>
            <div class="col-md-6">
                <input id="name" type="text" class="form-control" placeholder="必填，让我知道你是谁"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="control-label col-md-2">邮箱</label>
            <div class="col-md-6">
                <input id="email" type="text" class="form-control" placeholder="可填，让我可以联系你"/>
            </div>
        </div>
    </div>
    <div class="form-group col-md-offset-2">
        <label class="checkbox">
            <input type="checkbox" id="open" value="1"/>设为私密（选中则不公开该留言）
        </label>
    </div>
    <div id="editor" style="width:75%;margin: auto">
    </div>
    <div class="form-horizontal">
        <button id="btn1" value="提交" class="btn-default" style="margin-left: 80%;margin-top: 20px">提交</button>
    </div>
</div>
<script type="application/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.create();
    //处理信息
    $("#btn1").click(function () {
        var open=1;
        if($("#open").prop("checked")){
            open=0;
        }
        var name = $("#name").val();
        var email=$("#email").val();
        var message=editor.txt.html();

        if(name==""){
            alert("昵称不为空");
        }else if(message=="<p><br></p>"){
            alert("您还未留下任何足迹")
        }else{
            var obj={
                messageBloggerId:${sessionScope.blogger.bloggerId},
                messageEmail:email,
                messageContent:message,
                messageName:name,
                messageOpen:open
            };
            $.ajax({
                type:"post",
                url:"${ctx}/message/messageSave",
                data:JSON.stringify(obj),
                contentType:"application/json;charset=utf-8",
                success:function (data) {
                    if(data == ""){
                        alert("提交失败");
                    }else{
                        alert("提交成功");
                        window.location.href="${ctx}/message/toLeaveMessage";
                    }
                },
                error:function () {
                    alert("服务器连接失败，请联系管理员");
                }
            })
        }
    })
</script>
</body>
</html>
