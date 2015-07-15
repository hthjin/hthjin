<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>华腾汇金</title>
<link href="content/static/css/main.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style2.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>  
<!---------------------中间内容------------------------------>
<div class="login">
	<div class="left">
	<a href="index.html"><img src="content/static/images/logo.png" /></a>
	<img src="content/static/images/ladn.jpg"/></div>
    <div class="box">
    	<h2>欢迎登陆</h2>
        <form action="user/login" method="post">
        用户名：<input type="text" name="mobile"/><br /><input type="hidden" name="page" value="${page }"/>
        密&nbsp;&nbsp;&nbsp;码：<input type="password" style="margin-left:32px;" name="password" /><br />
        <input type="radio" class="radio"/>记住密码<br />
        <input type="submit"  value="登 陆" class="button" style=""/>
        </form>
        <a href="user/regist">立即注册</a>
    </div>
</div>
<!---------------------foot-------------------------->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
