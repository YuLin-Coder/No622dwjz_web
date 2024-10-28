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
			<div class="layui-card-header">管理员列表</div>
			<div class="layui-card-body">
           <!--  <form action="AdminUserServlet?action=adminListLike" method="post">
		           <input type="text" placeholder="根据管理员姓名查询" name="userName" id="userName" style="height:26px;" />
		           <input type="submit" class="layui-btn layui-btn-sm layui-btn-normal" value="查询" />
		     </form>  -->
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
							<th>用户名</th>
							<th>密码</th>
							<th>用户类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="u">
							<tr>
								<td>${u.userName }</td>
								<td>${u.password }</td>
						<%-- 		<td><c:choose>
										<c:when test="${u.type==1}">
                 	病人/患者
                   </c:when>
										<c:otherwise>
                	医生/管理员
                   </c:otherwise>
									</c:choose></td> --%>
								<td>${u.realName }</td>

								<td> <a href="AdminUserServlet?action=toEditAdmin&id=${u.id}"
									class="layui-btn layui-btn-sm layui-btn-normal"><i
										class="layui-icon">修改</i></a>  <%-- <a
									href="AdminUserServlet?action=deleteAdminUser&id=${u.id}" id="delete"
									class="layui-btn layui-btn-sm layui-btn-danger"><i
										class="layui-icon">&#xe640;</i></a> --%></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
             <%-- <div style="text-align: center">
					<div class="layui-btn-group">

						<a class="layui-btn layui-btn-primary"
							href="AdminUserServlet?action=adminList&p=1">首页</a>
						       判断是否有上一页
						<c:if test="${cp>1}">
							<a class="layui-btn layui-btn-primary"
								href="AdminUserServlet?action=adminList&p=${cp-1}">上一页</a>
						</c:if>
						       循环显示页码
						<c:forEach begin="${cp-2>1 ? (cp-2) :1}"
							end="${cp+2>tp?tp:(cp+2)}" var="e">
							           判断是否是当前页
							<c:if test="${cp==e}">
								<a class="layui-btn layui-btn-danger"
									href="AdminUserServlet?action=adminList&p=${e}">${e}</a>
							</c:if>
							<c:if test="${cp!=e}">
								<a class="layui-btn layui-btn-primary"
									href="AdminUserServlet?action=adminList&p=${e}">${e}</a>
							</c:if>

						</c:forEach>

						       判断是否有下一页
						<c:if test="${cp<tp}">
							<a class="layui-btn  layui-btn-primary"
								href="AdminUserServlet?action=adminList&p=${cp+1}">下一页</a>
						</c:if>
						<a class="layui-btn  layui-btn-primary"
							href="AdminUserServlet?action=adminList&p=${tp}">尾页</a> <a
							clss="layui-btn" href="AdminUserServlet?action=adminList&p=2">2</a>
						<a clss="layui-btn" href="AdminUserServlet?action=adminList&p=3">3</a>
						<a clss="layui-btn" href="AdminUserServlet?action=adminList&p=4">4</a>
					</div>
				</div> --%>

			</div>
		</div>
	</div>

	<script src="layui/jquery-1.9.1.min.js"></script>
	<script type="application/javascript">
$(function () {
	$("a.layui-btn-danger").click(function () {
		return confirm("你确定删除用户名为["+$(this).parent().parent().find("td:first").text()+"]这条记录吗");
	})
})

</script>

</body>
</html>