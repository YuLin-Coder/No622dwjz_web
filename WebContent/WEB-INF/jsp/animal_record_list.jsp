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
			<div class="layui-card-header">宠物领养记录</div>
			<div class="layui-card-body">

				<!-- <a href="AdminUserServlet?action=adminList"
					class="layui-btn layui-btn-sm layui-btn-normal">返回主界面</a> -->
					<!-- <a href="AdminUserServlet?action=addAdmin"
					class="layui-btn layui-btn-sm layui-btn-normal">新增管理员</a> -->  <span
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
							<th>宠物姓名</th>
							<th>宠物图片</th>
							<th>宠物类型</th>
							<th>宠物昵称</th>
							<th>领养人</th>
							<th>领养人手机号</th>
							<th>领养人地址</th>
							<th>领养时间</th>
							<th>领养状态</th>
							<c:if test="${temp == 2}">
							<th>操作</th>
							</c:if>
							
							
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
							    <c:if test="${temp == 2 && u.animal_type == 1}">
								    <td>${u.name }</td>
									<td>  <img src="<%=path %>${u.imgUrl}"  style="max-width: 200px;max-height: 150px"> </td>
									<td>${u.type }</td>
									<td>${u.nickName }</td>
									<td>${u.realName }</td>
									<td>${u.phone }</td>
									<td>${u.address }</td>
									<td>${u.createTime }</td>
									<c:if test="${u.animal_type == 1}">
									<td style="color:green">饲养中</td>
									</c:if> 
									<c:if test="${u.animal_type == 2}">
									<td style="color:green">已转让</td>
									</c:if> 
									<c:if test="${u.animal_type == 3}">
									<td style="color:green">转让中，待审核</td>
									</c:if> 
	 
									<c:if test="${flag == 2 && u.animal_type == 1}">
									 <td> 
									<a href="AdminUserServlet?action=animal_zr&user_id=${u.user_id}&lyid=${u.lyid}&animal_id=${u.animal_id}&temp=2"
										class="layui-btn layui-btn-sm layui-btn-normal" id="animal_zr" >转让</a>
									 </td>
									</c:if> 
								</c:if>
								
								<c:if test="${temp == 1 && u.animal_type != 1}">
							    <td>${u.name }</td>
								<td>  <img src="<%=path %>${u.imgUrl}"  style="max-width: 200px;max-height: 150px"> </td>
								<td>${u.type }</td>
								<td>${u.nickName }</td>
								<td>${u.realName }</td>
								<td>${u.phone }</td>
								<td>${u.address }</td>
								<td>${u.createTime }</td>
								<c:if test="${u.animal_type == 1}">
								<td style="color:green">饲养中</td>
								</c:if> 
								<c:if test="${u.animal_type == 2}">
								<td style="color:green">已转让</td>
								</c:if> 
								<c:if test="${u.animal_type == 3}">
								<td style="color:green">转让中，待审核</td>
								</c:if> 
								</c:if>
								
								<c:if test="${temp == 3}">
							    <td>${u.name }</td>
								<td>  <img src="<%=path %>${u.imgUrl}"  style="max-width: 200px;max-height: 150px"> </td>
								<td>${u.type }</td>
								<td>${u.nickName }</td>
								<td>${u.realName }</td>
								<td>${u.phone }</td>
								<td>${u.address }</td>
								<td>${u.createTime }</td>
								<c:if test="${u.animal_type == 1}">
								<td style="color:green">饲养中</td>
								</c:if> 
								<c:if test="${u.animal_type == 2}">
								<td style="color:green">已转让</td>
								</c:if> 
								<c:if test="${u.animal_type == 3}">
								<td style="color:green">转让中，待审核</td>
								</c:if> 
								</c:if>
							
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>
		</div>
	</div>

	<script src="layui/jquery-1.9.1.min.js"></script>
	<script type="application/javascript">
$(function () {
	$("a.layui-btn-danger").click(function () {
		return confirm("你确定删除用户名为["+$(this).parent().parent().find("td:first").text()+"]这条记录吗");
	})
	$("#yes").click(function () {
		return confirm("确定通过吗？");
	})
	$("#no").click(function () {
		return confirm("确定不通过吗？");
	})
})

</script>

</body>
</html>