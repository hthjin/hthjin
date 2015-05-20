<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page='header.jsp' />
<script type="text/javascript">
	// Popup window code
	function popupWindow(url) {
		popupWindow = window
				.open(
						url,
						'popUpWindow',
						'height=600,width=600,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	}
</script>
<div class="row clearfix">
	<jsp:include page='menu.jsp' />
	<div class="col-md-10 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a href="addNews">新闻发布<span class="badge navbar-right">添加&nbsp;+</span></a>
				</h3>
			</div>
			<div class="list-group">
				<div class="list-group-item">
					<p class="list-group-item-text">
					<table class="table table-striped" id="talble1">
							<tr>
								<th>语言</th>
								<th>标题</th>
								<th>内容</th>
								<th></th>
							</tr>
							<c:forEach var="notice" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr >
									</c:when>
									<c:otherwise>
										<tr >
									</c:otherwise>
								</c:choose>
									<td><c:if test="${notice.language =='Chinese' }">汉语</c:if><c:if test="${notice.language =='Uighur' }">维语</c:if></td>
									<td>${notice.title }</td>
									<td>
									<a
										href="./getNews?id=${notice.noticeId }">
										<c:if test="${!fn:contains(notice.content,'<') }">
										<c:if test="${fn:length(notice.content)<=10}">${notice.content }</c:if>
											<c:if test="${fn:length(notice.content )>10}">${fn:substring(notice.content, 0, 8)}.....</c:if>
										</c:if>
											<c:if test="${fn:contains(notice.content,'<') }">${notice.content }</c:if>
										</a>
									</td>
								<td><a onclick="return confirm('确定删除该新闻么？')"
									href="./deleteNews?id=${notice.noticeId }"><span
										class="badge">删除</span></a></td>
								</tr>
							</c:forEach>
					</table>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page='footer.jsp' />