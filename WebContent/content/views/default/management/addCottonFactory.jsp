<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加工厂</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="content/static/img/favicon.png" />
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<body>
	<jsp:include page='../common/header.jsp' />
	<br />
	<br />
	<div class="row clearfix">
		<jsp:include page='../common/menu.jsp' />
		<div class="col-md-10 column">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="height: 16px;">
						<a href="management/getAllCottonFactory"><span class="badge navbar-right">返回</span></a>
					</h3>
				</div>
				<div class="panel-body">
				<form class="form-horizontal" id="form" name="IUpload" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" value="${cottonFactory.factoryId}" name="id"/>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">工厂名称</label>
							<div class="col-sm-8">
								<input id="factoryName" class="form-control" name="factoryName" 
								  value="${cottonFactory.factoryName}"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">工厂地址</label>
							<div class="col-sm-8">
								<input id="factoryAddress" class="form-control" name="factoryAddress" 
								  value="${cottonFactory.factoryAddress }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">联系方式</label>
							<div class="col-sm-8">
								<input id="factoryPhone" class="form-control" name="factoryPhone" 
								  value="${cottonFactory.factoryPhone }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-8">
								<input id="linkMan" class="form-control" name="linkMan" 
								  value="${cottonFactory.linkMan }"/>
							</div>
					</div>
					<div class="form-group">
						<div class=" col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-default"
									onclick="detect('${method}');"><c:if test="${method != 'update' }">添加工厂</c:if>
									<c:if test="${method == 'update' }">更新工厂</c:if></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
	function checkvalue(obj) {
		if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
			alert('你输入的不是数字，或关闭输入法后再输入');
			obj.select();
		}
	}
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
				timepicker : false,
				format : 'Y-m-d',
				formatDate : 'Y-m-d',
			});
		}
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		function detect(obj) {
			if (obj == 'update') {
				document.IUpload.action = "management/updateCottonFactory";
				document.IUpload.submit();
			} else {
				document.IUpload.action = "management/addCottonFactory";
				document.IUpload.submit();
			}
		}

		function popupwindow(url) {
			var w = 700;
			var h = 800;
			var title = "";
			var left = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2);
			return window
					.open(
							url,
							title,
							'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
									+ w
									+ ', height='
									+ h
									+ ', top='
									+ top
									+ ', left=' + left);
		}
	</script>
</body>
</html>