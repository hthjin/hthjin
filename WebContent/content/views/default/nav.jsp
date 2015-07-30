<%@page import="com.yc.entity.user.AppUser"%>
<%@page import="com.yc.entity.user.Personnel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="loginUser"
	value='<%=(AppUser) request.getSession().getAttribute("loginUser")%>'></c:set>
<div class="head">
	<div class="nav">
		<a href="hthjin"><img src="content/static/images/logo_shop.png" /></a>
		<div class="nav_class">
			<ul id="oul">
				<a href="hthjin"><li
					style="background-color: #EB4642; color: #fff; width: 95px;">/首页/</li></a>
				<a href="productCenter/shopIndex"><li>/ 产品中心/</li></a>
				<a href="#newsID"><li>/ 公告通知/</li></a>
				<a href="jianjie"><li>/ 公司简介/</li></a>
				<a href="about"><li>/ 关于我们/</li></a>
			</ul>
		</div>
		<div class="search">
			<div class="btn">
				<c:if test="${loginUser == null}">
					<a href="user/login"><div class="dl">登陆</div></a>
				</c:if>
				<c:if test="${loginUser != null}">
					<div class="dl" style="background-color: green;">[${loginUser.userName }已登录]</div>
				</c:if>
				<a href="user/regist"><div class="zc">注册</div></a>
			</div>
		</div>
	</div>
</div>
