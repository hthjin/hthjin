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
<!--选项卡js-->
<!--<script type="text/javascript"> 
function setTab(name,m,n){ 
		for( var i=1;i<=n;i++){ 
			var menu = document.getElementById(name+i); 
			var showDiv = document.getElementById("text"+i); 
			menu.className = i==m?"on":""; 
			showDiv.style.display = i==m?"block":"none"; 
			} 
	} 
</script>-->
</head>

<body>
	<!--头部-->
	<jsp:include page="../frontDesk/header.jsp" />
	<!-- 左边部分 -->
	<div class="produta">
		<div class="produta_til">
			<a href="javascript:void(0);">卖家中心</a> < <span style="font-weight: 700;">出售中的商品</span>
		</div>
		<jsp:include page="setupShopCommons/left.jsp" />
		<!--中间内容-->
		<div class="sold">
			<div class="top1" style="height:120px;">
				<form action="proscenium/searchCommNameCateBrand" method="post" id="ww">
					商品（品牌、类别）名称：<input type="text" name="name" /> <input type="submit"
						value="搜索" />
				</form>
				<form action="proscenium/searchCommName" method="post">
					商品名称：<input type="text" name="commoidtyName"
						style="margin-right: 10px;" /> 商家编码：<input type="text"
						name="commCode" style="margin-right: 10px;"  onblur="checkvalue(this);"/> 商家货号：<input
						type="text" name="commItem" onblur="checkvalue(this);"/> <input type="submit" value="搜索" />
				</form>
			</div>
			<div class="all1">
				<div class="all_nav">
					<ul>
						<li style="width: 362px;">商品名称</li>
						<li>价格</li>
						<li>库存</li>
						<li>操作</li>
					</ul>
				</div>
				<form action="proscenium/multiDelComm" onsubmit="return checkDel();">
					<div class="all_nav1">
						<!-- 	                	<input type="checkbox" name="quan" />全选 -->
						<input type="submit" value="删除" style="margin: 15px 0px 0px 15px;">
						<label id="tishi" style="color: red;"></label>
					</div>
					<script type="text/javascript">
					function checkvalue(obj) {
						if (!/^[+|-]?\d+\.?\d*$/.test(obj.value)
								&& obj.value != '') {
							alert('你输入的不是数字，或关闭输入法后再输入');
							obj.select();
						}
					}
						function multiDownComm() {
							document.forms[0].action = "proscenium/multiDownComm";
							document.forms[0].submit();
						}
					</script>
					<div class="all_class2">
						<ul>
							<c:forEach items="${commodities }" var="c">
								<li  style="width: 362px;"><input type="checkbox"
									name="checkbox" value="${c.commCode }" /> <img src="../${c.shopCommImages[0].imagePath }"
									width="50px;" />
									<div class="l1">
										<a href="#" >${c.commoidtyName } <br /></a>
									</div></li>
								<li><div class="l3">${c.unitPrice}</div> </li>
								<li>
									<div class="l3">${c.stock }</div> 
								</li>
								<li>
									<div class="l5">
										<a href="proscenium/editCommoidty?commid=${c.commCode }">编辑商品</a>
									</div>
									<c:if test="${flag==1}">
										<div class="l4">
											<a style="color: #fff; text-decoration: none;"
												href="proscenium/downComm?commId=${c.commCode }">下架</a>
										</div>
									</c:if> <c:if test="${flag==0}">
										<div class="l4">
											<a style="color: #fff; text text-decoration: none;"
												href="proscenium/upComm?commId=${c.commCode }">上架</a>
										</div>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function copyURL() {
			alert(1);
			var clipBoardContent = this.location.href;
			window.clipboardData.setData("Text", clipBoardContent);
		}
		function checkDel() {
			var tishi = $("#tishi");
			var chk_value = [];
			$("input[name='checkbox']:checked").each(function() {
				chk_value.push($(this).val());
			});
			if (chk_value.length == 0) {
				tishi.text("请至少选择一个");
				return false;
			} else {
				return true;
			}
		}
	</script>
	<!-- 页脚部分 -->

	<div class="cl"></div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />

</body>
</html>
