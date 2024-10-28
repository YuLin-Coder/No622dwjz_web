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
              <img src="<%=path %>${a.imgUrl}"  style="width:300px;height:300px;">
            </div>
            <div class="text" style="line-height:30px;">
              <h3>名称：${a.name}</h3>
               <h3>昵称：${a.nickName }</h3>
               <h3>编号：${a.ano }</h3>
              <p class="login" style="color:green;">领养状态：<c:if test="${a.state == 1}">
								 已领养
								</c:if>
								<c:if test="${a.state == 0}">
								  未领养
								</c:if></p>
              <p class="info-cont" style="color:red;">喂养方式: <c:if test="${a.ways == ''}">
               无
					</c:if>${a.ways}
					
					<c:if test="${a.ways != ''}">
               ${a.ways}
					</c:if>
              </p>
              <c:if test="${a.state == 0}">
								<h3>操作:
              
              <c:if test="${a.state == 0 && flag == 2}">
					<a href="AdminUserServlet?action=ly&animal_id=${a.id}&user_id=${loveUser.id}&temp=100"
						class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >领养</a>
					</c:if>
              </h3>
			</c:if>
              
              
            </div>
          </div>
         </c:forEach> 
        </div>
        <div id="demo0" style="text-align: center;">
        
					<div class="layui-btn-group">

						<a class="layui-btn layui-btn-primary"
							href="IndexServlet?action=AnimalListAct&p=1">首页</a>
						<%--        判断是否有上一页--%>
						<c:if test="${cp>1}">
							<a class="layui-btn layui-btn-primary"
								href="IndexServlet?action=AnimalListAct&p=${cp-1}">上一页</a>
						</c:if>
						<%--        循环显示页码--%>
						<c:forEach begin="${cp-2>1 ? (cp-2) :1}"
							end="${cp+2>tp?tp:(cp+2)}" var="e">
							<%--            判断是否是当前页--%>
							<c:if test="${cp==e}">
								<a class="layui-btn layui-btn-danger"
									href="IndexServlet?action=AnimalListAct&p=${e}">${e}</a>
							</c:if>
							<c:if test="${cp!=e}">
								<a class="layui-btn layui-btn-primary"
									href="IndexServlet?action=AnimalListAct&p=${e}">${e}</a>
							</c:if>

						</c:forEach>

						<%--        判断是否有下一页--%>
						<c:if test="${cp<tp}">
							<a class="layui-btn  layui-btn-primary"
								href="IndexServlet?action=AnimalListAct&p=${cp+1}">下一页</a>
						</c:if>
						<a class="layui-btn  layui-btn-primary"
							href="IndexServlet?action=AnimalListAct&p=${tp}">尾页</a> <a
							clss="layui-btn" href="IndexServlet?action=AnimalListAct&p=2">2</a>
						<a clss="layui-btn" href="IndexServlet?action=AnimalListAct&p=3">3</a>
						<a clss="layui-btn" href="IndexServlet?action=AnimalListAct&p=4">4</a>
					</div>
				
        
        </div>
      </div>
    </div>
  </div>
<script>
 
</script>


</body>
</html>