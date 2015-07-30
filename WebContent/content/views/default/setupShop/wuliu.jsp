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
					<ul>
						<li style="width: 250px;">收费方式</li>
						<li style="width: 171px;">首件/首重</li>
						<li>价格</li>
						<li style="width: 171px;">每加件/每加重</li>
						<li style="width: 150px;">加价</li>
					</ul>
				</div>

				<div class="nav_class" id="text3">
					<ul>
						<li style="width: 250px;">
							<c:if test="${wuliu.wuLiuType == 'zhongliang' }">按重量计算</c:if>
							<c:if test="${wuliu.wuLiuType == 'jianshu' }">按件数计算</c:if>
						</li>
						<li style="width: 171px;"><c:if test="${wuliu.wuLiuType == 'zhongliang' }">${wuliu.geshu }/kg</c:if>
						<c:if test="${wuliu.wuLiuType == 'jianshu' }">${wuliu.geshu }/件</c:if>
						</li>
						<li>${wuliu.firstPrice }</li>
						<li style="width: 171px;"><c:if test="${wuliu.wuLiuType == 'zhongliang' }">${wuliu.houshu }/kg</c:if>
						<c:if test="${wuliu.wuLiuType == 'jianshu' }">${wuliu.houshu }/件</c:if></li>
						<li style="width: 150px;">${wuliu.houPrice }</li>
					</ul>
				</div>
				<ul>
					<li style="width: 250px;"><input
								style="width: 50px; height: 25px; background: #0864f1; color: white; border: 0; border-radius: 10px;"
								size="6" type="button" onclick="xiugai();" value="修改" /></li>
						<li style="width: 171px;"></li>
						<li></li>
						<li style="width: 171px;"></li>
						<li style="width: 150px;"></li>
				</ul>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!--中间结束-->
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
