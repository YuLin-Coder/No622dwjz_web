<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<jsp:include page="/WEB-INF/common/form_header.jsp"/>

<body>

	<form action="AdminUserServlet?action=registe" method="post"
		id="registerForm" name="registerForm">
		<span id="" style="color: red;"></span>
		<div class="layadmin-user-login layadmin-user-display-show"
			id="LAY-user-login" style="display: none;">
			<div class="layadmin-user-login-main">
				<div class="layadmin-user-login-box layadmin-user-login-header">
					<h2>注册界面</h2>

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
							placeholder="真实姓名" class="layui-input">
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
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="LAY-user-login-password"></label> 
							 <select name="sex" id="sex">
				                  <option value="">请选择性别</option>
				                    <option value="男">男</option> 
				                    <option value="女">女</option>
				                </select>
					</div>

					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="phone"></label> <input type="text" name="phone"
							lay-verify="phone" id="phone" placeholder="手机号"
							class="layui-input">
					</div>
					
					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="address"></label> <input type="text" name="address"
							lay-verify="address" id="address" placeholder="家庭地址"
							class="layui-input">
					</div>
					
					<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="email"></label> <input type="text" name="email"
							lay-verify="email" id="email" placeholder="邮箱"
							class="layui-input">
					</div>
					
						<div class="layui-form-item">
						<label
							class="layadmin-user-login-icon layui-icon layui-icon-password"
							for="email"></label> <select name="type" id="type">
				                  <option value="">请选择注册类型</option>
				                    <option value="1">个人</option> 
				                    <option value="2">组织</option>
				                </select>
					</div>

					<div class="layui-form-item">
						<button type="submit" id="sub_btn"
							class="layui-btn layui-btn-fluid">注册</button>
					</div>

					<div class="layui-form-item">
						<a href="AdminUserServlet?action=login"
							class="layui-btn layui-btn-fluid">返回登陆</a>

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
		        var sex = $("#sex").val();
		        var phone = $("#phone").val();
		        var address = $("#address").val();
		        var email = $("#email").val();
		        var type = $("#type").val();
		        
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
		        if( password != repass){
		        	layer.msg('两次密码不一致！');
		        	return false;
		        }
		        if(sex == null || sex== ""){
		        	layer.msg('请选择性别！');
		        	return false;
		        }
		        if(phone == null || phone== ""){
		        	layer.msg('请填写电话号码');
		        	return false;
		        }
		        if(address == null || address== ""){
		        	layer.msg('请填写家庭住址或者机构地址！');
		        	return false;
		        }
		        if(email == null || email== ""){
		        	layer.msg('请填写邮箱信息！');
		        	return false;
		        }
		        if(type == null || type== ""){
		        	layer.msg('请选择注册类别');
		        	return false;
		        }

		    });
		    setTimeout(function(){ $("#errorMsg").html("")},3000);
	 
   

	});
});
</script>
</body>
</html>