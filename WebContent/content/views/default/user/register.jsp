<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>华腾汇金</title>
<link href="content/static/css/main.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style2.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>  
<!---------------------中间内容------------------------------>
<div class="login">
	<div class="left">
	<a href="index.html"><img src="content/static/images/logo.png" /></a>
	<img src="content/static/images/ladn.jpg"/></div>
    <div class="box">
    	<h2>用户注册</h2>
        <form action="user/regist" method="post" name="formRegist">
        <input type="hidden" value="${page }" name="page"/>
        用&nbsp;户&nbsp; 名：<input type="text" name="phone" style="margin-left:32px;"/><br  />
        密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input  type="password" style="margin-left:34px;"  /><br  />
        确认密码：<input  type="password" name="password" /><br  />
        <input type="button" onclick="register();" value="注册" class="button" style=""/>
        </form>
    </div>
</div>
<script type="text/javascript">
function register(){
		document.formRegist.action = "user/regist";
		document.formRegist.submit();
	}
</script>
<!---------------------foot-------------------------->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
