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
<title>不倒翁</title>
<link href="content/static/css/style2.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/index2.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<SCRIPT src="content/static/js/hthjin/slides.js" type=text/javascript></SCRIPT>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>
<script>
	window.onload = function() {
		var fen = document.getElementById("fen");
		var fen_class = document.getElementById("fen_class");
		var timer = null;
		fen_class.onmouseover = fen.onmouseover = function() {
			clearTimeout(timer);
			fen_class.style.display = "block";
		};
		fen_class.onmouseout = fen.onmouseout = function() {
			timer = setTimeout(function() {
				fen_class.style.display = "none";
			}, 500);
		};
	}
</script>

<script>
	$(function() {
		var i = 0;
		var offset = $("#end").offset();
		$(".addcar")
				.click(
						function(event) {
							var addcar = $(this);
							var img = addcar.parent().find('img').attr('src');
							if (i % 2 == 0) {
								var flyer = $('<img class="u-flyer" src="'+img+'">');
							} else if (i % 2 != 0) {
								var flyer = $('<img class="u-flyer" style=" display:none;" src="'+img+'">');
							}
							flyer.fly({
								start : {
									left : event.pageX,
									top : event.pageY
								},
								end : {
									left : offset.left + 200,
									top : offset.top - 140,
									width : 50,
									height : 50
								},
								onEnd : function() {
									if (i % 2 == 0) {
										i++;
										djsc();
									} else if (i % 2 != 0) {
										i = 0;
										flyer.css("display", "none");
										qxsc();
									}
									this.destory();
								}
							});
						});

	});
	function djsc() {
		$("#msg").animate({
			width : '250px',
			fontSize : '20px',
			color : '#fff'
		}, 300).fadeOut(2000, function() {
			$("#msg").css("display", "block");
			document.getElementById("enda").style.display = "none";
			$("#msg").css("width", "100px");
		});
		document.getElementById("enda").style.display = "block";
		document.getElementById("enda").style.marginLeft = "15px";
		addcar.css("cursor", "default").removeClass('orange').unbind('click');
	}
	function qxsc() {

		$("#msg").animate({
			width : '250px',
			fontSize : '20px',
			color : '#fff'
		}, 300).fadeOut(2000, function() {

			$("#msg").css("display", "block");
			document.getElementById("endb").style.display = "none";
			$("#msg").css("width", "100px");

		});
		document.getElementById("endb").style.display = "block";
		document.getElementById("endb").style.marginLeft = "15px";
	}
