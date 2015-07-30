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
<title>华腾汇金产品中心</title>
<link href="content/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/index2.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/style2.css" rel="stylesheet"
	type="text/css" />
<script src="content/static/js/hthjin/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slides.js" type="text/javascript"></script>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jsAddress.js"></script>
<style>
#nav {
	display: none;
}
</style>
</head>

<body>
	<!---------------------top-------------------------->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!---------------------produta-------------------------->


	<div class="produta">
		<div class="produta_til">
			<p>
				您现在的位置：<a href="javascript:void(0);">首页</a> > <a>个人信息</a>
			</p>
		</div>

		<!---------------------individual-------------------------->
		<script type="text/javascript">
			//定义验证方法
			function checkOldPwd() {
				$.ajaxSettings.async = false;
				var loginName = $("#loginName").val();
				var loginPwd = $("#loginPwd").val();
				var isok;
				$.getJSON("toJsonFmatUtil/checkOldPwd", {
					loginName : loginName,
					pwd : loginPwd
				}, function(json) {
					if (json.appUser == null) {
						$(".indivters_pass ul li:first").children().last()
								.text("原密码不正确");
						isok = false;
					} else {
						$(".indivters_pass ul li:first").children().last()
								.text("");
						isok = true;
					}
				});
				return isok;
			}
			function checkNewPwd() {
				var newPwd = $(".indivters_pass ul li").eq(1).children().next()
						.val();
				if (newPwd != "") {
					$(".indivters_pass ul li").eq(1).children().last().text("");
					return true;
				} else {
					$(".indivters_pass ul li").eq(1).children().last().text(
							"密码不能为空");
					return false;
				}
			}
			function checkRePwd() {
				var newPwd = $(".indivters_pass ul li").eq(1).children().next()
						.val();
				var rePwd = $(".indivters_pass ul li").eq(2).children().next()
						.val();
				if (newPwd == rePwd) {
					$(".indivters_pass ul li").eq(2).children().last().text("");
					return true;
				} else {
					$(".indivters_pass ul li").eq(2).children().last().text(
							"两次密码不一致");
					return false;
				}
			}
			$(function() {
				//绑定失去焦点事件
				$(".indivters_pass ul li:first").children().eq(1).blur(
						checkOldPwd);
				$(".indivters_pass ul li").eq(1).children().eq(1).blur(
						checkNewPwd);
				$(".indivters_pass ul li").eq(2).children().eq(1).blur(
						checkRePwd);
				//提交按钮,所有验证通过方可提交
				$("#myform").submit(function() {
					var flag = true;
					if (!checkOldPwd())
						flag = false;
					if (!checkNewPwd())
						flag = false;
					if (!checkRePwd())
						flag = false;
					return flag;
				});
				//     	       ------------div切换----
				$(".indivterall ul li ").eq(0).children().eq(1).children()
						.first().click(function() {
							$("#underWayform").css("display", "block");
							$("#comOrderForm").css("display", "none");
							$("#updatePwd").css("display", "none");
							$("#userInfo").css("display", "none");
							$("#addAddress").css("display", "none");
						});
				$(".indivterall ul li ").eq(0).children().eq(1).children()
						.eq(1).click(function() {
							$("#underWayform").css("display", "none");
							$("#comOrderForm").css("display", "block");
							$("#updatePwd").css("display", "none");
							$("#userInfo").css("display", "none");
							$("#addAddress").css("display", "none");
						});
				$(".indivterall ul li ").eq(2).children().eq(1).children()
						.first().click(function() {
							$("#underWayform").css("display", "none");
							$("#comOrderForm").css("display", "none");
							$("#updatePwd").css("display", "block");
							$("#userInfo").css("display", "none");
							$("#addAddress").css("display", "none");
						});
				$(".indivterall ul li ").eq(2).children().eq(1).children()
						.eq(1).click(function() {
							$("#underWayform").css("display", "none");
							$("#comOrderForm").css("display", "none");
							$("#updatePwd").css("display", "none");
							$("#userInfo").css("display", "block");
							$("#addAddress").css("display", "none");
						});
				$(".indivterall ul li ").eq(2).children().eq(1).children()
						.eq(2).click(function() {
							$("#underWayform").css("display", "none");
							$("#comOrderForm").css("display", "none");
							$("#updatePwd").css("display", "none");
							$("#userInfo").css("display", "none");
							$("#addAddress").css("display", "block");
						});
				//     	      切换 end
			});
		</script>
		<div class="indiv">
			<div class="left indivter">
				<div class="indivtertil">
					<p class="indivtertil_all">
						<a href="javascript:void(0);">我的账户</a>
					</p>
				</div>
				<div class="indivterall">
					<ul>
						<li class="indivterta"><p>我的订单</p>
							<div class="indivterta_til_onc">
								<a href="javascript:void(0)">正在处理的订单</a> <a
									href="javascript:void(0)">已经完成的订单</a>
							</div></li>
						<li class="link"></li>
						<li class="indivterta"><p class="indivterta_til">个人信息管理</p>
							<div>
								<a href="javascript:void(0)">密码修改</a><a
									href="javascript:void(0)">个人资料</a> <a href="javascript:void(0)">收货地址管理</a>
							</div></li>
					</ul>
				</div>
			</div>
			<!--         --正在处理的订单--- -->
			<div class="right indivters" id="underWayform">
				<div class="indivters_til">
					<ul>
						<li class="indivters_til_onck"><a>正在处理的订单</a></li>
					</ul>
				</div>
				<div class="indivters_search">
					<ul>
						<li>查看当前已下订单及其配送状态</li>
					</ul>
				</div>
				<p class="red">正在处理的订单</p>
				<div class="indivters_all">

					<ul style="background-color: orange;">
						<li><p>订单号</p></li>
						<li class="links"></li>
						<li><p>下单时间</p></li>
						<li class="links"></li>
						<li><p>状态</p></li>
						<li class="links"></li>
						<li><p>商品总数</p></li>
						<li class="links"></li>
						<li><p>订单金额</p></li>
						<li class="links"></li>
						<li><p>支付方式</p></li>
						<li class="links"></li>
						<li><p>收货人</p></li>
					</ul>
					<c:forEach items="${orderForms}" var="orderForm">
						<ul style="background-color: lime;">
							<li><p title="订单号">${orderForm.orderFormID}</p></li>
							<li class="links"></li>
							<li><p title="下单时间">${orderForm.orderDate}</p></li>
							<li class="links"></li>
							<c:if test="${orderForm.orderstatus=='waitPayment'}">
								<li><p title="状态">等待买家付款</p></li>
							</c:if>
							<c:if test="${orderForm.orderstatus=='BuyersHavePaid'}">
								<li><p title="状态">买家已付款</p></li>
							</c:if>
							<c:if test="${orderForm.orderstatus=='waitDelivery'}">
								<li><p title="状态">等待卖家发货</p></li>
							</c:if>
							<c:if test="${orderForm.orderstatus=='transitGoods'}">
								<li><p title="状态">卖家已发货</p></li>
							</c:if>
							<c:if test="${orderForm.orderstatus=='ApplicationForRefund'}">
								<li><p title="状态">退款申请</p></li>
							</c:if>
							<c:if test="${orderForm.orderstatus=='refundOrderForm'}">
								<li><p title="状态">退款中的订单</p></li>
							</c:if>
							<li class="links"></li>
							<c:set var="total" value="${0}"></c:set>
							<c:forEach items="${orderForm.commodities}" var="anum">
								<c:set var="total" value="${total + (anum.quantity)}" />
							</c:forEach>
							<li><p class="morr">${total}</p></li>
							<li class="links"></li>
							<li><p title="订单金额">${orderForm.totalPrice}</p></li>
							<li class="links"></li>
							<li><p title="支付方式">货到付款</p></li>
							<li class="links"></li>
							<li><p title="收货人">${orderForm.delivery.address.toName}</p></li>
						</ul>
						<c:forEach var="commdity" items="${orderForm.commodities }">
							<ul >
								<li><p>商品名称</p></li>
								<li class="links"></li>
								<li><p>${commdity.shopCommodity.commoidtyName}</p></li>
								<li class="links"></li>
								<li><p>单价</p></li>
								<li class="links"></li>
								<li><p class="morr">${commdity.price}</p></li>
								<li class="links"></li>
								<li><p>数量</p></li>
								<li class="links"></li>
								<li><p>${commdity.quantity}</p></li>
								<li class="links"></li>
								<li><p title="总金额">${commdity.money}</p></li>
							</ul>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
			<!--    	  -----完成的订单-- -->
			<div class="right indivters" id="comOrderForm" style="display: none">
				<!--         	<div class="indivters_til"> -->
				<!--             	<ul> -->
				<!--                 	<li class="indivters_til_onck"><a>三个月之内的订单</a></li> -->
				<!--                 	<li><a>三个月之前的订单</a></li> -->
				<!--                 </ul> -->
				<!--             </div> -->
				<div class="indivters_search">
					<ul>
						<li>最近三个月之内的所订购的物品订单</li>
					</ul>
				</div>
				<p class="red">三个月之内的订单</p>
				<div class="indivters_all">

					<ul style="background-color: orange;">
						<li><p>订单号</p></li>
						<li class="links"></li>
						<li><p>下单时间</p></li>
						<li class="links"></li>
						<li><p>状态</p></li>
						<li class="links"></li>
						<li><p>商品总数</p></li>
						<li class="links"></li>
						<li><p>订单金额</p></li>
						<li class="links"></li>
						<li><p>支付方式</p></li>
						<li class="links"></li>
						<li><p>收货人</p></li>
					</ul>
					<c:forEach items="${orderFormList}" var="orderForm1">
						<ul style="background-color: lime;">
							<li><p title="订单号">${orderForm1.orderFormID}</p></li>
							<li class="links"></li>
							<li><p title="下单时间">${orderForm1.orderDate}</p></li>
							<c:if test="${orderForm1.orderstatus=='completionTransaction'}">
								<li class="links"></li>
								<li><p title="状态">交易完成</p></li>
							</c:if>
							<li class="links"></li>
							<c:set var="total" value="${0}"></c:set>
							<c:forEach items="${orderForm1.commodities}" var="anum">
								<c:set var="total" value="${total + (anum.quantity)}" />
							</c:forEach>
							<li><p class="morr">${total}</p></li>
							<li class="links"></li>
							<li><p title="订单金额">${orderForm1.totalPrice}</p></li>
							<li class="links"></li>
							<li><p title="支付方式">货到付款</p></li>
							<li class="links"></li>
							<li><p title="收货人">${orderForm1.delivery.address.toName}</p></li>
						</ul>
						<c:forEach var="commdity" items="${orderForm.commodities }">
							<ul >
								<li><p>商品名称</p></li>
								<li class="links"></li>
								<li><p>${commdity.shopCommodity.commoidtyName}</p></li>
								<li class="links"></li>
								<li><p>单价</p></li>
								<li class="links"></li>
								<li><p class="morr">${commdity.price}</p></li>
								<li class="links"></li>
								<li><p>数量</p></li>
								<li class="links"></li>
								<li><p>${commdity.quantity}</p></li>
								<li class="links"></li>
								<li><p title="总金额">${commdity.money}</p></li>
							</ul>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
			<!--         ---密码修改-----       -->
			<div class="right indivters" id="updatePwd" style="display: none">
				<div class="indivters_til">
					<ul>
						<li class="indivters_til_onck">密码修改</li>
					</ul>
				</div>
				<form action="user/updatePwd" id="myform" method="post">
					<div class="indivters_pass">
						<ul>
							<input type="hidden" value="${user.phone}" id="loginName" />
							<li><span>原密码</span><input name="" type="password"
								id="loginPwd" />
								<div
									style="float: right; margin-right: 100px; margin-top: 5px; color: red"></div></li>
							<li><span>新密码</span><input name="newPwd" type="password" />
								<div
									style="float: right; margin-right: 100px; margin-top: 5px; color: red"></div></li>
							<li><span>新密码重复</span><input name="" type="password" />
								<div
									style="float: right; margin-right: 100px; margin-top: 5px; color: red"></div></li>
							<li><input type="submit"
								style="width: 100px; font-size: 14px; color: #fff; background: red; height: 30px; margin-top: 20px; margin-left: 380px; border: none;" /></li>
						</ul>
					</div>
				</form>
			</div>
			<!--    	  ------个人资料-------    -->
			<div class="right indivters" id="userInfo" style="display: none">
				<div class="indivters_til">
					<ul>
						<li class="indivters_til_onck">个人资料修改</li>
					</ul>
				</div>
				<form action="user/perfectUserInfo" method="post">
					<div class="infoters_pass">
						<ul>
							<li><span>登录名：</span><input name="loginName" type="text"
								readonly="readonly" value="${user.phone}" /></li>
							<li><span>绑定邮箱：</span><input name="email" type="text" /></li>
							<li><span>真实姓名：</span><input name="userName" type="text" /></li>
							<li><span>性别：</span><input id="radio" name="sex"
								type="radio" value="Male" checked="checked" />男<input
								id="radio" name="sex" type="radio" value="Female" /> 女</li>
							<li><span>生日：</span><input name="birthday" type="text" /><span
								class="smell">请查写真实信息</span></li>
							<li><span>身份证：</span><input name="identityId" type="text" /><span
								class="smell">此信息将作为兑奖参考信息，请务必填写真实信息</span></li>
							<li><span>联系地址：</span><input name="address" type="text" /><span
								class="smell">请查写真实信息</span></li>
							<li><input type="submit"
								style="width: 100px; font-size: 14px; color: #fff; background: red; height: 30px; margin-top: 20px; margin-left: 380px; border: none;" /></li>
						</ul>
					</div>
				</form>
			</div>
			<!--    	  ---地址管理---------------- -->
			<div class="right indivters" id="addAddress" style="display: none">
				<div class="indivters_til">
					<ul>
						<li class="indivters_til_onck">收货地址管理</li>
					</ul>
				</div>
				<form action="user/profile" method="post">
					<div class="infoters_pass">
						<ul>
							<li><span>收货人</span><input name="toName" type="text"
								value="${user.shopAddress[0].toName}" /><span class="smell">不能超过12个字符或6个汉字</span></li>
							<li><span>省份</span><select id="cmbProvince"
								name="cmbProvince"></select></li>
							<li><span>城市</span><select id="cmbCity" name="cmbCity"></select></li>
							<li><span>区县</span> <select id="cmbArea" name="cmbArea"></select></li>
							<li><span>详细地址</span> <textarea
									style="width: 300px; height: 20px;" name="street">${user.shopAddress[0].other}</textarea></li>
							<li><span>邮政编码</span><input name="toEmail" type="text"
								value="${user.shopAddress[0].toEmail}" /></li>
							<li><span>手 机：</span><input name="phone" type="text"
								value="${user.shopAddress[0].phone}" />${user.shopAddress[0].province}</li>

							<li><input type="submit"
								style="width: 100px; font-size: 14px; color: #fff; background: red; height: 30px; margin-top: 20px; margin-left: 380px; border: none;" /></li>
						</ul>
					</div>
				</form>
			</div>
			<script type="text/javascript">
				addressInit('cmbProvince', 'cmbCity', 'cmbArea',
						'${user.shopAddress[0].province}',
						'${user.shopAddress[0].city}',
						'${user.shopAddress[0].district}');
			</script>

			<div class="cl"></div>
		</div>
		<div class="cl"></div>
	</div>

	<!---------------------foot-------------------------->
	<jsp:include page="../frontDesk/foot.jsp" />
	<script>
		var div1 = document.getElementById("nav");

		function f1() {
			div1.style.display = "inline";
		}
		function f2() {
			div1.style.display = "none";
		}
	</script>
</body>
</html>
