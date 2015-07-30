<%@page import="com.yc.entity.user.AppUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginUser"
				value='<%=(AppUser) request.getSession().getAttribute(
						"loginUser")%>'></c:set>
<div class="top_ban">
    	<div class="centers">
                <div class="main">
                    <ul style="margin-left:200px;">
                        <a href="user/userInfo"><li>会员中心</li></a>
                    </ul>
              </div> 
              <div class="ctt" style="width:140px; height:25px; float:right;  margin-top:-25px;">
              		
              		<c:if test="${loginUser == null}">
                    	<a href="user/login"><span style=" line-height:25px; color:#FE0002;">[登陆]</span></a>
                    </c:if>
                    <c:if test="${loginUser != null}">
                    	<span style=" line-height:25px; color:#FE0002;">[${loginUser.userName }已登录]</span>
                    </c:if>
                    <a href="user/regist"><span style=" line-height:25px; color:#FE0002; ">[注册]</span></a>
              </div>
        </div>
    </div>
	<div class="top_head">
    	<div class="main">
        	<div class="left">
   		    	<a href="productCenter/shopIndex"><img src="content/static/images/logo.png" /></a>
            </div>
            <div class="right">            
       	    	<div class="left">
                	<dl>
               	  		<dt><input name="" id="hj" type="text"  placeholder="小黄米" style="color:#999;"/><a href="javascript:void(0);" onclick="searchName();">搜索</a></dt>
                    </dl>
                </div>
                <img class="right" src="content/static/images/tou.jpg" height="60" />
            </div>
            <div class="cl"></div>
      </div>
    </div>
<!--导航内容-->
<script type="text/javascript">
function searchName(){
	var name = $('#hj').val();
	if(name == ''){
		name = '小黄米';
	}
	location.href = "search/searchForName?paramName="+name;
}
</script>

