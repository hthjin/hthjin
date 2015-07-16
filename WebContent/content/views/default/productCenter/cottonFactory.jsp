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
	<div class="top_ban">
    	<div class="centers">
                <div class="main">
                    <ul style="margin-left:200px;">
                        <a href="password.html"><li>会员中心</li></a>
                        <a href="my_shop1.html"><li>我的订单</li></a>
                    </ul>
              </div> 
              <div class="ctt" style="width:140px; height:25px; float:right;  margin-top:-25px;">
                    <a href="login.html"><span style=" line-height:25px; color:#FE0002;">[登陆]</span></a>
                    <a href="register.html"><span style=" line-height:25px; color:#FE0002; ">[注册]</span></a>
              </div>
        </div>
    </div>
	<div class="top_head">
    	<div class="main">
        	<div class="left">
   		    	<a href="shop.html"><img src="content/static/images/logo.png" /></a>
            </div>
            <div class="right">            
       	    	<div class="left">
                	<dl>
               	  		<dt><input name="" type="text"  placeholder="小黄米" style="color:#999;"/><a href="produtclass.html">搜索</a></dt>
                        <dd>热门搜索：</dd>
                         <dd><a class="red" href="produtclass.html">干果</a></dd>
                        <dd><a href="produtclass.html">粮油</a></dd>
                        <dd><a href="produtclass.html">小黄米</a></dd>
                        <dd><a href="produtclass.html">液晶电视</a></dd>
                    </dl>
                </div>
                <img class="right" src="content/static/images/tou.jpg" height="60" />
            </div>
            <div class="cl"></div>
      </div>
    </div>
	<div class="top_nav">
    	<div class="main">
        	<div class="left">
           	  <ul>
              	<li id="til" class="yel"  onmouseover="f1()"><a href="produtclassall.html">全部分类</a>
                <div id="nav" onmouseout="f2()">
                <div class="category-content" id="guide_2" >
                <div class="category" >
                <div class="zi" align="center">全部商品分类</div>
                <ul class="category-list" id="js_climit_li">
                  <li class="appliance js_toggle relative first" >      
                    <div class="category-info list-nz" style="border:0px green solid;" >
                        <c:forEach items="${cateList}" var="cate">
                                <c:if test="${cate.categoryID== 1}">
                                      <h3 class="category-name b-category-name"><a id="s-category-289" href="productCenter/cottonFactory?cottonType=-1" target="_blank" class="ml-22" >${cate.category }</a></h3>
                                      <p class="c-category-list limit-24">
                                      <c:forEach var="cate1" items="${cate.children}">
                                                 <a href="productCenter/cottonFactory?cottonType=${cate1.categoryID}" target="_blank">${cate1.category }</a> 
                                      </c:forEach>
                                      </p>
                                </c:if>
                        </c:forEach>
                    </div>
                    <hr/>
                  </li> 
                  <li class="appliance js_toggle relative first" >
                    <div class="category-info list-nz" >
                         <c:forEach items="${cateList}" var="cate">
                                <c:if test="${cate.categoryID== 2}">
                                      <h3 class="category-name b-category-name"><a id="s-category-289" href="javascript:void(0)" target="_blank" class="ml-22" >${cate.category }</a></h3>
                                      <p class="c-category-list limit-24">
                                      <c:forEach var="cate1" items="${cate.children}">
                                                 <a href="javascript:void(0)" target="_blank">${cate1.category }</a> 
                                      </c:forEach>
                                      </p>
                                </c:if>
                        </c:forEach>
                   </div>
                  <hr/>
                  </li> 
                  <li class="appliance js_toggle relative first">
                    <div class="category-info list-nz" >
                           <c:forEach items="${cateList}" var="cate">
                                <c:if test="${cate.categoryID== 3}">
                                      <h3 class="category-name b-category-name"><a id="s-category-289" href="javascript:void(0)" target="_blank" class="ml-22" >${cate.category }</a></h3>
                                      <p class="c-category-list limit-24">
                                      <c:forEach var="cate1" items="${cate.children}">
                                                 <a href="javascript:void(0)" target="_blank">${cate1.category }</a> 
                                      </c:forEach>
                                      </p>
                                </c:if>
                        </c:forEach>
                    </div>
                    <hr/>
                  </li>
                  <li class="appliance js_toggle relative first">
                    <div class="category-info list-nz" >
                            <c:forEach items="${cateList}" var="cate">
                                <c:if test="${cate.categoryID== 4}">
                                      <h3 class="category-name b-category-name"><a id="s-category-289" href="javascript:void(0)" target="_blank" class="ml-22" >${cate.category }</a></h3>
                                      <p class="c-category-list limit-24">
                                      <c:forEach var="cate1" items="${cate.children}">
                                                 <a href="javascript:void(0)" target="_blank">${cate1.category }</a> 
                                      </c:forEach>
                                      </p>
                                </c:if>
                        </c:forEach>
                     </div>
                      <hr/>
                  </li>
                </ul>
<!--                 <img src="content/static/images/b1.png" width="200" /> -->
                </div>
                </div>
                </div>
               </li>
                <li style=" margin-left:150px;"><a href="productCenter/shopIndex">首页</a></li>
                <li><a href="productCenter/cottonFactory?cottonType=-1">棉花</a></li>
                <li><a href="nong.html">农副产品</a></li>
                <li><a href="jia.html">家电百货</a></li>
                <li><a href="liang.html">粮食</a></li>
                
              </ul>
            </div>
            <div class="right">            
           	  <a href="shop-car.html" class="shop_car"></a>
          	</div>
            <div class="cl"></div>
      	</div>
	</div>
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
<div class="footer">
	<div class="box">
    	<div class="box_class1">
        	<div class="xins">
            	<ul>
                	<a href="about.html"><li style="padding-left:5px;">关于我们</li></a>
                    <a href="wuliu.html"><li>运输服务</li></a>
                    <a href="lianxi.html"><li>联系我们</li></a>
                    <a href="ditu.html"><li style="border-right:none; padding-right:5px;">网站地图</li></a>
                </ul>
            </div>
            <div class="lianjie">
            	<span style="color:#;">友情链接 :</span>
                <a href="http://www.cncexj.com/">新疆监管棉花网</a>
                <a href="http://www.ccqsc.gov.cn/">中国棉花公证检验</a>
                <a href="http://www.88086609.cn/">全国棉花交易市场</a>
                <a href="http://www.china-50.com/">中国纺织网</a>
            </div>
            <div class="copy">Copyright ©2015 乌鲁木齐市信息科技有限公司</div>
        </div>
        <div class="box_class2">
        	<p class="p1" style="margin-top:45px;">联系我们： <span> 400-000-0000</span></p>
            <p class="p1">客服热线 ：<span> 0991-584944</span></p>
            <p class="p1">传 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：<span style="margin-left:30px;">0991-58945</span></p>
        </div>
        <div class="box_class3">
        	<p>关注微信号：</p>
            <img src="images/erwei.jpg" />
        </div>
    </div>
</div>
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
