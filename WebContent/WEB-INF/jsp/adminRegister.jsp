<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册界面</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/layui/css/layui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/layui/css/admin.css">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/layui/css/login.css">
</head>
<body>


	<form action="AdminUserServlet?action=adminRegister" method="post"
		id="registerForm" name="registerForm">
		<span id="" style="color: red;"></span>
		<div class="layadmin-user-login layadmin-user-display-show"
			id="LAY-user-login" style="display: none;">
			<div class="layadmin-user-login-main">
				<div class="layadmin-user-login-box layadmin-user-login-header">
					<h2>新增管理员</h2>
				</div>
				<div
					class="layadmin-user-login-box layadmin-user-login-body layui-form">
					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-username"
							for="LAY-user-login-cellphone"></label> <input type="text"
							name="userName" lay-verify="userName" id="userName"
							placeholder="用户名" class="layui-input">
						<div>
							<span id="errorMsg" style="color: red;">${msg}</span>
						</div>
					</div>
					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-username"
							for="LAY-user-login-cellphone"></label> <input type="text"
							name="realName" lay-verify="realName" id="realName"
							placeholder="昵称" class="layui-input">
					</div>
						<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="repass"></label> <input type="password" name="password"
							lay-verify="password" id="password" placeholder="密码"
							class="layui-input">
					</div>

					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="repass"></label> <input type="password" name="repass"
							lay-verify="password" id="repass" placeholder="确认密码"
							class="layui-input">
					</div>

					<div class="layui-form-item">
						<button type="submit" id="sub_btn"
							class="layui-btn layui-btn-fluid">注册</button>
					</div>

					<div class="layui-form-item">
						<a href="AdminUserServlet?action=adminList"
							class="layui-btn layui-btn-fluid">返回</a>
					</div>

				</div>
			</div>



		</div>




		<script src="<%=path %>/layui/layui.js"></script>
		<script>

layui.use([ 'form','jquery','layer' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	 $(function () {
		    // 给注册绑定单击事件
		    $("#sub_btn").click(function () {
		     
		        var userName = $("#userName").val();
		        var realName = $("#realName").val();
		        var password = $("#password").val();
		        var repass = $("#repass").val();
		        if(userName == null || userName== ""){
		        	layer.msg('用户名不能为空！');
		        	return false;
		        }
		        if(realName == null || realName== ""){
		        	layer.msg('真实名不能为空！');
		        	return false;
		        }
		        if(password == null || password== ""){
		        	layer.msg('密码不能为空不能为空！');
		        	return false;
		        }
		        if(password != repass){
		        	layer.msg('两次输入的密码不一致！');
		        	return false;
		        }
		        
		    });
		    setTimeout(function(){ $("#errorMsg").html("")},3000);
	 
   

	});
});
</script>
</body>
</html>