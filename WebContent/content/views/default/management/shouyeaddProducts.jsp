<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容管理</title>
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">

<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="content/static/css/bootstrap/bootstrap-tree.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page='../common/header.jsp' />
	<div class="row clearfix">
		<br> <br> <br>
		<jsp:include page='../common/menu.jsp' />
		<!-- Static navbar -->
		<div class="col-md-3 column">
			<div class="panel panel-default">
				<div class="panel-heading">
					<a href="management/shouyeproductslist">内容管理<span
						class="badge navbar-right">返回&nbsp;</span></a>
				</div>
				<div class="tree well">
					<c:set var="index" value="0" scope="request" />
					<!-- 自增序号，注意scope-->
					<c:set var="level" value="0" scope="request" />
					<!-- 记录树的层次，注意scope-->
					<c:import url="__department1.jsp" />
				</div>
			</div>
		</div>
		<div class="col-md-7 column">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">操作</h3>
				</div>
				<div class="list-group-item">
					<p class="list-group-item-text">
						<br>
					<form class="form-horizontal" id="form" name="IUpload"
						method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">分类名称:</label> <label
								class="col-sm-2 control-label"><font color="red">${department.departmentname }</font></label>
							<input id="departmentID" name="departmentID"
								value="${department.id }" type="hidden"> <br>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">名称:</label>
							<div class="col-sm-10">
								<input name="productsName" class="form-control"
									value="${products.productsName }"> <br>
							</div>
						</div>
						<input name="productsID" type="hidden" value="${products.id }">
						<div class="form-group" id="text">
							<label for="inputIdentifier" class="col-sm-2 control-label">课程安排:</label>
							<div class="col-sm-10">
								<textarea class="summernote">${products.effect }</textarea>
								<input type="hidden" name="effect" id="effect">
							</div>
						</div>
						<script type="text/javascript">
							$(function() {
								$('.summernote').summernote({
									height : 100,
									minHeight : null, // set minimum height of editor
									maxHeight : null, // set maximum height of editor
									focus : true,
									lang : 'zh-CN'
								});
							});
						</script>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
								宣传上传： </label> <input id="lAndW" type="hidden" value="310*360">
							<br>
							<div class="col-sm-8">
								<input name="sendFile" type="file" class="form-control"
									size="40" maxlength="40" onchange="PreviewImage(this);">
								310*360
							</div>
							<br>

						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">
							</label>
							<div class="col-sm-8" id="brandLogo">
								<img alt="" src="${products.productsPhoto }">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
								<button type="button" class="btn btn-default" id="subForm">添加or修改</button>
							</div>
						</div>
					</form>
					</P>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function PreviewImage(imgFile) {
			var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
			if (!pattern.test(imgFile.value)) {
				alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");
				imgFile.focus();
			} else {
				var path;
				if (document.all)//IE 
				{
					imgFile.select();
					path = document.selection.createRange().text;
					document.getElementById("brandLogo").innerHTML = "";
					document.getElementById("brandLogo").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\""
							+ path + "\")";//使用滤镜效果 
				} else//FF 
				{
					path = URL.createObjectURL(imgFile.files[0]);
					document.getElementById("brandLogo").innerHTML = "<img name='picshow' src='"+path+"'/>";
				}
			}
		}
		function imgExceedSize(w, h) {
			if (!document.IUpload.sendFile.value == "") {
				if (picshow.width >= w || picshow.height >= h) {
					alert("图像尺寸：" + picshow.width + "X" + picshow.height
							+ "。图像尺寸不符合！你只能上传尺寸为 " + w + "×" + h
							+ "的图像，请重新浏览图片！");
					return true;
				} else {
					return false;
				}
			} else {
				return true;
			}
		}
		j = 1;
		$(document)
				.ready(
						function() {
							$("#btn_add2")
									.click(
											function() {
												document
														.getElementById("newUpload2").innerHTML += '<div id="div_'+j+'" class="form-group"><label for="inputEmail3" class="col-sm-2 control-label"></label><div class="col-sm-8"><input  name="file_'+j+'" type="file" class="form-control" /><input type="button"  style="width: 56px; height: 35px;" value="删除"  onclick="del_2('
														+ j
														+ ')"/></div></div>';
												j = j + 1;
											});
						});
		function del_2(o) {
			document.getElementById("newUpload2").removeChild(
					document.getElementById("div_" + o));
		}
		$(document).ready(function() {
			$("input[name='positionCheck']").each(function() {
				<c:forEach items="${depAndPos }" var="dap">
				if (this.value == '${dap.positions.positionid}') {
					$(this).attr("checked", "checked");
				}
				</c:forEach>
			});
		})
		function onclickID(id) {
			location.href = 'management/shouyegetAgriculturalsSort?id=' + id
					+ "&page=addProducts";
		}
		$(document)
				.ready(
						function() {
							$('#subForm')
									.on(
											'click',
											function(e) {
												e.preventDefault();
												$('#effect')
														.val(
																$('.summernote')
																		.code());
												if ('${department.id}' == 4
														|| '${department.id}' == 5
														|| '${department.id}' == 6) {
													if (!document.IUpload.sendFile.value == "") {

													}
													document.IUpload.action = "management/shouyeaddProducts";
													document.IUpload.submit();
												} else {
													if (!document.IUpload.sendFile.value == "") {
														if ($('#lAndW').val() != '') {
															ok = imgExceedSize(
																	$('#lAndW')
																			.val()
																			.split(
																					'*')[0],
																	$('#lAndW')
																			.val()
																			.split(
																					'*')[1]);
															if (ok) {
																document.IUpload
																		.reset();
															} else {
																document.IUpload.action = "management/shouyeaddProducts";
																document.IUpload
																		.submit();
															}
														}
													}
												}
											});
						});
		function GetFileSize(fileId) {
			var dom = document.getElementById(fileId);
			try {
				return dom.files.item(0).fileSize;
			} catch (e) {
				try {
					var img = new Image();
					img.src = dom.value;
					img.style.display = 'none';
					document.body.appendChild(img);
					setTimeout(function() {
						document.body.removeChild(img);
					}, 1000);
					return img.fileSize;
				} catch (e) {
					return -1;
				}
			}
		}
		function refreshParent() {
			window.opener.location.reload();
		}
		function closeAndRefresh() {
			window.onunload = refreshParent;
			return true;
		}
		$(function() {
			$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr(
					'title', 'Collapse this branch');
			$('.tree li.parent_li > span').on(
					'click',
					function(e) {
						var children = $(this).parent('li.parent_li').find(
								' > ul > li');
						if (children.is(":visible")) {
							children.hide('fast');
							$(this).attr('title', 'Expand this branch').find(
									' > i').addClass('icon-plus-sign')
									.removeClass('icon-minus-sign');
						} else {
							children.show('fast');
							$(this).attr('title', 'Collapse this branch').find(
									' > i').addClass('icon-minus-sign')
									.removeClass('icon-plus-sign');
						}
						e.stopPropagation();
					});
		});
	</script>
</body>
</html>