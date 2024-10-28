
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
          <div class="layui-card-header">新增回访记录</div>
          <div class="layui-card-body" >
             <form action="AdminUserServlet?action=addHfjl" method="post" >
         
         
              <div class="layui-form-item">
                <label class="layui-form-label">动物名称：</label>
                <div class="layui-input-inline">
                  <select name="animal_name" id ="animal_name" lay-filter="aihao" >
						        <option value="">请选择被访问的动物名称</option>
						         <c:forEach items="${list}" var="u">
						            <option value="${u.lyid}">${u.name}</option>
						         </c:forEach>
					</select>
                </div>
              </div>
              
           <%--     <div class="layui-form-item">
                <label class="layui-form-label">动物类别:</label>
                <div class="layui-input-inline">
                  <select name="animal_type" id ="animal_type" lay-filter="aihao" >
						        <option value="">请选择被访问的动物类别</option>
						         <c:forEach items="${list}" var="u">
						            <option value="${u.lyid}">${u.type}</option>
						         </c:forEach>
					</select>
                  <!--  <input name="animal_type" id="animal_type" class="layui-input" /> -->
                </div>
              </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">主人:</label>
                <div class="layui-input-inline">
                   <select name="zr" id ="zr" lay-filter="aihao" >
						        <option value="">请选择被访问的主人</option>
						         <c:forEach items="${list}" var="u">
						            <option value="${u.lyid}">${u.realName}</option>
						         </c:forEach>
					</select>
                </div>
              </div> --%>
              
             <div class="layui-form-item">
                <label class="layui-form-label">回访者:</label>
                <div class="layui-input-inline">
                   <input name="hfz" id="hfz" class="layui-input" />
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">回访时间:</label>
                <div class="layui-input-inline">
                   <input name="hfTime" id="hfTime" class="layui-input" />
                </div>
              </div>
          
              <div class="layui-form-item">
                <label class="layui-form-label">动物状况:</label>
                <div class="layui-input-inline">
                   <textarea name="animal_state" style="width:400px" id="animal_state" class="layui-textarea"></textarea>
                </div>
              </div>
              
              <br>
                <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updateRecord">修改</button>
                  <a href="AdminUserServlet?action=hfList" class="layui-btn layui-btn-primary" >返回</a>
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
		  var animal_name = $.trim($('#animal_name').val());
		  var hfz = $.trim($('#hfz').val());
		  var hfTime = $.trim($('#hfTime').val());
		  var animal_state = $.trim($('#animal_state').val());
		  if(animal_name == ''){  
		         layer.msg('请选择动物名称',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(hfz == ''){  
		         layer.msg('请填写回访者',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(hfTime == ''){  
		         layer.msg('请填写回访时间',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(animal_state == ''){  
		         layer.msg('请填写动物状况',{icon:6},function() {time:2000}); 
		         return false;  
		   }
	 });
   

});
</script>
</body>
</html>