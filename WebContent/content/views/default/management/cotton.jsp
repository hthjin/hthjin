<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>棉花</title>
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
	<!-- Static navbar -->
	<br><br>
<div class="row clearfix">
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					棉花列表 <a href="management/addCottonList"> <span
						class="badge navbar-right" id="add"><font >添加&nbsp;&nbsp;+</font></span></a>
				</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>批次</th>
							<th>类型</th>
							<th>是否公检</th>
							<th>入库时间</th>
							<th>包数</th>
							<th>毛重</th>
							<th>公重</th>
							<th>价格</th>
							<th>仓库</th>
							<th>是否出售</th>
							<th>所在工厂</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cotton" items="${cottons }"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.index%2==0 }">
									<tr>
								</c:when>
								<c:otherwise>
									<tr class="success">
								</c:otherwise>
							</c:choose>
							<td>${cotton.batch}</td>
							<td>${cotton.cottonType}</td>
							<td><c:if test="${cotton.isCheck == false }">未公检</c:if>
							<c:if test="${cotton.isCheck != false }">已公检</c:if></td>
							<td>${cotton.date}</td>
							<td>${cotton.amount}</td>
							<td>${cotton.weight}</td>
							<td>${cotton.netWeight}</td>
							<td>${cotton.price}</td>
							<td>${cotton.warehouse}</td>
							<td><c:if test="${cotton.isSell == false }">未出售</c:if>
							<c:if test="${cotton.isSell != false }">出售中</c:if></td>
							<td>${cotton.cottonFactory.factoryName}</td>
							<td>
								<button class="btn btn-default"
									onclick="forPage('management/updateCottonList?id=${cotton.cottonId}');">修改</button>
								<button type="button" class="btn btn-default"
									onclick="deleteCottonById('${cotton.cottonId}');">删除</button>
							</td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page='../common/footer.jsp' />
	<script type="text/javascript">
		function forPage(obj){
			location.href = obj;
		}

		function getDate(strDate) {
			var date = eval('new Date('
					+ strDate.replace(/\d+(?=-[^-]+$)/, function(a) {
						return parseInt(a, 10) - 1;
					}).match(/\d+/g) + ')');
			return date;
		}

		function deleteCottonById(obj) {
			location.href = "management/deleteCotton?id=" + obj;
		}

		function popupwindow(url) {
			var w = 1200;
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