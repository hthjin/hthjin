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
<title>新闻中心</title>
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
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#oul").children(this).children($("#oul").children(this))
						.hover(
								function() {
									var index = $("#oul").children(this).index(
											this);
									$(this).css("backgroundColor", "#EB4642")
											.css("color", "#fff");
								},
								function() {
									$(this).css("backgroundColor", "#fff").css(
											"color", "#999");
								});
			});
</script>
</head>
<body>
	<!--头部开始-->
	<jsp:include page="nav.jsp" />
	<!--头部结束-->
	<!--面包屑-->
	<div class="breadcar">
		<div style="width: 1200px;" class="bread2">
			<div style="width:200px;height:30px; folat:left; line-height:15px;"><a href="hthjin.html">首页 </a> <span> &gt; 新闻中心</span></div>
		</div>
	</div>
	<!--文章内容-->
	<div class="content">
		<div class="news_main">
			<div class="new_class">
				<div class="left">
					<ul>
						<c:forEach items="${news }" var="xinwen">
							<li><a href="production?agricID=${xinwen.id }"><c:if
										test="${fn:length(xinwen.productsName)<=16}">${xinwen.productsName }</c:if>
									<c:if test="${fn:length(xinwen.productsName )>16}">${fn:substring(xinwen.productsName, 0, 16)}.....</c:if>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="right">
					<h2>${products.productsName }</h2>
					<div class="time">
						<span>${products.benefits }来源：<a href="index.html">${products.productsName }</a></span>
					</div>
					<hr />
					<div class="p_main">${products.effect }</div>

				</div>
				<div class="button">
						<c:if test="${products.id-1 <1 }">
							<p style="float: left;">上一篇：无</p>
						</c:if>
					<c:forEach items="${news }" var="other">
						<c:if test="${products.id-1 >0 }">
							<c:if test="${other.id == products.id-1}">
								<a href="production?agricID=${other.id }"><p
										style="float: left;">
										上一篇：
										<c:if test="${fn:length(other.productsName)<=20}">${other.productsName }</c:if>
										<c:if test="${fn:length(other.productsName )>20}">${fn:substring(other.productsName, 0, 20)}.....</c:if>
									</p></a>
							</c:if>
						</c:if>
						<c:if test="${other.id == products.id+1}">
							<a href="production?agricID=${other.id }"><p
									style="float: right;">
									下一篇：
									<c:if test="${fn:length(other.productsName)<=20}">${other.productsName }</c:if>
									<c:if test="${fn:length(other.productsName )>20}">${fn:substring(other.productsName, 0, 20)}.....</c:if>
								</p></a>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!---------------------foot-------------------------->
	<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>