<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/common/header.jsp"/>
    <div class="info-list-box">
      <div class="info-list w1200">
        <div class="item-box layui-clear" id="list-cont">
         <c:forEach items="${recordList}" var="a">
         
         <c:if test="${a.animal_type == 1}">
                 <div class="item">
            <div class="img">
              <img src="<%=path %>${a.imgUrl}"  style="width:300px;height:300px;">
            </div>
            <div class="text" style="line-height:30px;">
              <h3>名称：${a.name}</h3>
               <h3>昵称：${a.nickName }</h3>
                   <h3>编号：${a.ano }</h3>
                <%-- <h3>领养人：${a.realName }</h3>
                  <h3>领养人手机号：${a.phone }</h3>
                   <h3>领养人地址：${a.address }</h3> --%> 
                  <h3>领养时间：${a.createTime }</h3>
              <p class="login" style="color:green;">领养状态：<c:if test="${a.animal_type == 1}">
								饲养中
								</c:if> 
								<c:if test="${a.animal_type == 2}">
								 已转让
								</c:if> 
								<c:if test="${a.animal_type == 3}">
								转让中，待审核
								</c:if> </p>
              <p class="info-cont">喂养方式</p>${a.ways}
              
                <h3>操作 <c:if test="${flag == 2 && a.animal_type == 1}">
               <a href="AdminUserServlet?action=animal_zr&user_id=${a.user_id}&lyid=${a.lyid}&animal_id=${a.animal_id}&temp=1"
									class="layui-btn layui-btn-sm layui-btn-normal" id="animal_zr" >转让</a>
               </c:if> 
               </h4> 
              
            </div>
          </div>
               </c:if> 
         
         
         
         
         
         </c:forEach>
          
        </div>
      
      </div>
    </div>
  </div>
<script>
 
</script>


</body>
</html>