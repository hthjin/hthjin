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
<meta name="GENERATOR" content="MSHTML 8.00.7600.16535">
<title></title>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/index2.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style2.css">

<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<SCRIPT src="content/static/js/hthjin/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>
<link rel="stylesheet" type="text/css"
	href="content/static/css/datetime/jquery.mobile.flatui.css">
<link rel="stylesheet" type="text/css"
	href="content/static/js/datetime/jquery.mobile-1.4.0-rc.1.js">
<link rel="stylesheet" type="text/css"
	href="content/static/js/datetime/jquery.js">
<link rel="stylesheet" type="text/css"
	href="content/static/js/map/jsAddress.js">
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
</script>
</head>

<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<!-- 左边部分 -->
	<div class="produta">
		<div class="produta_til">
			<a href="javascript:void(0);">卖家中心</a> > <span
				style="font-weight: 700;">订单</span>
		</div>
		<jsp:include page="setupShopCommons/left.jsp" />
		<!--中间开始-->
		<div class="sold">
			<div class="top1">
				<form action="proscenium/searchAlrdyComm" method="get" id="ww">
					商品名称：<input type="text" name="commName" /> 成交时间：从<input
						type="date" name="firstDate" /> 到<input type="date"
						name="lastDate" /><br> 买家昵称：<input type="text" name="uname" />
					订单状态：<select name="orderStatusFrom">
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
				<div class="nav1">
					<ul style="height: 55px;">
						<li style="width: 50px;">操作</li>
						<li style="width: 200px;">商品</li>
						<li style="width: 100px;">单价（元）</li>
						<li>数量</li>
						<li style="width: 100px;">买家</li>
						<li style="width: 150px;">交易状态</li>
						<li style="width: 142px;">实收款（元）</li>
					</ul>
						<c:forEach items="${searchOrders}" var="o">
							<c:forEach items="${o.commodities }" var="c" begin="0"
							varStatus="vs">
							<ul style="height: 55px;">
								<c:if test="${vs.index==0}">
									<li style="width: 50px;"><input style="width: 50px;"
										type="checkbox" name="checkbox" value="${o.orderFormID}" />
								</c:if>
								<c:if test="${vs.index!=0}">
									<li style="width: 50px;">
								</c:if>
								<li
									style="width: 200px; line-height: 20px; text-align: left; float: left;">
									<img src="../${c.shopCommodity.shopCommImages[0].imagePath }"
									width="50px" height="40px" style="margin-left: 15px;" />
									<div style="width: 100px; float: right;">${c.shopCommodity.commoidtyName }
									</div>
								</li>
								<li style="width: 100px;">￥${c.price}</li>
								<li>${c.quantity }</li>
								<li style="width: 100px;">${o.orderUser.userName}</li>
								<li style="width: 150px;"><c:if
										test="${o.orderstatus == 'waitPayment'}">等待买家付款</c:if> <c:if
										test="${o.orderstatus == 'BuyersHavePaid'}">买家已付款</c:if> <c:if
										test="${o.orderstatus == 'waitDelivery'}">等待卖家发货</c:if> <c:if
										test="${o.orderstatus == 'transitGoods'}">卖家已发货</c:if> <c:if
										test="${o.orderstatus == 'completionTransaction'}">完成交易</c:if>
									<c:if test="${o.orderstatus == 'refundOrderForm'}">关闭交易</c:if>
									<c:if test="${o.orderstatus == 'ApplicationForRefund'}">退款申请</c:if>
									<c:if test="${o.orderstatus == 'closeTransaction'}">退款中的订单</c:if>
									<c:if test="${o.orderstatus == 'refundSuccess'}">退款成功</c:if> <c:if
										test="${o.orderstatus == 'refundFailed'}">退款失败</c:if></li>
								<li style="width: 142px;">￥${c.money}</li>
							</ul>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
	<div class="cl"></div>
	</div>
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
