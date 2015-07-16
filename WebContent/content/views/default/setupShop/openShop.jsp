<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Shop shop = null;
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>华腾物流</title>
<link rel="stylesheet" type="text/css" href="content/static/css/seller.css">
<link rel="stylesheet" type="text/css" href="content/static/css/style.css">
<!--<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>-->
<script>
	function f1(div1,div2){
		if(div2.style.display=="none"){
			div2.style.display="block";
			}else{
				 div2.style.display="none";
			}
		}
</script>
</head>

<body>
<!--头部-->
<jsp:include page="../nav.jsp"/>
<!-- 左边部分 -->
<jsp:include page="setupShopCommons/left.jsp" />  
	
<!-- 页脚部分 -->
<jsp:include page="../frontDesk/foot.jsp"/>

</body>
</html>
