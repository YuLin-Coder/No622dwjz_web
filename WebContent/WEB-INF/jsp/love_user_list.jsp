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
			<div class="layui-card-header">领养家庭信息列表</div>
			<div class="layui-card-body">
			   <c:if test="${flag==1}">
				   <form action="AdminUserServlet?action=loveListLike" method="post">
		           <input type="text" placeholder="根据用户名姓名查询" name="userName" id="userName" style="height:26px;" />
		           <input type="submit" class="layui-btn layui-btn-sm layui-btn-normal" value="查询" />
		         </form> 
		         </c:if> <span
					style="color: red" class="help-block m-b-none">${msg}</span>
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">

						<col width="100">
						<col width="150">
						<col width="150">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>用户名</th>
							<th>密码</th>
							<th>真实姓名</th>
							<th>邮箱</th>
							<th>性别</th>
							<th>手机号</th>
							<th>地址</th>
							<th>状态</th>
							<th>类型</th>
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
								<td>${u.userName }</td>
								<td>${u.password }</td>
								<td>${u.realName }</td>
								<td>${u.email }</td>
								<td>${u.sex }</td>
								<td>${u.phone }</td>
								<td>${u.address }</td>
								<c:if test="${u.state == 1}">
								  <td style="color:green;">已通过</td>
								</c:if>
								
								<c:if test="${u.state == 2}">
								  <td style="color:pink;">待审核</td>
								</c:if>
								
								<c:if test="${u.state == 0}">
								  <td style="color:red;">未通过</td>
								</c:if>
								
									<c:if test="${u.type == 1}">
								  <td style="color:green;">个人</td>
								</c:if>
								
								<c:if test="${u.type == 2}">
								  <td style="color:green;">组织</td>
								</c:if>
								
								
								<td>  
								<c:if test="${u.state == 2 && flag == 1}">
								<a href="AdminUserServlet?action=yes&id=${u.id}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="yes" >通过</a>
									<a href="AdminUserServlet?action=no&id=${u.id}"
									class="layui-btn layui-btn-sm layui-btn-normal" id="no" >不通过</a>
								</c:if> 
								
								<a href="AdminUserServlet?action=toEditLoveUser&id=${u.id}" id="delete"
									class="layui-btn layui-btn-sm layui-btn-normal"><i
										class="layui-icon">修改</i></a>
								
								<a href="AdminUserServlet?action=deleteLoveUser&id=${u.id}" id="delete"
									class="layui-btn layui-btn-sm layui-btn-danger"><i
										class="layui-icon">&#xe640;</i></a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
               <div style="text-align: center">
					<div class="layui-btn-group">

						<a class="layui-btn layui-btn-primary"
							href="AdminUserServlet?action=loveUserList&p=1">首页</a>
						<%--        判断是否有上一页--%>
						<c:if test="${cp>1}">
							<a class="layui-btn layui-btn-primary"
								href="AdminUserServlet?action=loveUserList&p=${cp-1}">上一页</a>
						</c:if>
						<%--        循环显示页码--%>
						<c:forEach begin="${cp-2>1 ? (cp-2) :1}"
							end="${cp+2>tp?tp:(cp+2)}" var="e">
							<%--            判断是否是当前页--%>
							<c:if test="${cp==e}">
								<a class="layui-btn layui-btn-danger"
									href="AdminUserServlet?action=loveUserList&p=${e}">${e}</a>
							</c:if>
							<c:if test="${cp!=e}">
								<a class="layui-btn layui-btn-primary"
									href="AdminUserServlet?action=loveUserList&p=${e}">${e}</a>
							</c:if>

						</c:forEach>

						<%--        判断是否有下一页--%>
						<c:if test="${cp<tp}">
							<a class="layui-btn  layui-btn-primary"
								href="AdminUserServlet?action=loveUserList&p=${cp+1}">下一页</a>
						</c:if>
						<a class="layui-btn  layui-btn-primary"
							href="AdminUserServlet?action=loveUserList&p=${tp}">尾页</a> <a
							clss="layui-btn" href="AdminUserServlet?action=loveUserList&p=2">2</a>
						<a clss="layui-btn" href="AdminUserServlet?action=loveUserList&p=3">3</a>
						<a clss="layui-btn" href="AdminUserServlet?action=loveUserList&p=4">4</a>
					</div>
				</div>

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