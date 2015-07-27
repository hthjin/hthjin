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
<title>添加棉花</title>
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
						<a href="management/getAllCotton"><span class="badge navbar-right">返回</span></a>
					</h3>
				</div>
				<div class="panel-body">
				<form class="form-horizontal" id="form" name="IUpload" method="POST"
					enctype="multipart/form-data">
					<input type="hidden" value="${cotton.cottonId}" name="cottonId"/>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">批次</label>
							<div class="col-sm-8">
								<input id="batch" class="form-control" name="batch" 
								  value="${cotton.batch}"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">类型</label>
							<div class="col-sm-8">
								<input id="cottonType" class="form-control" name="cottonType" 
								  value="${cotton.cottonType }"/>
							</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否公检:</label>
						<div class="col-sm-8">
							<select id="isCheck" name="isCheck">
							<c:if test="${cotton.isCheck == false}">
								<option value="false" selected="selected">未公检
								<option value="true">已公检
							</c:if>
							<c:if test="${cotton.isCheck != false}">
								<option value="false">未公检
								<option value="true" selected="selected">已公检
							</c:if>
							</select> 
						</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">入库时间</label>
							<div class="col-sm-8">
								<input id="date" class="form-control" name="date" 
								  value="${cotton.date }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">包数</label>
							<div class="col-sm-8">
								<input id="amount" class="form-control" name="amount" 
								  value="${cotton.amount }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">毛重</label>
							<div class="col-sm-8">
								<input id="weight" class="form-control" name="weight" 
								  value="${cotton.weight}"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">公重</label>
							<div class="col-sm-8">
								<input id="netWeight" class="form-control" name="netWeight" 
								  value="${cotton.netWeight }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-8">
								<input id="price" class="form-control" name="price" 
								  value="${cotton.price }"/>
							</div>
					</div>
					<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">仓库</label>
							<div class="col-sm-8">
								<input id="warehouse" class="form-control" name="warehouse" 
								  value="${cotton.warehouse }"/>
							</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否出售:</label>
						<div class="col-sm-8">
							<select id="isSell" name="isSell">
							<c:if test="${cotton.isSell != false}">
								<option value="false">不出售
								<option value="true" selected="selected"> 出售中
							</c:if>
							<c:if test="${cotton.isSell == false}">
								<option value="false" selected="selected">不出售
								<option value="true"> 出售中
							</c:if>
							</select> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所在工厂:</label>
						<div class="col-sm-8">
							<select id="cottonFactoryId" name="cottonFactoryId">
								<c:forEach items="${cottonFactories }" var="cottonFactory">
									<option value="${cottonFactory.factoryId }">${cottonFactory.factoryName }
								</c:forEach>
							</select>
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
				document.IUpload.action = "management/updateCotton";
				document.IUpload.submit();
			} else {
				document.IUpload.action = "management/addCotton";
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