<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="/WEB-INF/common/form_header.jsp"/>
<body class="layui-layout-body">
  
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
            <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
         
         
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
         
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
            <c:if test="${flag==2}">
              <cite>欢迎用户${loveUser.realName}</cite>
              </c:if>
               <c:if test="${flag==1}">
              <cite>欢迎管理员:${user.realName}</cite>
              </c:if>
            </a>
            <dl class="layui-nav-child">
             
            
               <dd><a href="AdminUserServlet?action=LoginOutAct">退出登录</a></dd>
              <dd layadmin-event="logout" style="text-align: center;"></dd>
            </dl>
          </li>
          
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="home/console.html">
            <span>流浪动物后台管理</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item layui-nav-itemed">
              <a href="javascript:;" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-console"></i>
                <cite>主页</cite>
              </a>
              <dl class="layui-nav-child">
                <dd data-name="console" class="layui-this">
                  <a href="AdminUserServlet?action=welcome"  target="mainFrame">控制台</a>
                </dd>
                
              </dl>
            </li>
            <c:if test="${flag==1}">
            <li data-name="" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>个人信息管理</cite>
              </a>
              <dl class="layui-nav-child">
              
                <dd class="layui-nav-itemed">
                  <a href="AdminUserServlet?action=adminList" target="mainFrame">修改密码</a>
                </dd>
<!--                  <dd class="layui-nav-itemed">
                  <a href="AdminUserServlet?action=loveUserList" target="mainFrame">爱心人士</a>
                </dd>
 -->              </dl>
            </li>
          
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>流浪动物信息管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalList" target="mainFrame">流浪动物信息列表</a></dd>
                  </dl>
                   
                </dd>
              </dl>
            </li>
            
             <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>收养家庭信息管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dd class="layui-nav-itemed">
                  <a href="AdminUserServlet?action=loveUserList" target="mainFrame">领养家庭信息</a>
                </dd>
                   <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalListRecord" target="mainFrame">领养信息记录</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>
            
            
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>动物转让信息审核</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=zrApply" target="mainFrame">转让审核</a></dd>
                  </dl>
                </dd>
               
              </dl>
            </li>
            
             <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>收养回访记录管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=hfList" target="mainFrame">回访列表</a></dd>
                  </dl>
                   <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=addHf" target="mainFrame">新增回访记录</a></dd>
                  </dl>
                </dd>
               
              </dl>
            </li>
            </c:if>
               <c:if test="${flag==2}">
            <li data-name="" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>个人信息维护管理</cite>
              </a>
              <dl class="layui-nav-child">
              
                <dd class="layui-nav-itemed">
                  <a href="AdminUserServlet?action=loveUserList" target="mainFrame">我的信息</a>
                </dd>
                      
              </dl>
            </li>
         
            
          
            <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>流浪动物信息管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalList" target="mainFrame">流浪动物信息列表</a></dd>
                  </dl>
                    <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalListRecord&temp=3" target="mainFrame">我的领养记录</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>
            
               <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>流浪动物转让管理</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalListRecord&temp=2" target="mainFrame">我要转让</a></dd>
                  </dl>
                    <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=animalListRecord&temp=1" target="mainFrame">我的转让记录</a></dd>
                  </dl>
                </dd>
              </dl>
            </li>
            
              <li data-name="set" class="layui-nav-item">
              <a href="javascript:;" lay-tips="设置" lay-direction="2">
                <i class="layui-icon layui-icon-tabs"></i>
                <cite>流浪动物转让审核</cite>
              </a>
              <dl class="layui-nav-child">
                <dd class="layui-nav-itemed">
               
                  <dl class="layui-nav-child">
                    <dd><a href="AdminUserServlet?action=zrApply" target="mainFrame">转让审核</a></dd>
                  </dl>
                </dd>
               
              </dl>
            </li>
            
            
          </c:if>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
         <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div> 
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>
      
      
      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
          <iframe src="AdminUserServlet?action=welcome" id="mainFrame" name="mainFrame" style="width:100%;height:100%;"  frameborder="0" class="mainFrame"></iframe>
        </div>
      </div>
      
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

<script src="layui/layui.js"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>