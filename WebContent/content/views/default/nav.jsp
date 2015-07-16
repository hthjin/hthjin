<%@page import="com.yc.entity.user.Personnel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="head">
	<div class="nav">
    	<a href="hthjin"><img src="content/static/images/logo_shop.png" /></a>
        <div class="nav_class">
        	<ul id="oul">
                 <a href="hthjin"><li style="background-color:#EB4642; color:#fff; width:95px;">/首页/</li></a>
                <a href="productCenter/shopIndex"><li>/ 产品中心/ </li></a>
                <a href="news.html"><li>/ 公告通知/ </li></a>
                <a href="jianjie.html"><li>/ 公司简介/ </li></a>
                <a href="about.html"><li>/ 关于我们/ </li></a>
            </ul>
        </div>
        <div class="search">
        	<div class="btn">
            	<a href="user/login"><div class="dl">登陆</div></a>
                <a href="user/regist"><div class="zc">注册</div></a>
            </div>
            <div class="ser_box"> 
            	<input type="search" placeholder="请搜索产品..."style="color:#999; width:175px; height:30px; border:none;"  />                
            </div>
            <a href="produtclist.html"><input class="se_img" type="image" src="content/static/images/search_03.png"/></a>
        </div>
    </div>
</div>
