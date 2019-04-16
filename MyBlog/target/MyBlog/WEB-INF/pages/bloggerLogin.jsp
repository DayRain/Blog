<%--
  Created by IntelliJ IDEA.
  User: 13760
  Date: 2019/3/17
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>

    <script type="application/javascript" src="${basePath}/jquery/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-theme.min.css"/>
    <link href="${basePath}/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/img/favicon.ico" />
    <script type="application/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${basePath}/css/loginStyle.css">

</head>
<body>
<div class="container">
    <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">LOGIN</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="bloggerMail" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="password" name="bloggerPassword" maxlength="8"/>
                    </div>
                    <div class="form-group">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1" id="rememberMe"/>记住我
                            <a href="#" class="pull-right " style="color: #0f0f0f">忘记密码?</a>
                        </label>
                    </div>
                    <div>
                        <div class="form-group col-md-offset-1">
                            <button type="submit" class="btn btn-success pull-left" name="submit" id="register">注册</button>
                            <button type="submit" class="btn btn-success pull-right" name="submit" id="login">登录</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>

<script>
    $("#login").click(function () {
        var mail = $("#username").val();
        var psd = $("#password").val();
        var blogger = {
            "bloggerMail":mail,
            "bloggerPassword":psd
        };
        $.ajax({
            type:"post",
            url:"/blogger/checkInfo",
            data:JSON.stringify(blogger),
            contentType:"application/json;charset=utf-8",
            datatype:"json",
            success:function (data) {
                if(data != ""){
                   window.location.href="/blogger/main";
                }else{
                    alert("密码错误或查无此人！");
                }
            },
            error:function () {
                alert("服务器连接失败！");
            }
        })
    })

    $("#register").click(function () {
        alert("暂未开放");
    })
</script>

</body>
</html>