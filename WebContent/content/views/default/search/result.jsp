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
<link href="content/static/css/style.css" rel="stylesheet"
	type="text/css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slide.js" type="text/javascript"></script>
<script type="text/javascript"
	src="content/static/js/hthjin/index_v20.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#jg").click(function() {
			$("#jiage").slideToggle("slow");
		});
		$("#jg1").click(function() {
			$("#jiage1").slideToggle("slow");
		});
	});
</script>
 <script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "商品筛选页面"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
        				   if(item.adverDistribution.position=='商品筛选页面大眼睛'){
                          	    $("#Adv_1").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"1200\" height=\"230\"/></a>");
        				   }
        		   });
         });
         });
</script>
<style>
#nav {
	display: none;
}
</style>
<script type="text/javascript">
     
</script>
</head>
<body>
	<!--顶部内容-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!--品牌详情-->
	<div class="produtclass">

		<div class="right proclas">
			<div class="proclas_top" id="Adv_1">
			</div>
			<div class="proclas_all">
				<div class="proclist_til">
					<ul>
						<li>
							<p class="proclist_til_h3">价格：</p>
							<div class="proclist_til_list proclist_none">
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="0-89" onclick="searchs('0@99','money');">0-99</a> <a
									href="javascript:void(0);" rel="nofollow" class="black"
									title="90-199" onclick="searchs('100@199','money');">100-199</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="200-299" onclick="searchs('200@299','money');">200-299</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="300-399" onclick="searchs('300@399','money');">300-399</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="400-499" onclick="searchs('400@499','money');">400-499</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="500-599" onclick="searchs('500@599','money');">500-599</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="600-699" onclick="searchs('600@699','money');">600-699</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="600-699" onclick="searchs('700@799','money');">700-799</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="600-699" onclick="searchs('800@999','money');">800-999</a>
								<a href="javascript:void(0);" rel="nofollow" class="black"
									title="700以上" onclick="searchs('1000@%','money');">1000以上</a>
							</div> <a class="proclist_til_onc">展开▼</a>
						</li>
						<li class="cl"></li>
						<li>
							<p class="proclist_til_h3">品牌：</p>
							<div class="proclist_til_list proclist_none">
								<c:forEach items="${brands }" var="brand" varStatus="loop">
									<input name="searchBrand" type="radio"
										value="${brand.brandID }"
										onclick="searchs('${brand.brandID }','brand');">${brand.brandName }</input>
								</c:forEach>
							</div> <a class="proclist_til_onc">展开▼</a>
						</li>
						<li class="link cl"></li>
						<c:forEach items="${specifications }" var="spec" varStatus="loop">
							<c:set value="${fn:split(spec.attribute, ',') }" var="attrs"></c:set>
							<c:choose>
								<c:when test="${spec.specificatName == '颜色' }">
									<c:if test="${loop.index == 0}">
										<li>
											<p class="proclist_til_h3">${spec.specificatName }：</p>
											<div class="proclist_til_list proclist_none">
									</c:if>
									<c:if test="${loop.index > 0 }">
										<li>
											<p class="proclist_til_h3">${spec.specificatName }：</p>
											<div class="proclist_til_list proclist_none">
									</c:if>
									<c:forEach items="${attrs }" var="attr">
										<c:choose>
											<c:when test="${attr == '黑色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="黑色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #000;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '灰色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="灰色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #999;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '白色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="白色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #fff;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '粉色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="粉色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #fdd;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '红色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="红色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #f00;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '玫红色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="玫红色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #f08;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '紫色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="紫色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #a2e;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '蓝色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="蓝色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #18f;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '绿色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="绿色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #0b2;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '橙色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="橙色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #f80;"></span><b></b></a>
											</c:when>
											<c:when test="${attr == '驼色'}">
												<a href="javascript:void(0);" rel="nofollow" class="black"
													title="驼色"><span
													onclick="searchs('${attr}','${spec.specificatName }');"
													style="background-color: #b97;"></span><b></b></a>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<li>
										<p class="proclist_til_h3">${spec.specificatName }：</p>
										<div class="proclist_til_list proclist_none">
											<c:forEach items="${attrs }" var="attr">
												<a href="javascript:void(0);"
													onclick="searchs('${attr}','${spec.specificatName }');"
													class="black" title="${attr }">${attr }</a>
											</c:forEach>
								</c:otherwise>
							</c:choose>
							</li>
							<li class="cl"></li>
						</c:forEach>
					</ul>
				</div>
				<form action="search/result" id="paramForm" method="get">
					<input id="params" name="params" type="hidden" value="${params }" />
					<input id="orderByPice" name="orderByPice" type="hidden"
						value="${orderByPice }" /> <input id="haoping" name="haoping"
						type="hidden" value="${haoping }" /> <input id="id" name="id"
						type="hidden" value="${id }" /> <input id="cateid" name="cateid"
						type="hidden" value="${cateid }" /> <input id="page" name="page"
						type="hidden" value="${page }" />
				</form>
				<script type="text/javascript">
					function cate2Click(id) {
						$('#id').val(id);
						$('#paramForm').submit();
					}
					function searchMoney() {
						var isok = false;
						var str = "";
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var money = $('#money1').val() + "@"
								+ $('#money2').val();
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'money') {
								guize[i] = "money-" + money;
								str = str + "," + guize[i];
								isok = true;
							} else {
								str = str + "," + guize[i];
							}
						}
						if (!isok) {
							str = str + ",money-" + money;
						}
						if (guize.length == 1) {
							$('#params').val(",money-" + money);
						} else {
							$('#params').val(str);
						}
						$('#paramForm').submit();
					}
					function searchs(obj, name) {
						var isok = false;
						var str = "";
						var check = "";
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == name) {
								guize[i] = name + "-" + obj;
								str = str + "," + guize[i];
								isok = true;
							} else {
								str = str + "," + guize[i];
							}
						}
						if (!isok) {
							str = str + "," + name + "-" + obj;
						}
						if (guize.length == 1) {
							$('#params').val("," + name + "-" + obj);
						} else {
							$('#params').val(str + check);
						}
						$('#paramForm').submit();
					}

					$(document).ready(function() {
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var ze = "";
						var ze2 = "";
						for (var i = 0; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'brand') {
								ze = ze + "," + guize[i].split('-')[1];
							}
							if (guize[i].split('-')[0] == 'famousid') {
								ze2 = ze2 + "," + guize[i].split('-')[1];
							}
						}
						var zes2 = ze2.split(',');
						var zes = ze.split(',');
						$("input[name='searchFamous']").each(function() {
							for (var j = 0; j < zes2.length; j++) {
								if ($(this).val() == zes2[j]) {
									$(this).attr('checked', true);
								}
							}
						});

						$("input[name='searchBrand']").each(function() {
							for (var j = 0; j < zes.length; j++) {
								if ($(this).val() == zes[j]) {
									$(this).attr('checked', true);
								}
							}
						});
					});
					$(document)
							.ready(
									function(e) {
										var navLi = $("#navhd ul li"), navUl = $("#navhd ul"), speed = 0;
										function OnClick() {
											n = navUl.find("li.on").index();
											navUl
													.stop()
													.animate(
															{
																backgroundPositionX : navLi
																		.width()
																		* n
																		+ 57
															}, speed);
										}
										OnClick();
										navLi
												.hover(
														function() {
															n = $(this).index();
															navUl
																	.stop()
																	.animate(
																			{
																				backgroundPosition : navLi
																						.width()
																						* n
																						+ 57,
																				backgroundPositionY : 0
																			},
																			speed);
														}, function() {
															OnClick();
														})
										navLi.click(function() {
											$(this).addClass("on").siblings()
													.removeClass("on")
										});
										$(window)
												.scroll(
														function() {
															if ($(window)
																	.scrollTop() > $(
																	"#nav")
																	.height() + 50) {
																$("#nav")
																		.addClass(
																				"scoll_nav")
															} else {
																$("#nav")
																		.removeClass(
																				"scoll_nav")
															}
														});
									});
					$(document).ready(
							function() {

								$(".slider li").click(
										function() {
											$(this).addClass("current")
													.siblings().removeClass(
															"current");
											var onclkj = $(this).parents("h")
													.siblings("a").find("img");
											$(onclkj).attr(
													'src',
													$(this).find("img").attr(
															"src"));
										});

							});
					function buyCat(commID) {
						var buyAmount = $('#qty0').val();
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : 'toJsonFmatUtil/addBuyCar?shopCommId='
									+ commID + '&buyAmount=' + buyAmount,
							dataType : 'json',
							success : function(data) {
								if (data.message == 'success') {
									alert("添加成功");
								} else if (data.message == 'existed') {
									alert("再次添加成功");
								} else if (data.message == "nouser") {
									if (confirm('您还没有登录哦！')) {
										var url = "user/login";
										window.location = url;
									}
								}
							}
						});
					}
				</script>
				<div class="proclist_scr">
					<div class="fy_maintabletop3">
						<div class="orderby">
							<label class="fy_tb3 pricenum_sel "><a order="6"
								name="clickFilterOrder" hidefocus="true">价格</a></label> <label
								class="fy_tb3 salenum selected"><a order="1"
								name="clickFilterOrder" hidefocus="true">销量</a></label>
						</div>
						<div class="pagin pagin-m right" style="margin-right: 20px;">
							<div class="prev-disabled2 left"></div>
							<span class="text"><label style="color: red;">1</label>/36</span>
							<a class="next2" pageno="2" name="filterNextPage"
								hidefocus="true"></a>
						</div>
					</div>
				</div>
				<div class="proclist_all">
					<ul>
						<c:forEach items="${list }" var="commShop">
							<li><a
								href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p
										class="proclist_all_img">
										<img src="${commShop.shopCommImages[0].imagePath }" />
									</p></a> <a
								href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p
										class="proclist_all_img">
									<p>${commShop.commoidtyName }</p></a> <a
								href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p
										class="red">
										￥
										<c:if test="${!commShop.isSpecial }">
											<fmt:formatNumber value="${commShop.unitPrice}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if>
										<c:if test="${commShop.isSpecial }">
											<fmt:formatNumber
												value="${commShop.unitPrice * commShop.special}"
												pattern="##.##" minFractionDigits="2">
											</fmt:formatNumber>
										</c:if>
										/￥${commShop.unitPrice}
									</p></a>
								<div class="libgc">
									<div class="left ml6mr6">
										<input class="icon-cut" type="button"> <input
											id="qty0" type="text" _minsaleqty="1" value="1" isfcl="0"
											name="input_catalog_qtc"> <input class="icon-add"
												type="button">
									</div>
									<div class="fy-price-icon1 ">
										<a name="addToCart" hidefocus="true"
											onclick="buyCat('${commShop.commCode }');"> <img
											border="0" src="content/static/images/btn_buy.jpg"
											style="display: inline;"></a>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</div>
				<div class="cl"></div>
				<div class="pages">
					<p>
						<a href="#" class="page_nopa">上一页</a> <a href="#"
							class="page_onck">6</a> <a href="#">5</a> <a href="#">4</a> <a
							href="#">3</a> <a href="#">2</a> <a href="#">1</a> <a href="#">下一页</a>
						共36页 到第<input name="" type="text" />页 <input style="width: 50px;"
							name="" type="button" value="跳转" />
					</p>
				</div>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!-- 滚动广告end -->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>