<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>关于我们</title>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/news.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/main.css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="content/static/js/hthjin/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="content/static/js/hthjin/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>
<jsp:include page="nav.jsp" />
	<!--头部结束-->
	<!--面包屑-->
	<div class="breadcar">
		<div style="width: 1000px;" class="bread2">
			<div style="width:200px;height:30px; folat:left; line-height:15px;"><a href="hthjin">首页 </a> <span> &gt; 公司简介</span></div>
		</div>
	</div>
	<div class="about">
	<div class="box1">
    	<span>${products.productsName }</span>
    	${products.effect }
    </div>
</div>
	<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>