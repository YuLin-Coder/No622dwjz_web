
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

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">修改爱心人士信息</div>
          <div class="layui-card-body" pad15>
             <form action="AdminUserServlet?action=editLoveUser" method="post" >
              <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                <div class="layui-input-inline">
				<input name="userName" id="userName" class="layui-input" value="${loveUser.userName}" /> 
                </div>
              </div>
              
               <div class="layui-form-item" style="display:none;">
                <label class="layui-form-label">id：</label>
                <div class="layui-input-inline">
				<input name="loveId" id="loveId" class="layui-input" value="${loveUser.id}" readonly/> 
                </div>
              </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">密码:</label>
                <div class="layui-input-inline">
                    <input name="password" id="password"   class="layui-input" value="${loveUser.password}" /> 
                </div>
              </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-inline">
                    <input name="realName" id="realName" class="layui-input" value="${loveUser.realName}" /> 
                </div>
                  </div> 
                
                 <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input name="mail" id="mail" class="layui-input" value="${loveUser.email}" /> 
                </div>
                  </div> 
                
                 <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input name="sex" id="sex" class="layui-input" value="${loveUser.sex}" readonly/> 
                </div>
                  </div> 
                  
                 <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input name="phone" id="phone" class="layui-input" value="${loveUser.phone}" /> 
                </div>
              </div> 
              
                <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-inline">
                    <input name="address" id="address" class="layui-input" value="${loveUser.address}" /> 
                </div>
              </div> 
              
              <br>
                <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updateRecord">修改</button>
                  <a href="AdminUserServlet?action=animalList" class="layui-btn layui-btn-primary" >返回</a>
                </div>
              </div>  
              </form>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
		
	


<script src="layui/layui.js"></script>
<script src="layui/jquery-1.9.1.min.js"></script>
<script>

layui.use([ 'form','jquery','layer','laydate' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 laydate=layui.laydate,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	 

	 
	 laydate.render({
	      elem: '#hfTime'
	    });
	    
	 $('#updateRecord').click(function(){  
		  var userName = $.trim($('#userName').val());
		  var password = $.trim($('#password').val());
		  var realName = $.trim($('#realName').val());
		  var mail = $.trim($('#mail').val());
		  var sex = $.trim($('#sex').val());
		  var phone = $.trim($('#phone').val());
		  var address = $.trim($('#address').val());
		  
		  if(userName == ''){  
		         layer.msg('请选择用户名',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(password == ''){  
		         layer.msg('请填写密码',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(realName == ''){  
		         layer.msg('请填写真实姓名',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(mail == ''){  
		         layer.msg('请填写邮箱',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(sex == ''){  
		         layer.msg('请填写性别',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(phone == ''){  
		         layer.msg('请填写手机号',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(address == ''){  
		         layer.msg('请填写地址',{icon:6},function() {time:2000}); 
		         return false;  
		   }
	 });
   

});
</script>
</body>
</html>