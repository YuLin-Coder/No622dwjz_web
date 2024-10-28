<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
  <meta charset="UTF-8">
  <title>流浪动物网站</title>
  <link rel="stylesheet" type="text/css" href="static/css/main.css">
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
  <script type="text/javascript" src="../res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
      </p>
      <div class="sn-quick-menu">
      </div>
    </div>
  </div>



  <div class="header" style="text-algin:center;">
     <a style="color:pink;font-size:80px;letter-spacing:50px;margin-left: 20%;">
            流浪动物救助网站
          </a>
  </div>


  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form action="AdminUserServlet?action=login" method="post"  id="loginForm" name="loginForm">
            <legend>登录</legend>
            <div class="layui-form-item" style="margin-bottom: 4px;">
              <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                  <input type="text" name="userName" id="userName" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                <span id="msg3" style="color:red">${message}</span>
                </div>
              </div>
              <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                  <input id="password" type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
              </div>
              
               <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                 <select name="type" id="type" style="height: 35px;width: 100%;">
                  <option value="">请选择角色</option>
                    <option value="1">管理员</option> 
                    <option value="2">爱心人士</option>
                </select>
                </div>
              </div>
         
         
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" id="login" lay-filter="demo1" >登录</button>
              </div>
            <!--   <div class="layui-form-item" style="margin-top:10px;">
 			<a href="AdminUserServlet?action=toRegsite" class="layui-btn layui-btn-primary" style="width:100%">注册</a>
  		</div> -->
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<script src="layui/layui.js"></script>
<script>
layui.use(['layer', 'form','jquery'], function(){
	var form = layui.form,
	 layer = layui.layer,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
   
$("#login").on("click", function() {
    var userName = $("#userName").val().trim(); // trim()去除空格
    var password = $("#password").val().trim();
    var type = $("#type").val();
    
    
    if(userName == ""){
    	layer.msg('用户名不能为空！');
    	return false;
    }
    if(password == ""){
    	layer.msg('密码不能为空！');
    	return false;
    }
    if(type == ""){
    	layer.msg('请选择角色！');
    	return false;
    }
   /*  if(!username) {
        $("#msg").html("用户名不能为空！");
        $("#username").focus(); // 聚焦
        return false;
    } else {
        if(!password) {
            $("#msg").html("密码不能为空！");
            $("#password").focus(); // 聚焦
            return false;
        } else {
            $("#message").html("");
        }
    } */

});

setTimeout(function(){ $("#msg").html("")},3000);
setTimeout(function(){ $("#msg2").html("")},3000);
setTimeout(function(){ $("#msg3").html("")},3000);
});
</script>
</body>
</html>