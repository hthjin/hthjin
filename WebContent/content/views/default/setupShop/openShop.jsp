<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = null;
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>华腾汇金</title>
<link rel="stylesheet" type="text/css"
	href="content/static/css/index2.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style2.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<SCRIPT src="content/static/js/hthjin/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>

<script>
	function f1(div1, div2) {
		if (div2.style.display == "none") {
			div2.style.display = "block";
		} else {
			div2.style.display = "none";
		}
	}
</script>
<style>
#nav {
	display: none;
}
</style>
</head>

<body>
	<!--头部-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!-- 左边部分 -->
	<div class="produta">
		<div class="produta_til">
			<p>
				您现在的位置：<a>首页</a> > <a>卖家中心</a>
			</p>
		</div>
		<jsp:include page="setupShopCommons/left.jsp" />
		<div class="cl"></div>
	</div>
	<!-- 页脚部分 -->
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>
