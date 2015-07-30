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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>不倒翁</title>
<link href="content/static/css/style2.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/index.css" rel="stylesheet"
	type="text/css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slide.js" type="text/javascript"></script>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jsAddress.js"></script>
</head>

<body>

<!--头部-->
<jsp:include page="../frontDesk/header.jsp"/>
<!--中间内容-->
<div class="seller" style="margin:30px 0 0 190px;font-size: 12px;height: auto;">
    <div class="center">
    	<div class="top_nav">
        	<div class="top_nav_class">
                <ul>
                    <li style="background-color:#a40c59; color:#fff;">支付宝支付</li>
                </ul>
            </div>
            
        </div>
    </div>
   <div style="height: auto;overflow: hidden;">
   		支付信息：
   		<c:forEach items="${orderformList}" var="o" varStatus="vs">
		   	<ul>
		   		<li>${vs.index+1}</li>
		   		<c:forEach items="${o.commodities }" var="c">
		   			<li>商家信息：${c.shopCommodity.belongTo.shopName }<li>
		   			<input type="hidden" name="shopId" value="${c.shopCommodity.belongTo.id}"/>
		   		</c:forEach>
		   		<li>下单时间：${o.orderDate } ${o.orderTime}</li>
		   		<li>价格：<fmt:formatNumber
									value="${o.totalPrice}" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber></li>
		   		<li>运费：<fmt:formatNumber
									value="${o.delivery.deliveryMoney }" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber></li>
		   		<li>共计：<fmt:formatNumber
									value="${o.totalPrice + o.delivery.deliveryMoney }" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber></li>
		   		<form action="mainServlet" method="get">
		   			<!-- 后期传值：appid,appsecret,partner,partnerkey,backUri -->
		   			<!-- 现在传值：userId 用户id, orderNo订单Id, describe例：食品名称, money -->
		   			<input type="hidden" name="userId" value="${o.orderUser.id }"/>
		   			<input type="hidden" name="orderNo" value="${o.orderFormID }"/>
		   			<input type="hidden" name="describe" value="describe"/>
		   			<input type="hidden" name="money" value="${o.totalPrice + o.delivery.deliveryMoney}"/>
				   	<input style="background-color:#a40c59; color:#fff;border:0;width:80px;height:20px;font-size: 14px; cursor: pointer;" type="submit" value="支付"/>
		   		</form>
		   		
		   	</ul>
   		</c:forEach>
   		
   </div>
</div>

<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>
</body>
</html>
