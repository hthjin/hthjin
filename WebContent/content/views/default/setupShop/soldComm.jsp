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
<script src="content/static/js/hthjin/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<SCRIPT src="content/static/js/hthjin/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript" src="content/static/js/hthjin/index_v20.js"></script>

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
	window.onload = function() {
		var zh1 = document.getElementById("zh1");
		var zh2 = document.getElementById("zh2");
		var nav3 = document.getElementById("nav3");
		var timer = null;
		zh2.onmouseover = zh1.onmouseover = function() {
			clearTimeout(timer);
			zh2.style.display = "block";
			nav3.style.backgroundColor = "#fff";
		};
		zh2.onmouseout = zh1.onmouseout = function() {
			timer = setTimeout(function() {
				zh2.style.display = "none";
				nav3.style.backgroundColor = "#eee";
			}, 500);
		};

		// 		$(".fa").click(event,function(){
		// 			for(var i=0;i<$(".fa").length;i++){
		// 				if(i==$(".fa").index($(this))){
		// 					$(".ping").eq(i).css("transition","all 0.5s").css("display","none");
		// 				}
		// 			}
		// 			});

	}
</script>

</head>

</head>

<body>

	<!--头部-->
	<jsp:include page="../nav.jsp" />
<div class="produta">    
    	<div class="produta_til">
    	  <p>您现在的位置：<a>首页</a> > <a>卖家中心</a></p></div>
	<!-- 左边部分 -->
	<jsp:include page="setupShopCommons/left.jsp" />
	<!--中间开始-->
	<div class="bread">
		<div class="left1">
			<a href="open.html">卖家中心</a> < <span style="font-weight: 700;">订单管理</span>
		</div>
	</div>
	<div class="sold" >
		<div class="top1">
			<form action="proscenium/searchAlrdyComm" method="get" id="ww">
				商品名称：<input type="text" name="commName" /> 成交时间：从<input type="date"
					name="firstDate" /> 到<input type="date" name="lastDate" /><br>
				买家昵称：<input type="text" name="uname" /> 订单状态：<select
					name="orderStatusFrom">
					<option value="">全部</option>
					<option value="waitPayment">等待买家付款</option>
					<option value="BuyersHavePaid">买家已付款</option>
					<option value="transitGoods">卖家已发货</option>
					<option value="waitDelivery">等待卖家发货</option>
					<option value="completionTransaction">交易成功</option>
					<option value="closeTransaction">交易关闭</option>
					<option value="refundOrderForm">退款中的订单</option>
				</select> 订单编号：<input type="text" name="orderId" /> <br /> <input
					type="submit" value="搜索" />
			</form>
		</div>
		<div class="last" id="tab">
			<div class="nav">
				<ul id="qhli">
					<li id="tow1" onclick='setTab("tow",1,9)'>近三个月订单</li>
						<li id="tow2" onclick='setTab("tow",2,9)'>等待买家付款</li>
						<li id="tow3" class="on" onclick='setTab("tow",3,9)'>等待发货</li>
						<li id="tow4" onclick='setTab("tow",4,9)'>已发货</li>
						<li id="tow5" onclick='setTab("tow",5,9)'>退款中</li>
						<li id="tow6" onclick='setTab("tow",6,9)'>退款成功</li>
						<li id="tow7" onclick='setTab("tow",7,9)'>成功的订单</li>
						<li id="tow8" onclick='setTab("tow",8,9)'>关闭的订单</li>
						<li id="tow9" onclick='setTab("tow",9,9)'>三个月前的订单</li>
				</ul>
			</div>
			<div class="nav1">
				<ul>
					<li style="width: 50px;">操作</li>
					<li style="width: 150px;">商品</li>
					<li style="width: 100px;">单价（元）</li>
					<li>数量</li>
					<li>售后</li>
					<li>买家</li>
					<li>交易状态</li>
					<li style="width: 100px;">实收款（元）</li>
				</ul>
			</div>
			<form action="proscenium/multiDelivery"
				onsubmit="return checkedMulti();" method="get">
				<div class="nav_class" id="text3">
					<ul>
						<li><input
							style="width: 50px; height: 25px; background: #0864f1; color: white; border: 0; border-radius: 10px;"
							size="6" type="submit" value="发货" /></li>
						<li><label id="tishi" style="color: red;"></label></li>
					</ul>
					<c:forEach items="${waitDelivery}" var="o">
						<c:forEach items="${o.commodities }" var="c" begin="0"
							varStatus="vs">
							<ul>
								<c:if test="${vs.index==0}">
									<li><input style="width: 50px;" type="checkbox"
										name="checkbox" value="${o.orderFormID}" /></li>
								</c:if>
								<c:if test="${vs.index!=0}">
									<li></li>
								</c:if>
								<li
									style="width: 150px; line-height: 20px; text-align: left; float: left;">
									<img src="images/quan.jpg" width="50px" height="40px"
									style="margin-left: 15px;" />
									<div style="float: right; margin-right: 20px;">${c.shopCommodity.commoidtyName }<br />1
									</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li></li>
								<li>${o.orderUser.userName}</li>
								<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
									<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if>
									<c:if test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li>￥${c.money}</li>

								<li></li>
							</ul>
						</c:forEach>
					</c:forEach>
				</div>
			</form>
			<script type="text/javascript">
				function checkedMulti() {
					var tishi = $("#tishi");
					var chk_value = [];
					$("input[name='checkbox']:checked").each(function() {
						chk_value.push($(this).val());
					});
					if (chk_value.length == 0) {
						tishi.text("请选中一个");
						return false;
					}
					if (chk_value.length > 1) {
						tishi.text("请只选中一个");
						return false;
					}
					if (chk_value.length == 1) {
						return true;
					}
				}
			</script>

			<div class="nav_class" style="display: none;" style="border: 0"
				id="text1">
				<c:forEach items="${order3Month}" var="o">
					<ul>
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</ul>

				</c:forEach>
			</div>
			<div class="nav_class" style="display: none;" id="text2">
				<ul>
					<c:forEach items="${waitPayment}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="nav_class" style="display: none;" id="text4">
				<ul>
					<c:forEach items="${transitGoods}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="nav_class" style="display: none;" id="text5">
				<ul>
					<c:forEach items="${refundOrderForm}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="nav_class" style="display: none;" id="text6">
				<ul>
					<c:forEach items="${refundSuccess}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID== o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>

			<div class="nav_class" style="display: none;" id="text7">
				<ul>
					<c:forEach items="${completionTransaction}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<div class="ping" style="display: none;">
								<form action="proscenium/evaluteUser" method="post">
									<div class="content" style="height: 250px;">
										<div style="text-align: center;">
											<input type="text" name="userId" value="${o.orderUser.id}" />
											<input type="text" name="orderFormID"
												value="${o.orderFormID}" /> <input type="text"
												name="commCode" value="${c.shopCommodity.commCode}" /> 评价：
											<input type="radio" name="reviewsRank" value="good"
												checked="checked" />好评 <input type="radio"
												name="reviewsRank" value="better" />中评 <input type="radio"
												name="reviewsRank" value="bad" />差评
										</div>
										<div class="box">
											<textarea name="businessreply"></textarea>
										</div>
										<input type="submit" id="fa" value="发表评论" /> <span class="bu"
											id="bu">暂不评论</span>
									</div>
								</form>
							</div>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>

			<script>
			<!--第一个-->
				$("#ping").children($("#ping")).hover(
						function() {

							//索引
							var index = $("#ping").children($("#ping")).index(
									this);
							$(this).css("backgroundPosition", "0px 15px");
							for (var i = 0; i <= index; i++) {
								$("#ping").children($("#ping")).eq(i).css(
										"backgroundPosition", "0px 15px");
							}
							for (var j = index + 1; j <= 5; j++) {
								$("#ping").children($("#ping")).eq(j).css(
										"backgroundPosition", "0px 0px");
							}

						}, function() {
							if (index == 5) {
								return;
							}
							$(this).css("backgroundPosition", "0px 0px");
						});
			</script>

			<div class="nav_class" style="display: none;" id="text8">
				<ul>
					<c:forEach items="${closeTransaction}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
	                        	${c.shopCommodity}
		                        <c:forEach
								items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<c:if test="${re.reviewsRank != null}">
											<li>${re.reviewsRank}</li>
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>

						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="nav_class" style="display: none;" id="text9">
				<ul>
					<c:forEach items="${order3Month}" var="o">
						<c:forEach items="${o.commodities }" var="c">
							<li
								style="width: 250px; line-height: 20px; text-align: left; float: left;">
								<img src="images/quan.jpg" width="50px" height="40px"
								style="margin-left: 15px;" />
								<div style="float: right; margin-right: 20px;">${c.shopCommodity.commCode }<br />${c.shopCommodity.commoidtyName }</div>
							</li>
							<li style="width: 100px;">￥${c.price}</li>
							<li>${c.quantity }</li>
							<li></li>
							<li>${o.orderUser.userName}</li>
							<li><c:if test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if>
								<c:if test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
									test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
									test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
									test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
								<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if> <c:if
									test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if> <c:if
									test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if> <c:if
									test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
									test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
							<li>￥${c.money}</li>
							<c:forEach items="${c.shopCommodity.shopreviews}" var="re">
								<c:if test="${re.user.id == o.orderUser.id}">
									<c:if test="${re.orderForm.orderFormID == o.orderFormID}">
										<li>${re.reviewsRank}</li>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>

		</div>
	</div>
	<div class="cl"></div>
	</div>
	<div class="cl"></div>
	</div>
	<!--中间结束-->
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
