
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
<title>>医院住院信息管理系统</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="layui/css/login.css">  
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">新增喂养方式</div>
          <div class="layui-card-body" pad15>
             <form action="AdminUserServlet?action=addFeedWay" method="post" >
         
         
              <div class="layui-form-item">
                <label class="layui-form-label">宠物名称：</label>
                <div class="layui-input-inline">
                  <input type="text" name="name" id="name" value="${name}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
                <input type="hidden" name="animal_id" id ="animal_id"  value="${id}"/>
              </div>
          
             <div class="layui-form-item">
                <label class="layui-form-label">照片:</label>
                <div class="layui-input-inline">
                  <img src="<%=path %>${url}"  style="max-width: 200px;max-height: 150px">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">喂养方式:</label>
                <div class="layui-input-inline">
                   <textarea name="feedWay" style="width:400px" id="feedWay" class="layui-textarea"></textarea>
                </div>
              </div>
              
              <br>
                <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updateRecord">提交</button>
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
<script>
layui.use([ 'form','jquery','layer','laydate' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 laydate=layui.laydate,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	  
	 laydate.render({
	      elem: '#createTime'
	      ,type: 'datetime'
	    });
	    
	 $('#updateRecord').click(function(){  
		  var feedWay = $.trim($('#feedWay').val());
		  if(feedWay == ''){  
		         layer.msg('喂养方式不能为空',{icon:6},function() {time:2000}); 
		         return false;  
		   }
	 });
   

});
</script>
</body>
</html>