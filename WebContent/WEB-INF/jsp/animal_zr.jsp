
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
          <div class="layui-card-header">新增喂养方式</div>
          <div class="layui-card-body" pad15>
             <form action="AdminUserServlet?action=zrAnimal" method="post" >
              <div class="layui-form-item">
                <label class="layui-form-label">宠物名称：</label>
                <div class="layui-input-inline">
                  <input type="text" name="name" id="name" value="${animal.name}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
                <input type="hidden" name="animal_id" id ="animal_id"  value="${animal.id}"/>
                <input type="hidden" name="uer_id" id ="uer_id"  value="${user.id}"/>
                <input type="hidden" name="lyid" id ="lyid"  value="${lyid}"/>
                <input type="hidden" name="temp" id ="lyid"  value="${temp}"/>
              </div>
          
             <div class="layui-form-item">
                <label class="layui-form-label">照片:</label>
                <div class="layui-input-inline">
                  <img src="<%=path %>${animal.imgUrl}"  style="max-width: 200px;max-height: 150px">
                </div>
              </div>
              
                <div class="layui-form-item">
                <label class="layui-form-label">宠物种类：</label>
                <div class="layui-input-inline">
                  <input type="text" name="animal_type" id="animal_type" value="${animal.type}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">宠物编号：</label>
                <div class="layui-input-inline">
                  <input type="text" name="ano" id="ano" value="${animal.ano}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
              </div>
                  <div class="layui-form-item">
                <label class="layui-form-label">原主人：</label>
                <div class="layui-input-inline">
                  <input type="text" name="before_user_name" id="before_user_name" value="${user.realName}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">原主人电话：</label>
                <div class="layui-input-inline">
                  <input type="text" name="before_user_phone" id="before_user_phone" value="${user.phone}"  lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
              </div>
              
              <div class="layui-form-item">
                <label class="layui-form-label">新主人：</label>
                <div class="layui-input-inline">
                 <select name="now_user" id="now_user">
                  <option value="">请选择新主人进行转让</option>
                  <c:forEach items="${userList}" var="u">
                   <option value="${u.id}">${u.realName}</option>
                  </c:forEach>
                </select>
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">转让日期：</label>
                <div class="layui-input-inline">
                  <input type="text" name="zrDate" id="zrDate"   lay-verify="required" lay-verType="tips" class="layui-input" readonly>
                </div>
              </div>
              
              <div class="layui-form-item">
                <label class="layui-form-label">转让方式：</label>
                <div class="layui-input-block">
                  <select name="zr_ways" id="zr_ways" >
                  <option value="">请选择转让方式</option>
                    <option value="快递邮寄">快递邮寄</option> 
                    <option value="线下转让">线下转让</option>
                </select>
                </div>
                
              </div>
              
              <br>
                <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" type="submit" id="updateRecord">提交</button> 
                  <a href="AdminUserServlet?action=toRegsite" class="layui-btn layui-btn-primary" >去注册新用户</a>
                  <c:if test="${temp == 1}">
				             <a href="IndexServlet?action=MineZrAnimal" class="layui-btn layui-btn-primary" >返回</a>
				 </c:if> 
				  <c:if test="${temp == 2}">
				       <a href="AdminUserServlet?action=animalListRecord" class="layui-btn layui-btn-primary" >返回</a>
				 </c:if> 
                </div>
              </div>  -
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
	      elem: '#zrDate'
	      //,type: 'datetime'
	    });
	    
	 $('#updateRecord').click(function(){  
		  var now_user = $.trim($('#now_user').val());
		  var zrDate = $.trim($('#zrDate').val());
		  var uer_id = $.trim($('#uer_id').val());
		  var now_user = $.trim($('#now_user').val());
		  var zr_ways = $.trim($('#zr_ways').val());
		  
		  if(zrDate == ''){  
		         layer.msg('请选择转让时间',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(now_user == ''){  
		         layer.msg('请选择转让人',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(uer_id == now_user){  
		         layer.msg('您正在饲养，不能转让给自己！',{icon:6},function() {time:2000}); 
		         return false;  
		   }
		  if(zr_ways == ""){  
		         layer.msg('请选择转让方式！',{icon:6},function() {time:2000}); 
		         return false;  
		   }
	 });
   

});
</script>
</body>
</html>