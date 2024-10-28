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
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main" style="position:relative;top:100px;">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>流浪动物后台管理</h2>
      </div>
     
   <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
       <form action="AdminUserServlet?action=login" method="post"  id="loginForm" name="loginForm">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name="userName" lay-verify="userName" id="userName"  placeholder="用户名" class="layui-input">
        	<span id="msg" style="color:red"></span>
        		<span id="msg3" style="color:red">${message}</span>
        	
        </div>
       
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="password" lay-verify="password" id="password" placeholder="密码" class="layui-input">
          <span id="msg2" style="color:red"></span>
        </div>
        
         <div class="layui-form-item">
             <select name="type" id="type">
                  <option value="">请选择角色</option>
                    <option value="1">管理员</option> 
                    <option value="2">爱心人士</option>
                  </optgroup>
                </select>
         </div>
        <div class="layui-form-item">
         <button type="submit" id="login" class="layui-btn layui-btn-fluid">登陆</button>
        </div>
        
          <div class="layui-form-item">
 			<a href="AdminUserServlet?action=toRegsite" class="layui-btn layui-btn-fluid" >去注册</a>
  		</div>
 </form>
  </div>
      
     </div>
    </div>
    
    <div class="layui-trans layadmin-user-login-footer">
      
     
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