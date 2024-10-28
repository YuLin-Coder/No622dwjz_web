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
			<div class="layui-card-header">审核记录</div>
			<div class="layui-card-body">

				<!-- <a href="AdminUserServlet?action=adminList"
					class="layui-btn layui-btn-sm layui-btn-normal">返回主界面</a> -->
					<!-- <a href="AdminUserServlet?action=addAdmin"
					class="layui-btn layui-btn-sm layui-btn-normal">新增管理员</a> -->  <span
					style="color: red" class="help-block m-b-none">${msg}</span>
				<table class="layui-table">
					<colgroup>
						<col width="100">
						<col width="150">

						<col width="100">
						<col width="150">
						<col width="150">
						<col>
					</colgroup>
					<thead>
						<tr>
						<th>动物编号</th>
							<th>动物姓名</th>
							<th>动物图片</th>
							<th>动物类型</th>
							<th>原主人</th>
							<th>原主人手机号</th>
							<th>现主人</th>
							<th>现主人手机号</th>
							<th>转让方式</th>
							<th>转让时间</th>
							<th>审核状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="u">
							<tr>
							<td>${u.ano }</td>
								<td>${u.aniaml_name }</td>
								<td>  <img src="<%=path %>${u.img}"  style="max-width: 200px;max-height: 150px"> </td>
								<td>${u.animal_type }</td>
								<td>${u.yzr }</td>
								<td>${u.yzr_phone }</td>
								<td>${u.xzrName }</td>
								<td>${u.xzrPhone }</td>
								<td>${u.zr_way }</td>
								<td>${u.createTime }</td>
								<c:if test="${u.state == 0}">
								<td style="color:red">审核不通过</td>
								</c:if> 
								<c:if test="${u.state == 1}">
								<td style="color:green">待现主人审核</td>
								</c:if> 
								<c:if test="${u.state == 2}">
								<td style="color:green">待管理员审核</td>
								</c:if> 
								<c:if test="${u.state == 3}">
								<td style="color:green">审核通过</td>
								</c:if> 
								<td>  
								<c:if test="${u.state == 1 &&  flag == 2}">
								<a href="AdminUserServlet?action=zrYes&id=${u.id}&state=${u.state}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >通过</a>
									<a href="AdminUserServlet?action=zrNo&id=${u.id}&state=${u.state}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="no" >不通过</a>
								</c:if> 
								
								
								<c:if test="${flag == 1 &&  u.state == 2}">
								<a href="AdminUserServlet?action=zrYes&id=${u.id}&state=${u.state}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >通过</a>
									<a href="AdminUserServlet?action=zrNo&id=${u.id}$state=${u.state}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="no" >不通过</a>
								</c:if> 
								
								<c:if test="${flag == 1 &&  (u.state == 3 || u.state == 0)}">
									<a style="color:green;">已处理</a>
								</c:if> 
								</td>
							
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