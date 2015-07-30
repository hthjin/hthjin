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
<title>华腾汇金</title>
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
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<%-- 	<jsp:include page="../frontDesk/cate.jsp" /> --%>
	<div class="produta">
		<div class="produta_til">
			<p>
				<a href="/productCenter/shopIndex">首页</a> > <span>核对订单信息</span>
			</p>
		</div>
	</div>
	<div class="car-tu">
		<div class="process-02"></div>
	</div>
	<div class="shop-car" style="margin-bottom: 100px;">
		<hr />
		<div class="info">
			<div class="box">填写核对订单信息</div>
			<div class="address">
				<div class="add" style="font-size: 20px; margin-top: 20px;">
					<b>收货地址</b>
				</div>
				<div class="shopcartabt2">
					<p class="shcaadds">
						<select name="" id="addressChange">
							<option value="-1" selected="selected">-----选择收件人----</option>
							<c:forEach items="${addresses }" var="address">
								<option value="${address.id }"
									<c:if test="${address.theDefault == true }">selected</c:if>>${address.toName }</option>
							</c:forEach>
						</select> <a href="javascript:void(0);" onclick="down(this,n1)"><font
							color="blue">使用新地址</font></a>
					</p>
					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											var code = $("#addressChange")
													.find("option:selected")
													.val();
											$option = "";
											<c:forEach items="${addresses }" var="address">
											if ('${address.id}' == code) {
												$option = $option
														+ "&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;${address.province}&nbsp;${address.city}&nbsp;</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.other}&nbsp;</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
											}
											</c:forEach>
											$('#addressShow').append($option);
										});
						$("#addressChange")
								.change(
										function() {
											var code = $(this).val();
											$('#addressShow').html("");
											$option = "";
											<c:forEach items="${addresses }" var="address">
											if ('${address.id}' == code) {
												$option = $option
														+ "&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;${address.province}&nbsp;${address.city}&nbsp;</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.other}&nbsp;</font><br><br>";
												$option = $option
														+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
											}
											</c:forEach>
											$('#addressShow').append($option);
										});
					</script>
					<div id="n1" style="display: none;">
						<form action="user/addNewAddress" method="post" id="formSub">
							收件人：&nbsp;&nbsp;&nbsp;<input type="text" id="toName" name="toName" /><br />
							地&nbsp;&nbsp;区：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
								id="cmbProvince" name="cmbProvince"></select> <select
								id="cmbCity" name="cmbCity"></select> <select id="cmbArea"
								name="cmbArea"></select><br /> 详细地址：
							<textarea style="width: 300px; height: 20px;" id="street" name="street"></textarea>
							<br /> 邮政编码：<input type="text" name="toEmail" id="toEmail" /><br /> 手机号码：<input
								type="tel" name="phone" id="phone"/> <br />
							<input name="default" type="radio" />设置为默认地址 <a>
								<div class="submit" onclick="up(this,n1)">确认收货人信息</div>
							</a>
						</form>
					</div>
					</p>
					<script type="text/javascript">
						addressInit('cmbProvince', 'cmbCity', 'cmbArea', '新疆',
								'乌鲁木齐市', '新市区');
					</script>
					<p class="shcaadds" id="addressShow"></p>
					<div class="cl"></div>
					<div class="shcaaddselink"></div>

				</div>
				<div class="xiugai" id="xiu">修改送货信息</div>
			</div>

			<div class="way">
				<div style="font-size: 20px; margin-top: 20px;">
					<b>配送方式</b>
				</div>
				<form>
					<div
						style="border-bottom: 1px #CCCCCC dotted; width: 700px; margin-top: 10px;">送货方式</div>
					<div>
						<input type="radio" style="margin-bottom: 10px;" />快递<br />
					</div>
					<div class="new1"
						style="border-bottom: 1px #CCCCCC dotted; margin-bottom: 10px; color: #f47469; width: 700px;"
						onclick="down(this,n2)">
						<a style="color: red">【点击选择送货时间】</a>
					</div>
					<div id="n2" style="display: none;">
						<input type="radio" name="week" />工作日、双休日与假日均可送货<br /> <input
							type="radio" name="week" />只有双休日、假日送货（工作日不用送货）<br /> <input
							type="radio" name="week" />只有工作日送货（双休日、假日不用送） 写字楼/商用地址客户选择<br />
						<a>
							<div class="submit" onclick="up(this,n2)">确认配送方式</div>
						</a>
					</div>
				</form>
			</div>
			<div class="list">
				<div style="font-size: 20px; margin-top: 20px; float: left;">
					<b>商品清单</b>
				</div>
				<div style="height: auto; width: 900px;">
					<div class="nav-list">
						<ul>
							<li style="margin-left: 80px; margin-right: 100px;">商品名称</li>
							<li>商品单价</li>
							<li>购买数量</li>
							<li>优惠金额</li>
							<li>小计</li>
						</ul>
					</div>
					<c:set var="zhongliang" value="0"></c:set>
					<c:set var="jianshu" value="0"></c:set>
					<c:set var="jine" value="0"></c:set>
					<c:forEach items="${list }" var="carCommodity" varStatus="loop">
						<div class="nav-info">
							<ul>
								<li
									style="float: left; margin-top: 10px; width: 200px; height: auto;"><img
									src="../${carCommodity.shopCommodity.shopCommImages[0].imagePath }"
									style="float: left; margin-top: 10px; width: 75px; height: 75px;" />
									<div style="float: left; margin-top: 41px;">
										${carCommodity.shopCommodity.commoidtyName }</div></li>
								<li>￥<fmt:formatNumber
										value="${carCommodity.shopCommodity.unitPrice }"
										pattern="##.##" minFractionDigits="2"></fmt:formatNumber></li>
								<li>
									<div>${carCommodity.amount }</div>
								</li>
								<li>￥<fmt:formatNumber value="${carCommodity.unitPrice }"
										pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
								</li>
								<li id="displayPrice${loop.index }">￥<fmt:formatNumber
										value="${carCommodity.price }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
								</li>
								<c:set var="zhongliang"
									value="${zhongliang + carCommodity.shopCommodity.probablyWeight * carCommodity.amount}"></c:set>
								<c:set var="jine" value="${jine + carCommodity.price}"></c:set>
								<c:set var="jianshu" value="${jianshu + carCommodity.amount}"></c:set>
							</ul>
						</div>
					</c:forEach>
				</div>
				<script type="text/javascript">
					function goBlack() {
						window.location.href = document.referrer;
					}
				</script>

				<div class="last"
					style="width: 100%; height: auto; margin-top: 20px;">
					<div class="last_top"
						style="width: 100%; height: 30px; border-bottom: 1px #ccc dashed;">
						<div class="tatle"
							style="float: right; line-height: 35px; margin-right: 15px; margin-top: 20px;">
							<span></span> <span class="ap1"
								style="color: #A40C59; margin-right: 10px;"></span> <span></span><span
								class="ap1" style="color: #A40C59; margin-right: 10px;"></span>
							<span></span><span class="ap1"
								style="color: #A40C59; margin-right: 10px;"> </span> <span>商品金额总计：</span><span
								class="ap1" style="color: #A40C59; margin-right: 10px;">
								￥<fmt:formatNumber value="${jine}" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber>
							</span>
						</div>
					</div>
					<div class="last_top2"
						style="width: 100%; height: 30px; margin-top: 15px;">
						<div class="tatle2"
							style="float: right; line-height: 35px; margin-right: -220px; margin-top: 20px; margin-left: 48%;">
							<span style="margin-right: 35px;">运费：</span> <span class="ap1"
								style="color: #A40C59; margin-right: 10px;">
								<c:set value="0" var="yunfei"></c:set>
								<c:if test="${wuliu.wuLiuType == 'zhongliang' }">
									<c:if test="${zhongliang-wuliu.geshu >=0 }">
										￥<fmt:formatNumber value="${wuliu.geshu*wuliu.firstPrice+(zhongliang-wuliu.geshu)/wuliu.houshu*wuliu.houPrice  }" pattern="##.##"
										minFractionDigits="2" ></fmt:formatNumber>
										<c:set value="${wuliu.geshu*wuliu.firstPrice+((zhongliang-wuliu.geshu)/wuliu.houshu)*wuliu.houPrice  }" var="yunfei"></c:set>
									</c:if>
									<c:if test="${zhongliang-wuliu.geshu < 0 }">
										￥<fmt:formatNumber value="${wuliu.geshu*wuliu.firstPrice }" pattern="##.##"
										minFractionDigits="2"></fmt:formatNumber>
										<c:set value="${wuliu.geshu*wuliu.firstPrice}" var="yunfei"></c:set>
									</c:if>
								</c:if>
								<c:if test="${wuliu.wuLiuType == 'jianshu' }">
 									<c:if test="${jianshu-wuliu.geshu >=0 }">
 									￥<fmt:formatNumber value="${wuliu.geshu*wuliu.firstPrice+((jianshu-wuliu.geshu)/wuliu.houshu)*wuliu.houPrice  }" pattern="##.##" 
										minFractionDigits="2"></fmt:formatNumber>
										<c:set value="${wuliu.geshu*wuliu.firstPrice+((jianshu-wuliu.geshu)/wuliu.houshu)*wuliu.houPrice  }" var="yunfei"></c:set>
									</c:if>
									<c:if test="${jianshu-wuliu.geshu < 0 }">
									￥<fmt:formatNumber value="${wuliu.geshu*wuliu.firstPrice }" pattern="##.##"
 										minFractionDigits="2"></fmt:formatNumber>
 										<c:set value="${wuliu.geshu*wuliu.firstPrice }" var="yunfei"></c:set>
 									</c:if>
								</c:if>
							</span>
						</div>
					</div>
					<div class="last_top2"
						style="width: 100%; height: 30px; margin-top: 15px;">
						<div class="tatle2"
							style="float: right; line-height: 35px; margin-left: 45%;">
							<span>您共需支付：</span> <span class="ap1">￥<fmt:formatNumber
									value="${yunfei + jine}" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber></span>
						</div>
					</div>
					<div class="last_top3"
						style="width: 100%; height: 50px; margin-top: 50px;">
						<div class="btn" onclick="orderGenerate();"
								style="float: right; width: 80px; height: 30px; text-align: center; line-height: 30px; background-color: #a40c59; color: #fff; border-radius: 3px; margin-right: 15px; cursor: pointer;">提交订单</div>
						<div class="tatle3" style="float: right; line-height: 35px;">
							<span>应付金额：</span> <span class="ap1">￥<fmt:formatNumber
									value="${yunfei + jine}" pattern="##.##"
									minFractionDigits="2"></fmt:formatNumber></span>
						</div>
					</div>
				</div>
				<form action="user/orderGenerate" method="post"
					id="orderGenerateForm">
					<input name="shouhuoTime" type="hidden" value="工作日、双休日与节假日均可送货" />
					<input name="xunshufangshi" type="hidden" value="ems" /> <input
						name="ids" type="hidden" value="${vars }" /> <input name="yunfei"
						type="hidden" value="${yunfei }" /> <input name="mudidi"
						id="mudidi" type="hidden" value="" />
				</form>

			</div>
		</div>
	</div>
	<div class="cl"></div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
	<script type="text/javascript">
		function orderGenerate() {
			$('#mudidi').val($('#addressChange').val());
			$('#orderGenerateForm').submit();
		}
		window.onload = function() {
			var btn1 = document.getElementById("btn1");
			var btn2 = document.getElementById("btn2");
			var btn3 = document.getElementById("btn3");
			var b1 = document.getElementById("b1");
			var b2 = document.getElementById("b2");
			var b3 = document.getElementById("b3");
			var add = document.getElementById("address");
			var add1 = document.getElementById("newaddress");
			var xiu = document.getElementById("xiu");
			var newadd = document.getElementById("new");
			var guanbi = document.getElementById("guanbi");
			btn1.onclick = function() {
				btn1.style.backgroundColor = "#a40c59";
				btn2.style.backgroundColor = "#ccc";
				btn3.style.backgroundColor = "#ccc";
				btn1.style.color = "#fff";
				btn2.style.color = "#000";
				btn3.style.color = "#000";
				b1.style.display = "inline";
				b2.style.display = "none";
				b3.style.display = "none";
			}
			btn2.onclick = function() {
				btn2.style.backgroundColor = "#a40c59";
				btn1.style.backgroundColor = "#ccc";
				btn3.style.backgroundColor = "#ccc";

				btn2.style.color = "#fff";
				btn1.style.color = "#000";
				btn3.style.color = "#000";
				b2.style.display = "inline";
				b1.style.display = "none";
				b3.style.display = "none";
			}
			btn3.onclick = function() {
				btn3.style.backgroundColor = "#a40c59";
				btn2.style.backgroundColor = "#ccc";
				btn1.style.backgroundColor = "#ccc";

				btn3.style.color = "#fff";
				btn2.style.color = "#000";
				btn1.style.color = "#000";
				b3.style.display = "inline";
				b2.style.display = "none";
				b1.style.display = "none";
			}
			xiu.onclick = function() {
				add.style.display = "none";
				add1.style.display = "block";
			}
			guanbi.onclick = newadd.onclick = function() {
				add1.style.display = "none";
				add.style.display = "block";
			}
			<!--退出登录-->
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
			<!--送货方式-->

			var li1 = document.getElementById("li1");
			var li2 = document.getElementById("li2");
			var li3 = document.getElementById("li3");
			var border = document.getElementById("border");
			li1.onclick = function() {

				li1.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li2.style.boxShadow = "none";
				li3.style.boxShadow = "none";
			}
			li2.onclick = function() {
				li2.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li1.style.boxShadow = "none";
				li3.style.boxShadow = "none";
			}
			li3.onclick = function() {
				li3.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
				li2.style.boxShadow = "none";
				li1.style.boxShadow = "none";
			}
			border.onclick = function() {
				border.style.boxShadow = "1px 1px 2px #a40c59, inset 1px 1px 2px #a40c59";
			}

		}
	</script>
	<script>
		function down(div3, div4) {
			div4.style.display = "inline";
			if (div4 == document.getElementById("n1")) {
				$('#addressShow').hide();
			}
		}
	</script>
	<script>
		function up(div3, div4) {
			if(div4 == document.getElementById("n1") ){
				$(document).ready(function(){
					jQuery.ajax({
						cache: true,
						type : 'POST',
						url : 'toJsonFmatUtil/addNewAddress',
						data : $('#formSub').serialize(),
						success : function(data) {
							if(data.success == 'true'){
								var citySelect = document.getElementById('addressChange');
								var num = citySelect.options.length;
								for (i = num - 1; i >= 0; i--) {
									citySelect.remove(i);
								}
								var objOption = new Option("----选择收件人----", -1);
								citySelect.options[citySelect.options.length] = objOption;
								$.each(data.addresses,function(i, address) {
									var objOption = new Option(address.toName, address.id,address.theDefault,true);
									citySelect.options[citySelect.options.length] = objOption;
								});
							}
						}
					});
			});
			div4.style.display = "none";
			$("#addressChange")
			.change(
					function() {
						var code = $(this).val();
						$('#addressShow').html("");
						$option = "";
						<c:forEach items="${addresses }" var="address">
						if ('${address.id}' == code) {
							$option = $option
									+ "&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
							$option = $option
									+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;${address.province}&nbsp;${address.city}&nbsp;</font><br><br>";
							$option = $option
									+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.other}&nbsp;</font><br><br>";
							$option = $option
									+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
						}
						</c:forEach>
						$('#addressShow').append($option);
					});
		}
	}
	</script>
</body>
</html>