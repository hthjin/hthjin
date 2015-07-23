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
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>棉花工厂</title>
<link href="content/static/css/style2.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/index2.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<script src="content/static/js/hthjin/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slides.js" type="text/javascript"></script>
<script type="text/javascript" src="content/static/js/hthjin/index_v20.js"></script>
<style>
	#nav{ display:none;}
</style>
</head>
 <script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "棉花工厂页面"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
        				   if(item.adverDistribution.position=='棉花工厂页面大眼睛'){
                          	    $("#Adv_1").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a>");
        				   }
        		   });
         });
         });
</script>
<body>
<!---------------------top-------------------------->
	<jsp:include page="../frontDesk/header.jsp" />
    <jsp:include page="../frontDesk/cate.jsp" />
<!---------------------produtclass-------------------------->

	<div class="produtclass">
    	<div class="right proclas" style="margin-bottom:30px;">
        	<div class="proclas_top" id="Adv_1"></div>
            <div class="mianhua">
            	<div class="conts_prod1" style="margin-left:50px;">
                    <ul>
                       <c:forEach items="${cottonFactoryList}" var="cottonFactory">
                           <a href="productCenter/cottonInfo?factoryId=${cottonFactory.factoryId}"><li>
                                <div class="bg">
                                    <p style="padding-top:30px;">${cottonFactory.factoryName}</p>
                                    <p>电话：${cottonFactory.factoryPhone}</p>
                                </div>
                                <p>地址：${cottonFactory.factoryAddress}</p>
                            </li></a>
                       </c:forEach>
                    </ul>
                </div>
            </div>
   	  </div>
        <div class="cl"></div>
    </div>
<script type="text/javascript">
	function  shopcar(){
		alert("添加购物车成功！");
		}
</script>

	
    
    
<!---------------------conts-------------------------->


    
    
<!---------------------foot-------------------------->

   <jsp:include page="../frontDesk/foot.jsp" />
  <script>
	var div1=document.getElementById("nav");
	
	function f1(){
		div1.style.display="inline";
		}
	function f2(){
		div1.style.display="none";
		}
		
</script>  

</body>
</html>
