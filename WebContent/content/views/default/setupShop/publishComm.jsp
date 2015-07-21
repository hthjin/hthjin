<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<meta charset="utf-8" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = (Shop) request.getSession().getAttribute("shop");
%>
<base href="<%=basePath%>" />
<title></title>
<link rel="stylesheet" type="text/css"
	href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">

<link rel="stylesheet" type="text/css"
	href="content/static/css/style2.css">

<link rel="stylesheet" type="text/css"
	href="content/static/css/index2.css">
<script src="content/static/js/hthjin/tz.js"></script>
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<!--选项卡js-->
<script type="text/javascript">
	function setTab(name, m, n) {
		for (var i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var showDiv = document.getElementById("text" + i);
			menu.className = i == m ? "on" : "";
			showDiv.style.display = i == m ? "block" : "none";
		}
	}
	function f1(div1, div2) {
		if (div2.style.display == "none") {
			div2.style.display = "block";
		} else {
			div2.style.display = "none";
		}
	}
</script>

</head>

<body>
	<!--头部-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!-- 左边部分 -->
	<div class="produta">
		<div class="produta_til">
			<a href="open.html">卖家中心</a> < <span style="font-weight: 700;">发布商品</span>
		</div>
		<jsp:include page="setupShopCommons/left.jsp" />
		<!--中间开始-->

		<div class="fabu">

			<h3 style="margin: 10px 0px 0px 15px;">请选择商品类型：</h3>

			<div class="center"
				style="margin-left: auto; margin-right: auto; float: none;">
				<div class="first">
					<ul>
						<c:forEach items="${list }" var="cate">
							<c:if test="${cate.categoryID != 1 }">
								<li id="red${cate.categoryID}" name="red"
									onclick="changeColor('${cate.categoryID}');">${cate.category }<img
									src="content/static/images/sanjiao.png" /></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<input type="hidden" id="cateID1" value="">
				<button class="btn" onclick="publishComm();">现在发布商品</button>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<div class="cl"></div>
	</div>

	<script type="text/javascript">
		function changeColor(flag) {
			var reds = document.getElementsByName("red");
			for(var i=0; i<reds.length;i++){
				reds[i].style.background="#fff";
			}
			var red = document.getElementById("red" + flag);
			red.style.fontSize == '22px';
			red.style.background = '#a40c59';
			$('#cateID1').val(flag);
		}
		function publishComm() {
			
			if ($('#cateID1').val() == "") {
				alert("请选择类别！");
			}else{
				window.location.href = "proscenium/releaseCommoidty?cateOne="+$('#cateID1').val();
			}
		}
	</script>
	<!--中间结束-->
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>
