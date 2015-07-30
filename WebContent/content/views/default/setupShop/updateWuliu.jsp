<%@page import="com.yc.entity.user.AppUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title></title>
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
	// 	$(function(){
	// 		$("#qhli").children($("#qhli")).click(event,function(){

	// 			var index=$("#qhli").children($("#qhli")).index(this);  //鼠标当前点击索引
	// 			var len=$("#qhli").children($("#qhli")).length;
	// 			for(var i=0;i<len;i++){
	// // 				alert(i==index);
	// 				if(i==index){
	// // 					alert($("#qhli").children($("#qhli")).eq(i).text());
	// 					$('#text'+(i+1)).css("display","block");
	// 				}else{
	// 					$('#text'+(i+1)).css("display","none");
	// 				}

	// 			}

	// 		});

	// 	});
	$(function() {

		$(".pingjia").click(
				event,
				function() {
					for (var i = 0; i < $(".pingjia").length; i++) {
						if (i == $(".pingjia").index($(this))) {
							$(".ping").eq(i).css("transition", "all 0.5s").css(
									"display", "block");
						} else {
							$(".ping").eq(i).css("transition", "all 0.5s").css(
									"display", "none");
						}

					}
				});
		$(".bu").click(
				event,
				function() {
					for (var i = 0; i < $(".bu").length; i++) {
						if (i == $(".bu").index($(this))) {
							$(".ping").eq(i).css("transition", "all 0.5s").css(
									"display", "none");
						}
					}
				});
	});
</script>
<!--退出js-->
<script>
	function xiugai(){
		window.location.href="proscenium/updateWuLiu";
	}
</script>

</head>

</head>

<body>

	<!--头部-->
	<jsp:include page="../nav.jsp" />
	<div class="produta">
		<div class="produta_til">
			<p>
				您现在的位置：<a>首页</a> > <a>卖家中心</a>
			</p>
		</div>
		<!-- 左边部分 -->
		<jsp:include page="setupShopCommons/left.jsp" />
		<!--中间开始-->
		<div class="bread">
			<div class="left1">
				<a>卖家中心</a> < <span style="font-weight: 700;">物流费用</span>
			</div>
		</div>
		<div class="sold">
			<div class="last" id="tab">
				<div class="nav1">
					<form action="proscenium/updateWL" method="post">
						收费方式&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="wuLiuType">
								<option value="zhongliang" <c:if test="${wuliu.wuLiuType == 'zhongliang' }">selected</c:if>>按重量计算
								<option value="jianshu" <c:if test="${wuliu.wuLiuType == 'jianshu' }">selected</c:if>>按件数计算
							</select>
							<br>
							<br>
						首件/首重 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="geshu" value="${wuliu.geshu }">件或KG<br>
							<br>
						价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="firstPrice" value="${wuliu.firstPrice }"><br>
						
							<br>每加件/每加重&nbsp;<input name="houshu" value="${wuliu.houshu }">件或KG<br>
							<br>
						加价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="houPrice" value="${wuliu.houPrice }">
						<br>
							<br><input type="submit" value="修改">
					</form>
				</div>
				
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!--中间结束-->
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
