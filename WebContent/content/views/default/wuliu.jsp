<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
<title>网站地图</title>
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/news.css" />
<link rel="stylesheet" type="text/css"
	href="content/static/css/main.css" />
<script src="content/static/js/tumbler/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#oul").children(this).children($("#oul").children(this))
						.hover(
								function() {
									var index = $("#oul").children(this).index(
											this);
									$(this).css("backgroundColor", "#EB4642")
											.css("color", "#fff");
								},
								function() {
									$(this).css("backgroundColor", "#fff").css(
											"color", "#999");
								});
			});
</script>
</head>
<body>
	<!--头部开始-->
	<jsp:include page="nav.jsp" />
	<!--头部结束-->
	<!--面包屑-->
	<div class="bread">
		<div style="width: 1000px;" class="bread2">
			<a href="hthjin">首页 </a> <span> > 物流平台</span>
		</div>
	</div>
	<!--文章内容-->
	<script>
				$(function(){
					$("#oulss").children($("#oulss")).click(function(){
							var index=$("#oulss").children(this).index(this);
							for( i=0;i<$("#oulss").children(this).length;i++){
								if(i==index){
									$("#right").children(this).eq(i).css("display","block");
									$("#oulss").children(this).eq(i).css("backgroundColor","#EB4642").css("color","#fff");
									}else{
										$("#right").children(this).eq(i).css("display","none");
										$("#oulss").children(this).eq(i).css("backgroundColor","#fff").css("color","#000");
										}
								}
						});
					});
			</script>
<div class="wuliu">
	<div class="left">
    	<ul id="oulss">
    		<c:forEach items="${yunshufangshi }" var="yunshu">
    			<c:if test="${products.id == yunshu.id }">
    				<li style="background-color:#EB4642; color:#fff;">
    			</c:if>
    			<c:if test="${products.id != yunshu.id }">
    				<li>
    			</c:if>
    				${yunshu.productsName }
    			</li>
        	</c:forEach>
        </ul>
        <div class="kuang">
        	<p  style=" font-size:12px; margin-top:20px;">有任何物流需求均可请联系</p>
            <p>电话：400-000-000</p>
            <p>7*24小时服务</p>
        </div>
    </div>
    <div class="right" id="right">
            <div class="box2" id="box2" >
            <span>${products.productsName }</span>
             <div class="right">
            </div>
        </div>
            ${products.effect }
    </div>
</div>
	<!---------------------foot-------------------------->
	<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>