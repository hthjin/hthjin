<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = (Shop) request.getSession().getAttribute("shop");
%>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>不倒翁</title>
<base href="<%=basePath%>" />

<link rel="stylesheet" type="text/css"
	href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">

<link rel="stylesheet" type="text/css"
	href="content/static/css/style2.css">

<link rel="stylesheet" type="text/css"
	href="content/static/css/index2.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/datetime/jquery.mobile.flatui.css" />
<script type="text/javascript"
	src="content/static/js/datetime/jquery.js"></script>
<script type="text/javascript" src="content/static/js/map/jsAddress.js"></script>

<link href="content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/reception/gr.css" rel="stylesheet"
	type="text/css" />
<link href="content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="content/static/js/reception/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="content/static/js/reception/js.js"></script>
<script type="text/javascript"
	src="content/static/js/reception/ScrollPic.js"></script>
<style>
	.con form dd{margin-top:20px; margin-left:50px;}
	.con form dd input{margin-left:15px;}
</style>
</head>

<body>
	<!--头部-->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<!-- 左边部分 -->
	<div class="produta">
		<div class="produta_til">
			<a href="open.html">卖家中心</a> < <span style="font-weight: 700;">发布商品</span>
		</div>
		<!-- 左边部分 -->
		<jsp:include page="setupShopCommons/left.jsp" />
		<div class="con" style="border:1px #ededed solid; height:auto; width:880px;margin-left:220px;'">
		<div class="perterrtab perterrtab_2">
			<input id="language" type="hidden" value="chinese" />
			<h3 style="margin:15px 0px 20px 30px;">
				商品新增：
			</h3>
			<div class="kd_yz_cont">
				<form action="proscenium/saveCommodity" enctype="multipart/form-data"
					method="post">
					<input type="hidden" name="edit" value="0"/>
					<dl>
						<dd>
							<span>商品名称</span><input type="text" value="" name="commoidtyName" style="margin-left:50px;"/>
						</dd>
						<dd>
							<span>货号</span><input type="text" value="" name="commItem" style="margin-left:75px;" />
						</dd>
						<dd>
							<span>商品分类</span> <select onchange="shopcateOne(this);" id="shopcateTwo" name="categoryid"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 45px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${shopCategories }" var="shopcate"
									varStatus="loop">
										<option value="${shopcate.categoryID}">${shopcate.category}</option>
								</c:forEach>
							</select>
						</dd>
						<!-- 新增开始 -->
						<dd>
							<span>保质期</span><input type="text" style="margin-left:63px;"
								value="" name="deadline" />
							<span style="margin-left:50px;">包装方式</span><input type="text" 
								value="" name="packManner" />
						</dd>
						<dd>
							<span>产地</span><input type="text" style="margin-left:75px;"
								value="" name="productPlace"/>
							<span style="margin-left:50px;">产地省份</span><input type="text"
								value="" name="productProvince"/>
						</dd>
						<dd>
							<span>生产日期</span><input type="date" style="margin-left:50px; " 
								value="" name="productTime"/><span style="margin-left:29px;">生产许可证编号</span><input type="text"
								value="" name="productPerimitNum" />
								<span style="margin-left:29px;">生产厂址</span><input type="text" style="margin-left:30px;"
								value="" name="productFactoryAddress" />
						</dd>
						<dd>
							<span>生产标准号</span><input type="text" style="margin-left:40px;"
								value="" name="productStddNum" /><span  style="margin-left:30px;">生产厂名</span><input type="text" style="margin-left:33px;"
								value="" name="productFactoryName" />
						</dd>
						<!-- 新增结束 -->
						<dd>
							<span>库存数量</span><input type="text" style="margin-left:50px;"
								value="" name="stock" onblur="checkvalue(this);" />
								<select id="commUnit" name="commUnit" onchange="commUnitHandle();">
									<option value="1">件</option>
									<option value="0">箱</option>
								</select>
						</dd>
						<dd id="ddUnit" style="display: none">
							<span>每箱</span><input type="text" style="margin-left:73px;"
							 name="perBoxnum" onblur="checkvalue(this);" />
						</dd>
						<script>
							function commUnitHandle(){
								var unitValue = document.getElementById("commUnit").value;
								if(unitValue==0){
									document.getElementById("ddUnit").style.display="";
								}if(unitValue==1){
									document.getElementById("ddUnit").style.display="none";
								}
							}
						</script>
						
						<dd>
							<span>单价</span><input type="text" style="margin-left:75px;" value=""
								name="unitPrice"  onblur="checkvalue(this);"/>
							<span style="margin-left:50px;">大概重量</span><input type="text"
								 value="" name="probablyWeight"  onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>是否上架</span><input type="radio"
								style="width: 15px; height: 15px;margin-left:50px;" value="true" name="shelves"
								checked="checked" id="shelvesTrue"/>
								上架&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="shelves" id="shelvesFalse" />暂不上架 
								<span style="margin-left:50px;">是否折扣</span><input style="width: 15px; height: 15px;" type="radio" value="false"
								name="isSpecial" checked="checked" id="noIsSpecial"/>不折扣<input
								type="radio" style="width: 15px; height: 15px;" value="true"
								name="isSpecial" id="isSpecial"/>折扣<input type="text" style="width: 100px; display: none;"
								value="" name="special" id="special" onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>所属品牌</span><select name="brandName"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 50px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${listBrand }" var="b"
									varStatus="loop">
										<option value="${b.brandID}">${b.brandName}</option>
								</c:forEach>
							</select>
						</dd>
						<c:forEach items="${shop.shopCat.specifications }" var="sp" varStatus="status">
							<dd>
								<span>${sp.specificatName }</span>
								<input type="hidden" name="commspecName${status.count}" value="${sp.specificatName}"/>
								<input type="text" name="${sp.specificatName}"/>
							</dd>
						</c:forEach>	
						<dd>
							<span>照片上传</span><input type="file" name="myfile" style="margin-left:50px;"/>
						</dd>
						<div id="newUpload2"></div>
						<dd>
							<span></span><input type="button" id="btn_add2"
								style="height: 35px; width: 80px;margin-left:150px;" value="再增加一张">
						</dd>
						<dd>
							<span></span>
							<button type="submit" style=" width:80px; height:30px; border:none;margin-bottom:20px; margin-left:200px; background:red;font-size:16px;color:#fff;">添 加</button>
						</dd>
					</dl>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
			j = 1;
			$(document)
					.ready(
							function() {
								$("#btn_add2")
										.click(
												function() {
													document
															.getElementById("newUpload2").innerHTML += '<div id="div_'+j+'"><dd style="margin-left:93px;"><span></span><input  name="myfile" type="file"  /><input type="button"  style="width: 35px; height: 35px;" value="删除"  onclick="del_2('
															+ j
															+ ')"/></dd></div>';
													j = j + 1;
												});
							});
			function del_2(o) {
				document.getElementById("newUpload2").removeChild(
						document.getElementById("div_" + o));
			}
			function checkvalue(obj) {
				if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
					alert('你输入的不是数字，或关闭输入法后再输入');
					obj.select();
				}
			}
			$(document).ready(function() {
				$("#noIsSpecial").click(function() {
					$("#special").val("");
					$("#special").hide();
				});
				$("#isSpecial").click(function() {
					$("#special").show();
				});
				$("#shelvesFalse").click(function() {
					$("#special").val("");
					$("#checkShow").hide();
				});
				$("#shelvesTrue").click(function() {
					$("#checkShow").show();
				});

			});

			function addLanguage(obj) {
				var dd = document.getElementById("new");
				if (obj.checked) {
					dd.style.display = 'block';
				} else {
					dd.style.display = 'none';
				}
			}
			// 		function shopcateOne(obj) {
			// 			var Code = obj.value;
			// 			alert(Code);
			// 			var shopcateTwo = document.getElementById('shopcateTwo');
			// 			var num = shopcateTwo.options.length;
			// 			for (i = num - 1; i >= 0; i--) {
			//  				shopcateTwo.remove(i);
			//  			}
			// 			var shopcateThree = document.getElementById('shopcateThree');
			// 			var num = shopcateThree.options.length;
			// 			for (i = num - 1; i >= 0; i--) {
			// 				shopcateThree.remove(i);
			// 			}
			// 			var objOption = new Option("----请选择----", -1);
			// 			shopcateTwo.options[shopcateTwo.options.length] = objOption;
			// 			var objOptionT = new Option("----请选择----", -1);
			// 			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			// 			<c:forEach items="${list2 }" var="leiBieTwo">
			// 				if ('${leiBieTwo.parentLevel.categoryID }' == Code) {
			// 					alert('${leiBieTwo.parentLevel.categoryID }');
			// 					var objOption = new Option("${leiBieTwo.category }",'${leiBieTwo.categoryID}');
			// 					shopcateThree.options[shopcateTwo.options.length] = objOption;
			// 				}
			// 			</c:forEach>
			// 		}

			function shopcateOne(obj) {
				var Code = obj.value;
				var shopcateTwo = document.getElementById('shopcateTwo');
				var num = shopcateTwo.options.length;
				var shopcateThree = document.getElementById('shopcateThree');
				var num = shopcateThree.options.length;
				for (i = num - 1; i >= 0; i--) {
					shopcateThree.remove(i);
				}
				var objOptionT = new Option("----请选择----", -1);
				shopcateThree.options[shopcateThree.options.length] = objOptionT;
				<c:forEach items="${list2 }" var="leiBieTwo">
				if ('${leiBieTwo.parentLevel.categoryID }' == Code) {
					alert(Code + ":" + '${leiBieTwo.parentLevel.categoryID }'
							+ '${leiBieTwo.category}');
					var objOption = new Option("${leiBieTwo.category}",
							'${leiBieTwo.categoryID}');
					shopcateThree.options[shopcateThree.options.length] = objOption;
				}
				</c:forEach>
			}

			function shopcate(obj) {
				var language = $("#language").val();
				var Code = obj.value;
				var shopcateThree = document.getElementById('shopcateThree');
				var num = shopcateThree.options.length;
				for (i = num - 1; i >= 0; i--) {
					shopcateThree.remove(i);
				}
				var objOptionT = new Option("----请选择----", -1);
				shopcateThree.options[shopcateThree.options.length] = objOptionT;
				<c:forEach items="${shopCategory }" var="leiBieThree">
				if ('${leiBieThree.parentLevel.categoryID }' == Code
						&& '${leiBieThree.level}' == 3) {
					if (language == "chinese") {
						var objOption = new Option("${leiBieThree.category }",
								'${leiBieThree.categoryID}');
					} else if (language == "russina") {
						var objOption = new Option(
								"${leiBieThree.russinaCategory }",
								'${leiBieThree.categoryID}');
					}
					shopcateThree.options[shopcateThree.options.length] = objOption;
				}
				</c:forEach>
			}
			function shopBrand(obj) {
				var Code = obj.value;
				jQuery
						.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : './getSpecific?ids=' + Code,
							dataType : 'json',
							success : function(data) {
								$('#guige').empty();
								$('#guize').val("");
								if (data && data.success == "true") {
									var $guige = "";
									$
											.each(
													data.spec,
													function(i, item) {
														var gui = item.attribute
																.split(',');
														var d = "";
														for (var j = 0; j < gui.length; j++) {
															d = d
																	+ "<option value='"+gui[j]+"'>"
																	+ gui[j]
																	+ "</option>";
														}
														$guige = $guige
																+ "<dd><span id='"+i+"'>"
																+ item.specificatName
																+ "</span><select onchange='guigechange(this,"
																+ i
																+ ");'  name='' style='height:35px; width:303px; border:1px solid #ccc; margin-left: 7px'><option value='-1'>----请选择----</option>"
																+ d
																+ "</select></dd>";
													});
								}
								$('#guige').append($guige);
							}
						});
			}
			function guigechange(obj, id) {
				var gui = $('#' + id).html();
				if (gui == '颜色') {
					$('#yanse').remove();
					var $guige = "<dd id='yanse'><span>该颜色商品照片</span><input type='file' name='yanse' /></dd>";
					$('#guige').append($guige);
				}
				var ze = obj.value;
				var guizes = $('#guize').val();
				var guize = guizes.split(',');
				var isok = false;
				var str = "";
				for (var i = 1; i < guize.length; i++) {
					if (guize[i].split('-')[0] == gui) {
						if (ze != '-1') {
							guize[i] = gui + '-' + ze;
							str = str + "," + guize[i];
						} else {
							guize[i] = "";
							str = str + guize[i];
						}
						isok = true;
					} else {
						str = str + "," + guize[i];
					}
				}
				if (isok) {
					$('#guize').val(str);
				} else {
					guizes = guizes + "," + gui + "-" + ze;
					$('#guize').val(guizes);
				}
			}
		</script>
		<div class="cl"></div>
	</div>
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
