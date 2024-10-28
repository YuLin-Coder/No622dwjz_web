<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>流浪动物救助网站</title>
  <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
  <script type="text/javascript" src="res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="IndexServlet?action=AnimalListAct">首页</a>
                 <c:if test="${flag == 1}">
         <a href="AdminUserServlet?action=toMain">后台</a> 
		</c:if>
      </p>
      <div class="sn-quick-menu">
        <c:if test="${loveUser == null && user == null}">
	      <div class="login"><a href="AdminUserServlet?action=toLogin">登录</a></div>
		</c:if>
		<c:if test="${loveUser != null}">
		      <div>用户名：${loveUser.realName}</div>&nbsp&nbsp&nbsp
		      <div class="login"><a href="AdminUserServlet?action=LoginOutAct">退出</a></div>
		      
		</c:if>
		<c:if test="${user != null}">
		      <div>管理员：${user.userName}</div>&nbsp&nbsp&nbsp
		      <div class="login"><a href="AdminUserServlet?action=LoginOutAct">退出</a></div>
		      
		</c:if>
        
         <div class="login" style="margin-left:10px"><a href="AdminUserServlet?action=toRegsite">注册</a></div> 
            <!-- <div class="sp-cart"><a href="shopcart.html">我的信息</a></div> -->
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="流浪动物救助网站">
            <img src="res/static/img/logo.png">
          </a>
        </h1>
         <div class="mallSearch">
          <form action="IndexServlet?action=animalListLike" method="post" class="layui-form" novalidate>
            <input type="text" name="animalName" id="animalName"  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入动物名称">
            <button class="layui-btn" type="submit"  lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
          </form>
        </div> 
      </div>
    </div>
  </div>


  <div class="content content-nav-base information-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="IndexServlet?action=AnimalListAct">流浪动物列表</a>
            <c:if test="${loveUser != null || !user == null}">
            <a href="IndexServlet?action=animalListRecord">我的收养记录</a>
              <a href="IndexServlet?action=MineZrAnimal">我要转让</a>
               <a href="IndexServlet?action=zrAnimal">我的转让信息</a>
           <a href="IndexServlet?action=zrApply">我的审核</a>
		</c:if>
            
          </div>
        </div>
      </div>
    </div>