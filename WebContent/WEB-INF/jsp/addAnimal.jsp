
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
          <div class="layui-card-header">新增流浪动物</div>
          <div class="layui-card-body">
             <form action="AdminUserServlet?action=addAnimal" method="post" id="registerForm" name="registerForm" enctype="multipart/form-data">
              <div class="layui-form-item">
                <label class="layui-form-label">动物名称：</label>
                <div class="layui-input-inline">
				<input name="name" id="name" class="layui-input" /> 
                </div>
              </div>
              
               <div class="layui-form-item" >
                <label class="layui-form-label">动物昵称：</label>
                <div class="layui-input-inline">
				<input name="nickName" id="nickName" class="layui-input" /> 
                </div>
              </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">动物编号:</label>
                <div class="layui-input-inline">
                    <input name="ano" id="ano"  class="layui-input"  /> 
                </div>
              </div>
              
               <div class="form-group">
                  <img src="" id="preview_img" width="350px" height="200px" alt="">
                  </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">动物图片:</label>
                <div class="layui-input-inline">
                    <input type="file" name="imgUrl" id="imgUrl" class="layui-input"  /> 
                </div>
                  </div> 
                
                 <div class="layui-form-item">
                                <label class="layui-form-label">种类:</label>
 <select name="type" id ="type" lay-filter="aihao" style="width:15%;height:30px">
						        <option value="">请选择动物种类</option>
						        <option value="爬行类">爬行类</option>
						        <option value="哺乳类">哺乳类</option>
						        <option value="鸟类">鸟类</option>
						        <option value="两栖类">两栖类</option>
						        <option value="鱼类">鱼类</option>
						      </select>
                  </div> 
                
              <br>
                <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="sub_btn">提交</button>
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
	 
	 $(function () {
		    // 给注册绑定单击事件
		    $("#sub_btn").click(function () {
		     
		        var name = $("#name").val();
		        var nickName = $("#nickName").val();
		        var type = $("#type").val();
				var imgUrl = $.trim($("#imgUrl").val());
				var ano = $.trim($("#ano").val());
		        if(name == null || name== ""){
		        	layer.msg('动物名称不能为空！');
		        	return false;
		        }
		        
		        if(nickName == null || nickName== ""){
		        	layer.msg('动物昵称不能为空！');
		        	return false;
		        }
		        if(imgUrl == ''){  
			         layer.msg('物品图片为空',function() {time:2000}); 
			         return false;  
			     }
		        if(type == null || type== ""){
		        	layer.msg('动物类型不能为空！');
		        	return false;
		        }
		        if(ano == null || ano== ""){
		        	layer.msg('动物编号不能为空！');
		        	return false;
		        }
		    });
		    setTimeout(function(){ $("#errorMsg").html("")},3000);
	});
	 
	 $("#imgUrl").change(function () {
		    //创建blob对象，浏览器将文件放入内存中，并生成标识
		    var img_src = URL.createObjectURL($(this)[0].files[0]);
		    //给img标检的src赋值
		    document.getElementById("preview_img").src=img_src;
		    //URL.revokeObjectURL(img_src);// 手动 回收，
		});
   

});
</script>
</body>
</html>