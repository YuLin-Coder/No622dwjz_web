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
         <c:forEach items="${list}" var="a">
         
                 <div class="item">
            <div class="img">
              <img src="<%=path %>${a.img}"  style="width:300px;height:300px;">
            </div>
            <div class="text" style="line-height:30px;">
              <h3>名称：${a.aniaml_name}</h3>
               <h3>类型：${a.animal_type }</h3>
                   <h3>编号：${a.ano }</h3>
                 <h3>原主人：${a.yzr }</h3>
                  <h3>现主人：${a.xzrName }</h3>
                   <h3>转让方式：${a.zr_way }</h3> 
                  <h3>审核状态：
                  <c:if test="${a.state == 0}">
								<a style="color:red">审核不通过</a>
								</c:if> 
								<c:if test="${a.state == 1}">
								<a style="color:green">待现主人审核</a>
								</c:if> 
								<c:if test="${a.state == 2}">
								<a style="color:green">待管理员审核</a>
								</c:if> 
								<c:if test="${a.state == 3}">
								<a style="color:green">审核通过</a>
								</c:if> 
                  
                  </h3>
                <h3> <c:if test="${a.state == 1 &&  flag == 2}">
                操作
						<a href="AdminUserServlet?action=zrYes&id=${a.id}&state=${a.state}&temp=12"
							class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >通过</a>
							<a href="AdminUserServlet?action=zrNo&id=${a.id}&state=${a.state}&temp=12"
							class="layui-btn layui-btn-sm layui-btn-normal" id="no" >不通过</a>
						</c:if> 
						<c:if test="${flag == 1 &&  a.state == 2}">
						操作
						<a href="AdminUserServlet?action=zrYes&id=${a.id}&state=${a.state}&temp=12"
							class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >通过</a>
							<a href="AdminUserServlet?action=zrNo&id=${a.id}$state=${a.state}&temp=12"
							class="layui-btn layui-btn-sm layui-btn-normal" id="no" >不通过</a>
						</c:if>  
               </h4> 
              
            </div>
          </div>
         
         </c:forEach>
          
        </div>
      
      </div>
    </div>
  </div>
<script>
 
</script>


</body>
</html>