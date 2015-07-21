<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>华腾汇金产品中心</title>
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
<style>
#nav {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
	<div class="produtclass">

		<div class="right proclas">
			<div class="proclas_top">
				<img src="content/static/images/slov/home_top.jpg" width="1200"
					height="326" />
			</div>
			<c:forEach var="yijicate" items="${cate.children }">
				<div class="proclas_all">
					<div class="proclasa_til">
						<a class="proclasa_h3">${yijicate.category }</a> <a
							class="proclasa_more"
							href="search/result?id=${yijicate.categoryID }">更多&gt;</a>
					</div>
					<div class="proclasa_all">
						<ul>
							<c:set var="count" value="0"></c:set>
							<c:forEach var="commShop" items="${list }">
								<c:if
									test="${commShop.shopCategory.categoryID == yijicate.categoryID }">
									<c:if test="${count < 6 }">
										<li><a
											href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p
													class="proclasa_all_img">
													<img src="${commShop.shopCommImages[0].imagePath }" />
												</p></a> <a
											href="items/shopItem?commID=${commShop.commCode }&category=${commShop.shopCategory.categoryID }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><p>${commShop.commoidtyName }</p></a>
											<a
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
												</p></a> <c:set var="count" value="${count+1 }"></c:set>
									</c:if>
								</c:if>
							</c:forEach>

						</ul>
					</div>
				</div>
			</c:forEach>
			<div class="cl"></div>
		</div>
	</div>
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>