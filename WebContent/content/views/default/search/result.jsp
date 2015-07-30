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
<title>华腾汇金</title>
<link href="content/static/css/style2.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/index2.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/main.css" rel="stylesheet"
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
	$(function() {
		$
				.getJSON(
						"toJsonFmatUtil/getAdvertisement",
						{
							whichPage : "商品筛选页面"
						},
						function(json) {
							$
									.each(
											json.advertisementList,
											function(i, item) {
												if (item.adverDistribution.position == '商品筛选页面大眼睛') {
													$("#Adv_1")
															.append(
																	"<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"1200\" height=\"230\"/></a>");
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
				<a href="productCenter/shopIndex">首页</a>
			</div>
			<script type="text/javascript">
			$(document)
					.ready(
							function() {
								var strs = '${nvabar}';
								var str = strs.split("|");
								var $guige = "";
								var $guige1 = "";
								var language = $("#language").val();
								var special = "";
								if ( language == 'chinese') {
									special = "折扣";
								} else if ( language == 'russina') {
									special = "我是俄文折扣";
								}
								var brand = "";
								if ( language == 'chinese') {
									brand = "名品街";
								} else if ( language == 'russina') {
									brand = "我是俄文名品街";
								}
								for (var j = 0; j < str.length; j++) {
									if (j == 0) {
										
										if('${page}'=='brand'){
											$guige = $guige
											+ "> <a href='..proscenium/categoryLei?id=-1&page=brand'>"
											+ brand
											+ "</a> ";
										}else if('${page}'=='special'){
											$guige = $guige
											+ "> <a href='..proscenium/categoryLei?id=-1&page=special'>"
											+ special
											+ "</a> ";
										}else{
											$guige = $guige
											+ "> <a href='search/cateComm?cateid="
											+ str[j].split("-")[0] + "'>"
											+ str[j].split("-")[1]
											+ "</a> ";
										}
									} else {
										$guige = $guige + "> <a href='search/result?id="
												+ str[j].split("-")[0] + "'>"
												+ str[j].split("-")[1]
												+ "</a> ";
									}
									if (j == str.length - 1) {
										$guige1 = ""
												+ str[j].split("-")[1]
												+ "</a> <div class='clear'></div>";
									}
								}
								
								if ( '${page}'=='search') {
									if ( language == 'chinese') {
										$('#Adv_1').append("搜索结果");
									} else if ( language == 'russina') {
										$('#Adv_1').append("我是俄文搜索结果");
									}
									
								} else {
									$('#Adv_1').append($guige);
								}
							});
		</script>
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
					function buyCat(commID,index) {
						var buyAmount = $('#qty'+index).val();
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
							<ul>
								<li style="cursor: pointer;"><a><span id="jg1" class="fy_tb3 pricenum_sel">销量</span></a>
									<div class="jiage" id="jiage1">
										<a href="javascript:void(0);"
											onclick="onClickOrderBy('orderByXiao','DESC');"><span>销量从高到低</span></a><br />
										<a href="javascript:void(0);"
											onclick="onClickOrderBy('orderByXiao','ASC');"><span>销量从低到高</span></a>
									</div>
								</li>
								<li style="cursor: pointer;"><a><span id="jg" class="fy_tb3 salenum selected">价格</span></a>
									<div class="jiage" id="jiage">
										<a href="javascript:void(0);"
											onclick="onClickOrderBy('orderByPice','DESC');"><span>价格从高到低</span></a><br />
										<a href="javascript:void(0);"
											onclick="onClickOrderBy('orderByPice','ASC');"><span>价格从低到高</span></a>
									</div>
								</li>
							</ul>
						</div>
						<div class="pagin pagin-m right" style="margin-right: 20px;">
							<div class="prev-disabled2 left"></div>
							<span class="text"><label style="color: red;">搜索到条数：</label>${fn:length(list)}</span>
							<a class="next2" pageno="2" name="filterNextPage"
								hidefocus="true"></a>
						</div>
					</div>
				</div>
				<script>
				function onClickOrderBy(obj, by) {
					$('#orderByPice').val(obj + "-" + by);
					$('#paramForm').submit();
				}
					window.onload = function() {
						tabPages({
							pageMain : 'pageMain',
							pageNav : 'pageNav',
							pagePrev : 'prev',
							pageNext : 'next',
							curNum : 6, //每页显示的条数   
							activeClass : 'active', //高光显示的class       
							ini : 0
						//初始化显示的页面  
						});
						function tabPages(tabPages) {
							var pageMain = document
									.getElementById(tabPages.pageMain); //获取内容列表     
							var pageNav = document
									.getElementById(tabPages.pageNav); //获取分页      
							var pagePrev = document
									.getElementById(tabPages.pagePrev); //上一页      
							var pageNext = document
									.getElementById(tabPages.pageNext); //下一页               
							var curNum = tabPages.curNum; //每页显示数     
							var len = Math.ceil(pageMain.children.length
									/ curNum);
							//alert(pageMain.children.length);
							//计算总页数
							var pageList = ''; //生成页码     
							var iNum = 0; //当前的索引值index            
							for (var i = 0; i < len; i++) {
								pageList += '<a href="javascript:;">' + (i + 1)
										+ '</a>';
							}
							pageNav.innerHTML = pageList;
							pageNav.children[0].className = tabPages.activeClass; //头一页加高亮显示           
							for (var i = 0; i < pageNav.children.length; i++) {
								pageNav.children[i].index = i;
								pageNav.children[i].onclick = function() {
									for (var t = 0; t < pageNav.children.length; t++) {
										pageNav.children[t].className = '';
									}
									this.className = tabPages.activeClass;
									iNum = this.index;
									ini(iNum);
								};
							} //下一页   
							pageNext.onclick = function() {
								if (iNum == len - 1) {

									return false;
								} else {
									for (var t = 0; t < pageNav.children.length; t++) {
										pageNav.children[t].className = '';
									}
									iNum++;
									pageNav.children[iNum].className = tabPages.activeClass;
									ini(iNum);
								}
							}; //上一页   
							pagePrev.onclick = function() {
								if (iNum == 0) {

									return false;
								} else {
									for (var t = 0; t < pageNav.children.length; t++) {
										pageNav.children[t].className = '';
									}
									iNum--;
									pageNav.children[iNum].className = tabPages.activeClass;
									ini(iNum);
								}
							};
							function ini(iNum) {
								for (var i = 0; i < pageMain.children.length; i++) {
									pageMain.children[i].style.display = 'none';
								}
								for (var i = 0; i < curNum; i++) {
									if (pageMain.children[(iNum * curNum + i)] == undefined) {
										continue;
									}
									pageMain.children[(iNum * curNum + i)].style.display = 'block';
								}
							}
							ini(iNum);
						}
					};
				</script>
				<div class="proclist_all">
					<div class="nav1">
						<ul>
							<c:forEach items="${list }" var="commShop" varStatus="loop">
								<li><a
									href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p
											class="proclist_all_img">
											<img src="../${commShop.shopCommImages[0].imagePath }" />
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
											<input class="icon-cut" type="button"
												onclick="cut(${loop.index});" /> <input
												id="qty${loop.index }" type="text" _minsaleqty="1" value="1"
												class="text" isfcl="0" name="input_catalog_qtc" /> <input
												class="icon-add" type="button" onclick="add(${loop.index});" />
										</div>
										<div class="fy-price-icon1 ">
											<a name="addToCart" hidefocus="true"
												onclick="buyCat('${commShop.commCode }','${loop.index }');">
												<img border="0" src="content/static/images/btn_buy.jpg"
												style="display: inline;" />
											</a>
										</div>
									</div></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<script> 
// 				$(function(){ // 				
				function add(index){					
					var t=$('#qty'+index);
					t.val(parseInt(t.val())+1);
				}
				function cut(index){
					var t=$('#qty'+index);
					t.val(parseInt(t.val())-1);
					if(parseInt(t.val())<1){ 
					t.val(1); 
					};
				}
				
			</script>
				<div class="cl"></div>
				<div class="pages">
					<div id="pageBox">
						<span id="prev">上一页</span>
						<div id="pageNav"></div>
						<span id="next">下一页</span>
					</div>
				</div>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<!-- 滚动广告end -->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>