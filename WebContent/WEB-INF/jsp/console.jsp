<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<jsp:include page="/WEB-INF/common/form_header.jsp"/>

<body>
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend style="font-size: 100px;">欢迎来到流浪动物后台管理系统</legend>
</fieldset>    
 
</body>
<script src="layui/layui.js"></script>
<script>

layui.use(['element','carousel'], function(){
  var element = layui.element,
  carousel = layui.carousel
});
</script>
</html>

    