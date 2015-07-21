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
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<div class="produta">
		<div class="produta_til">
			<p>
				您现在的位置：<a href="productCenter/shopIndex">首页</a> > 购物车
			</p>
		</div>
	</div>
	<div class="car-tu">
		<div class="process-01"></div>
	</div>
	<div class="shop-car">
		<div class="car-zi">我的购物车</div>
		<hr />
		<div class="content">
			<input type="checkbox" name="allselect" id="allselect" style="float: left; margin-top: 30px;" />
			<label style="width: 110px;  float: left; padding-top: 23px;">全选</label>
				<div class="jiesao">商品名称</div>
				<div class="price">商品单价</div>
				<div class="shuliang">购买数量</div>
				<div class="youhui">优惠金额</div>
				<div class="xiaoji" >小计</div>
				<div class="caozuo">操作</div>
		</div>
		<hr />
		<c:forEach items="${list }" var="carCommodity" varStatus="loop">
			<div class="content">
				<input type="checkbox" name="select"
					style="float: left; margin-top: 30px;"
					value="${carCommodity.id },${loop.index }"
					onclick="onclickCheck(this);" /> <a
					href="proscenium/shopItem?commID=${carCommodity.shopCommodity.commCode }&category=${carCommodity.shopCommodity.shopCategory.categoryID }&shopID=${carCommodity.shopCommodity.belongTo.id }&commoName=${carCommodity.shopCommodity.commoidtyName }">
					<img
					src="${carCommodity.shopCommodity.shopCommImages[0].imagePath }"
					style="width: 70px; height: 70px; float: left;" />
				</a>
				<div class="jiesao">${carCommodity.shopCommodity.commoidtyName }</div>
				<div class="price">
					￥
					<fmt:formatNumber value="${carCommodity.shopCommodity.unitPrice }"
						pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
				</div>
				<div class="shuliang">
					<div style="float: left; margin-right: 5px;">
						<a href="#"><img src="content/static/images/jiahao.png" width="20px"
							height="20px" /></a>
					</div>
					<div style="float: left;">
						<input id="amount${loop.index }" value="1"
							style="width: 55px; height: 20px;"
							onchange="onchangeAmount(this,${loop.index });"
							value="${carCommodity.amount }" />
					</div>
					<div style="float: right; margin-left: 5px;">
						<a href="#"><img src="content/static/images/jianhao.png" width="20px"
							height="20px" /></a>
					</div>
				</div>
				<div class="youhui">
					￥
					<fmt:formatNumber value="${carCommodity.unitPrice }"
						pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
					<input type="hidden" id="unitPrice${loop.index }"
						value="${carCommodity.unitPrice }" /> <input type="hidden"
						value="${carCommodity.price }" id="price${loop.index }"
						name="price" />
				</div>
				<div class="xiaoji" id="displayPrice${loop.index }">
					￥
					<fmt:formatNumber value="${carCommodity.price }" pattern="##.##"
						minFractionDigits="2"></fmt:formatNumber>
				</div>
				<div class="caozuo">
					<a href="user/deleteShopCar?id=${carCommodity.id }"> <img
						src="content/static/images/shanchu.png" style="margin-top: 30px;"
						width="20PX;" height="20PX;" /> 删除
					</a>
				</div>
			</div>
			<hr />
		</c:forEach>
		<div class="pay">
			
			<p>
				<a href="productCenter/shopIndex">继续购物</a>
			</p>
			<p style="margin-left:500px;">
			</p>
			<p>
				应付金额：<font color="#FF0000"><span id="zong"> ￥<fmt:formatNumber
							value="0.00" pattern="##.##" minFractionDigits="2"></fmt:formatNumber>
				</span> </font>
			</p>
			<input type="hidden" id="zhongjinge" value="0" /> <a
				href="javascript:void(0);" onclick="orderConfirm();"><div
					id="jiesuan">去结算</div></a>
		</div>
		<div class="cl"></div>
	</div>
	<form action="user/orderConfirm" id="formConfirm" method="post">
		<input type="hidden" name="params" id="params" value="" />
	</form>
	<script type="text/javascript">
			function orderConfirm(){
				var nums = "";
				 $("input[name='select']").each(function(){
					 if(this.checked){
						 var num = $(this).val().split(',')[0];
						 nums = nums + num + "-" + $('#amount'+$(this).val().split(',')[1]).val()+",";
					 }
				 });
				 $('#params').val(nums);
				 if($('#params').val() != ''){
					 $('#formConfirm').submit();
				 }else{
					 alert('您还没有选择商品呢！');
				 }
			}
			$("#allselect").click(function(){
			    if(this.checked){
			    	var zhongjia =0;
			        $("input[name='select']").each(function(){
			            this.checked = true;
			            var num = $(this).val().split(',')[1];
			            zhongjia = parseFloat(zhongjia) +parseFloat($('#price'+num).val());
			        }); 
				    $('#zhongjinge').val(zhongjia);
				    $('#zong').html("￥"+zhongjia.toFixed(2));
				    
			    }else{ 
			    	var zhong = $('#zhongjinge').val();
			        $("input[name='select']").each(function(){
			            this.checked = false;
			            var num = $(this).val().split(',')[1];
			            zhong = parseFloat(zhong) - parseFloat($('#price'+num).val());
			        });
			        $('#zhongjinge').val(zhong);
				    $('#zong').html("￥"+zhong.toFixed(2));
			    } 
			});
			function onclickCheck(obj){
				var zhong = $('#zhongjinge').val();
				var num = obj.value.split(',')[1];
				if(obj.checked){
				    zhong = parseFloat(zhong) + parseFloat($('#price'+num).val());
				}else{
		            zhong = parseFloat(zhong) - parseFloat($('#price'+num).val());
				}
				$('#zhongjinge').val(zhong);
			    $('#zong').html("￥"+zhong.toFixed(2));
			}

			function onchangeAmount(obj,index){
				var price = $('#unitPrice'+index).val();
				var num = obj.value;
				$('#price'+index).val(parseFloat(price)*num);
				var pri = parseFloat(price)*num;
				$('#displayPrice'+index).html("￥"+pri.toFixed(2));
				shuaxin();
			}
			function shuaxin(){
				var zhong = 0;
				$("input[name='select']").each(function(){
					if(this.checked){
						var num = $(this).val().split(',')[1];
						zhong = parseFloat(zhong) + parseFloat($('#price'+num).val());
					}
		        });
				$('#zhongjinge').val(zhong);
				$('#zong').html("￥"+zhong.toFixed(2));
			}
			function collectionClick(paramUrl) {
				jQuery.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : paramUrl,
					dataType : 'json',
					success : function(data) {
						if (data.success == "true") {
							alert('亲，已经加入收藏夹了哦！');
						}

						else if (data.success == "existed") {
							alert('收藏夹已经有这个宝贝了，亲是有多喜欢她啊！');
						}

						else if (data.success == "nouser") {
							if (confirm('您还没有登录哦！')) {
								var url = "user/login";
								window.location = url;
							}
						}
					}
				});
			}
		</script>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>