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

	<div class="layui-col-md12">
		<div class="layui-card">
			<div class="layui-card-header">流浪动物信息列表</div>
			<div class="layui-card-body">
				<form action="AdminUserServlet?action=animalListLike" method="post">
		           <input type="text" placeholder="根据动物名称查询" name="userName" id ="userName" style="height:26px;" />
		           
		           <input type="submit" class="layui-btn layui-btn-sm layui-btn-normal" value="查询" />
		           <c:if test="${flag == 1}">
								 <a href="AdminUserServlet?action=toAddAnimal"
					class="layui-btn layui-btn-sm layui-btn-normal">新增动物</a>
					</c:if>
		           </form>   
				
           <!--     <form class="layui-form" action="AdminUserServlet?action=animalList"
					method="post" lay-filter="component-form-element">
					<label class="layui-form-label">
						<button type="submit" id="chaxun" class="layui-btn layui-btn-sm">查询</button>
					</label>
					<div class="layui-input-block">

						<input type="text" name="userName" id="userName"
							placeholder="根据动物名称查询" autocomplete="off" style="width: 180px;"
							class="layui-input">

					</div>
				</form>   -->      
				<!-- <a href="AdminUserServlet?action=adminList"
					class="layui-btn layui-btn-sm layui-btn-normal">返回主界面</a> -->
					   <span
					style="color: red" class="help-block m-b-none">${msg}</span>
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">

						<col width="200">
						<col width="150">
						<col width="150">
						<col>
					</colgroup>
					<thead>
						<tr>
						<th>动物编号</th>
							<th>动物名称</th>
							<th>动物昵称</th>
							<th>动物照片</th>
							<th>动物种类</th>
							<th>领养状态</th>
							<th>登记日期</th>
							<th>操作</th>
						
							
							<!-- email
							password
							realName
							sex
							phone
							address
							createTime
							state
							type
							userName -->
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="u">
							<tr>
							<td>${u.ano }</td>
								<td>${u.name }</td>
								<td>${u.nickName }</td>
								<td>  <img src="<%=path %>${u.imgUrl}"  style="max-width: 200px;max-height: 150px"> </td>
								<td>${u.type }</td>
								<c:if test="${u.state == 1}">
								  <td style="color:green;">已领养</td>
								</c:if>
								<c:if test="${u.state == 0}">
								  <td style="color:red;">未领养</td>
								</c:if>
								<td>${u.createTime }</td> 
								<td>  
								<c:if test="${u.state == 0 && flag == 2}">
								<a href="AdminUserServlet?action=ly&animal_id=${u.id}&user_id=${loveUser.id}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >领养</a>
								</c:if> 
								<c:if test="${flag == 1}">
								  <c:if test="${u.count == 0}">
								<a href="AdminUserServlet?action=toAddFeed&animal_id=${u.id}&animal_name=${u.name}&animal_url=${u.imgUrl}"
									class="layui-btn layui-btn-sm layui-btn-normal">新增喂养方式</a>
									</c:if> 
								<a href="AdminUserServlet?action=deleteAnimal&id=${u.id}" id="delete"
									class="layui-btn layui-btn-sm layui-btn-danger"><i
										class="layui-icon">&#xe640;</i></a>
								</c:if> 
								
								<c:if test="${u.count > 0}">
								<a href="AdminUserServlet?action=toFeed&animal_id=${u.id}&animal_url=${u.imgUrl}"
									class="layui-btn layui-btn-sm layui-btn-normal" >喂养方式</a>
								</c:if> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
               <div style="text-align: center">
					<div class="layui-btn-group">

						<a class="layui-btn layui-btn-primary"
							href="AdminUserServlet?action=animalList&p=1">首页</a>
						<%--        判断是否有上一页--%>
						<c:if test="${cp>1}">
							<a class="layui-btn layui-btn-primary"
								href="AdminUserServlet?action=animalList&p=${cp-1}">上一页</a>
						</c:if>
						<%--        循环显示页码--%>
						<c:forEach begin="${cp-2>1 ? (cp-2) :1}"
							end="${cp+2>tp?tp:(cp+2)}" var="e">
							<%--            判断是否是当前页--%>
							<c:if test="${cp==e}">
								<a class="layui-btn layui-btn-danger"
									href="AdminUserServlet?action=animalList&p=${e}">${e}</a>
							</c:if>
							<c:if test="${cp!=e}">
								<a class="layui-btn layui-btn-primary"
									href="AdminUserServlet?action=animalList&p=${e}">${e}</a>
							</c:if>

						</c:forEach>

						<%--        判断是否有下一页--%>
						<c:if test="${cp<tp}">
							<a class="layui-btn  layui-btn-primary"
								href="AdminUserServlet?action=animalList&p=${cp+1}">下一页</a>
						</c:if>
						<a class="layui-btn  layui-btn-primary"
							href="AdminUserServlet?action=animalList&p=${tp}">尾页</a> <a
							clss="layui-btn" href="AdminUserServlet?action=animalList&p=2">2</a>
						<a clss="layui-btn" href="AdminUserServlet?action=animalList&p=3">3</a>
						<a clss="layui-btn" href="AdminUserServlet?action=animalList&p=4">4</a>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script src="layui/jquery-1.9.1.min.js"></script>
	<script type="application/javascript">
$(function () {
	$("#delete").click(function () {
		return confirm("你确定删除用户名为["+$(this).parent().parent().find("td:first").text()+"]这条记录吗");
	})
	$("#yes").click(function () {
		return confirm("确定要领养吗？");
	})
	$("#no").click(function () {
		return confirm("确定不通过吗？");
	})
})

</script>

</body>
</html>