</script>
</head>
<body>
	<!--回到顶部-->
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--面包屑-->
	<div class="produta">
		<div class="produta_til">
			<p>
				您现在的位置：<a href="shop.html">首页</a> > <a>${shopCommoidty.shopCategory.category }</a>
			</p>
		</div>
		<div class="produta_info">
			<script type="text/javascript">
				$(document)
						.ready(
								function() {
									var strs = '${nvabar}';
									var str = strs.split("|");
									var $guige = "";
									for (var j = 0; j < str.length; j++) {
										if (j == 0) {
											$guige = $guige
													+ "> <p> 您现在的位置：<a href='search/result?cateid="
													+ str[j].split("-")[0]
													+ "'>"
													+ str[j].split("-")[1]
													+ "</a> ";
										} else if (j == 1) {
											$guige = $guige
													+ "> <a href='javascript:void(0);'>"
													+ str[j].split("-")[1]
													+ "</a> ";
										} else {
											$guige = $guige
													+ "> <a href='search/result?id="
													+ str[j].split("-")[0]
													+ "'>"
													+ str[j].split("-")[1]
													+ "</a> ";
										}
									}
									$('#produta_til').append($guige);
								});
			</script>
			<!--商品详情-->
			<div class="zoombox">
				<div class="zoompic">
					<img width="400" height="400"
						src="${shopCommoidty.shopCommImages[0].imagePath }"
						rel="${shopCommoidty.shopCommImages[0].imagePath }" class="jqzoom" />
				</div>
				<div class="sliderbox">
					<div id="btn-left" class="arrow-btn dasabled"></div>
					<div class="slider" id="thumbnail">
						<ul>
							<c:forEach items="${shopCommoidty.shopCommImages }"
								var="imageCommo" varStatus="loop">
								<c:if test="${loop.index == 0 }">
									<li class="current">
								</c:if>
								<c:if test="${loop.index != 0 }">
									<li>
								</c:if>
								<div class="tb-pic tb-s40">
									<a href="${imageCommo.imagePath }" target="_blank"> <img
										src="${imageCommo.imagePath }" width="48" height="48" /></a>
								</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="btn-right" class="arrow-btn"></div>
				</div>
			</div>
			<!--商品购买-->
			<div class="produta_info_all">
				<ul>
					<li><h1>${shopCommoidty.commoidtyName }</h1></li>
					<input id="commID" type="hidden" value="${shopCommoidty.commCode }" />
					<li><p>
							<span class="proinfo_til">原价</span><span>¥${shopCommoidty.unitPrice }</span>
						</p></li>
					<li class="produta_info_red"><p>
							<span class="proinfo_til">现价:</span><span> ¥ <c:if
									test="${shopCommoidty.isSpecial }">
									<fmt:formatNumber
										value="${shopCommoidty.unitPrice * shopCommoidty.special  }"
										pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
								</c:if> <c:if test="${!shopCommoidty.isSpecial }">
									<fmt:formatNumber value="${shopCommoidty.unitPrice }"
										pattern="##.##" minFractionDigits="2">
									</fmt:formatNumber>
								</c:if></span>
						</p></li>
					<li class="produta_info_red"><p>
							<span class="proinfo_til" style="margin-top: 10px;">我 要 买：</span>
							<div class="libgc ml6mr6">
								<input class="icon-cut" type="button" /> <input id="qty0"
									type="text" _minsaleqty="1" value="1" isfcl="0"
									name="input_catalog_qtc" /> <input class="icon-add"
									type="button" />
								<button
									style="border: none; background-color: #F47469; color: #fff; padding: 3px 10px; border-radius: 3px; margin-left: 10px;"
									onclick="buyCommodity();">立即购买</button>
							</div>
							<a class="shop_car1" onclick="buyCat();"></a>
						</p></li>
					<li><script type="text/javascript">
						bShareOpt = {
							uuid : "",
							url : "", //商品的永久链接
							summary : "", //商品描述
							pic : "", //商品图片链接
							vUid : "", //用户id，为了让您能够知道您网站的注册用户分享、喜欢了哪些商品
							product : "", //商品名称
							price : "0", //商品价格
							brand : "", //商品品牌
							tag : "", //商品标签
							category : "", //商品分类
							template : "1"
						};
					</script> <a class="bsLikeDiv" href="http://static.bshare.cn"></a> <script
							type="text/javascript" charset="utf-8"
							src="http://static.bshare.cn/b/bshareLike.js#amp;showShareCount=false"></script>
						<div class="bshare-custom icon" style="float: left;">
							<a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博"
								class="bshare-sinaminiblog"></a><a title="分享到人人网"
								class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a
								title="分享到搜狐微博" class="bshare-sohuminiblog"></a>
						</div> <script type="text/javascript" charset="utf-8"
							src="http://static.bshare.cn/b/button.js#style=-1&amp;ssc=false&amp;mdiv=-1&amp;type=15"></script>
						<script type="text/javascript" charset="utf-8"
							src="http://static.bshare.cn/b/bshareC1.js"></script></li>
				</ul>
			</div>
		</div>

		<script type="text/javascript">
			function buyCommodity() {
				var commID = $('#commID').val();
				var buyAmount = $('#qty0').val();
				location.href = 'user/buyCommodity?shopCommId=' + commID
						+ '&buyAmount=' + buyAmount;
			}
			function buyCat() {
				var commID = $('#commID').val();
				var buyAmount = $('#qty0').val();
				jQuery.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : 'toJsonFmatUtil/addBuyCar?shopCommId=' + commID
							+ '&buyAmount=' + buyAmount,
					dataType : 'json',
					success : function(data) {
						if (data.message == 'success') {
							alert("添加成功");
							jQuery.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : 'toJsonFmatUtil/getBuyCatNum',
								dataType : 'json',
								success : function(data) {
									if (data.success == 'true') {
										if (data.buyCar != '') {
											$('#buyCatNum').html(
													"购物车(" + data.num + ")");
											alert(data.buyCar.carCommodities);
											//						 						$.each(data.buyCars,function(i, buyCar) {

											//						 						});
										}
										$('#buyCatNum').html(
												"购物车(" + data.num + ")");
									}
								}
							});
						} else if (data.message == 'existed') {
							alert("再次添加成功");
							jQuery.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : 'toJsonFmatUtil/getBuyCatNum',
								dataType : 'json',
								success : function(data) {
									if (data.success == 'true') {
										if (data.buyCar != '') {
											$('#buyCatNum').html(
													"购物车(" + data.num + ")");
											alert(data.buyCar.carCommodities);
											//						 						$.each(data.buyCars,function(i, buyCar) {

											//						 						});
										}
										$('#buyCatNum').html(
												"购物车(" + data.num + ")");
									}
								}
							});
						} else if (data.message == "nouser") {
							if (confirm('您还没有登录哦！')) {
								var url = "user/regist";
								window.location = url;
							}
						}
					}
				});
			}
		</script>

		<!--商品参数详情-->
		<div class="produta_deta">
			<ul class="produta_deta_til">
				<li class="produtadtt_omc">商品详情</li>
			</ul>
			<div class="produta_deta_all">
				<div class="guige">
					<span>商品信息：<a href="javascript:void(0);">${shopCommoidty.brand.brandName }</a></span>
					<ul>
						<c:forEach items="${map }" var="keySet">
							<c:if test="${keySet.key == '颜色' }">
								<div class="choice_color">
									颜色：
									<c:forEach items="${keySet.value }" var="spec">
										<c:set var="index1" value="${fn:indexOf(spec, '$') }"></c:set>
										<c:set var="index2" value="${fn:length(spec) }"></c:set>
										<li><img src="${fn:substring(spec, index1+1, index2)}" /></span>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${keySet.key != '颜色' }">
								<div class="choice_cm">
									<c:forEach items="${keySet.value }" var="spec">
										<li>${keySet.key }：${spec }</li>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
						<li>重量： ${shopCommoidty.probablyWeight }</li>
						<li>年份：${shopCommoidty.commAttribute.particularYear}年</li>
						<li>保质期：${shopCommoidty.commAttribute.deadline}</li>
						<li>产地：${shopCommoidty.commAttribute.productPlace}</li>
						<li>省份：${shopCommoidty.commAttribute.productProvince}</li>
						<li>包装：${shopCommoidty.commAttribute.packManner}</li>
						<li>生产许可编号：${shopCommoidty.commAttribute.productPerimitNum}</li>
						<li>生产标准号：${shopCommoidty.commAttribute.productStddNum}</li>
						<li>生产厂名：${shopCommoidty.commAttribute.productFactoryName}</li>
						<li>生产工厂地址：${shopCommoidty.commAttribute.productFactoryAddress}</li>
						<li>生产时期：${shopCommoidty.commAttribute.productTime}</li>
					</ul>
				</div>

				<div class="shop_banner">
					<img src="content/static/img/shop/1.jpg" /> <img
						src="content/static/img/shop/2.jpg" />
				</div>
				<div class="description"></div>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!--评价-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>