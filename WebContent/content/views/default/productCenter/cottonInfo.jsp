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
<link href="content/static/css/main.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style2.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/index.css" rel="stylesheet" type="text/css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slide.js" type="text/javascript"></script>
<script type="text/javascript" src="content/static/js/hthjin/script.js"></script>
<script type="text/javascript">
		$(document).ready(function() {		
        $("#oul").children(this).children($("#oul").children(this)).hover(function(){
	 	var index=$("#oul").children(this).index(this);
		$(this).css("backgroundColor","#EB4642").css("color","#fff");
			},function(){
					$(this).css("backgroundColor","#fff").css("color","#999");
				});
    });
</script>
<script>
window.onload = function(){   
 tabPages({     
    pageMain : 'pageMain',  
	pageNav : 'pageNav',  
	pagePrev: 'prev',  
	pageNext: 'next', 
	curNum: 7,      //每页显示的条数   
   activeClass: 'active',   //高光显示的class       
    ini: 0    //初始化显示的页面  
	  });        
	   function tabPages(tabPages){    
	       var pageMain = document.getElementById(tabPages.pageMain);   //获取内容列表     
		   var pageNav = document.getElementById(tabPages.pageNav);     //获取分页      
		   var pagePrev = document.getElementById(tabPages.pagePrev);   //上一页      
		   var pageNext = document.getElementById(tabPages.pageNext);   //下一页               
	       var curNum = tabPages.curNum;                                //每页显示数     
		   var len = Math.ceil(pageMain.children.length / curNum);      
		    //计算总页数
			var pageList = '';                                          //生成页码     
			 var iNum = 0;                                               //当前的索引值index            
			 for(var i = 0; i < len; i++){         
				 pageList+='<a href="javascript:;">'+ ( i + 1)+'</a>';
			 }      
			pageNav.innerHTML = pageList;            
			pageNav.children[0].className = tabPages.activeClass;        //头一页加高亮显示           
			 for(var i = 0; i < pageNav.children.length; i++){        
					 pageNav.children[i].index = i;           
					 pageNav.children[i].onclick = function(){         							
							  for(var t = 0; t < pageNav.children.length; t++){          
									 pageNav.children[t].className = '';     
							   }          
								  this.className = tabPages.activeClass;          
								  iNum = this.index;    
								 ini(iNum);       
								 };    
				 }                          //下一页   
				 pageNext.onclick = function(){ 
				 if(iNum == len - 1){         
						
						return false;    
				 }else{    
					for(var t = 0; t < pageNav.children.length; t++){
						 pageNav.children[t].className = '';   
					   }      
						  iNum++;   
						 pageNav.children[iNum].className = tabPages.activeClass;  
						 ini(iNum);     
					 }
					  };                 //上一页   
					 pagePrev.onclick = function(){    
					  if(iNum == 0){  
					
					return false;  
					}else{  
					for(var t = 0; t < pageNav.children.length; t++){  
					pageNav.children[t].className = '';   
					 }  
					  iNum--;  
					pageNav.children[iNum].className = tabPages.activeClass;     
					  ini(iNum);  
					 }  
					 };
					 function ini(iNum){   
						 for(var i = 0; i < pageMain.children.length; i++){   
						pageMain.children[i].style.display = 'none';  
					 }    
					  for(var i = 0; i < curNum; i++){ 
						 if(pageMain.children[(iNum * curNum + i)] == undefined){ continue;
						 }  
					  pageMain.children[(iNum * curNum + i)].style.display = 'block';   
						 }     
						  }   
						 ini(iNum);
						}
						};
 </script>
 <script>
$(function(){   
 tabPage({     
    pageMain2 : 'pageMain2',  
	pageNav2 : 'pageNav2',  
	pagePrev2: 'prev2',  
	pageNext2: 'next2', 
	curNum: 7,      //每页显示的条数   
   activeClass: 'active',   //高光显示的class       
    ini: 0    //初始化显示的页面  
	  });        
	   function tabPage(tabPage){    
	       var pageMain2 = document.getElementById(tabPage.pageMain2);   //获取内容列表     
		   var pageNav2 = document.getElementById(tabPage.pageNav2);     //获取分页      
		   var pagePrev2 = document.getElementById(tabPage.pagePrev2);   //上一页      
		   var pageNext2 = document.getElementById(tabPage.pageNext2);   //下一页               
	       var curNum = tabPage.curNum;                                //每页显示数     
		   var len = Math.ceil(pageMain2.children.length /curNum);   
		      //计算总页数   
			var pageList = '';                                          //生成页码     
			 var iNum = 0;                                               //当前的索引值index            
			 for(var i = 0; i < len; i++){         
				 pageList+='<a href="javascript:;">'+ ( i + 1)+'</a>';
			 }      
			pageNav2.innerHTML = pageList;            
			pageNav2.children[0].className = tabPage.activeClass;        //头一页加高亮显示           
			 for(var i = 0; i < pageNav2.children.length; i++){        
					 pageNav2.children[i].index = i;           
					 pageNav2.children[i].onclick = function(){         							
							  for(var t = 0; t < pageNav2.children.length; t++){          
									 pageNav2.children[t].className = '';     
							   }          
								  this.className = tabPage.activeClass;          
								  iNum = this.index;    
								 ini(iNum);       
								 };    
				 }                          //下一页   
				 pageNext2.onclick = function(){ 
				 if(iNum == len - 1){         
						
						return false;    
				 }else{    
					for(var t = 0; t < pageNav2.children.length; t++){
						 pageNav2.children[t].className = '';   
					   }      
						  iNum++;   
						 pageNav2.children[iNum].className = tabPage.activeClass;  
						 ini(iNum);     
					 }
					  };                 //上一页   
					 pagePrev2.onclick = function(){    
					  if(iNum == 0){  
					
					return false;  
					}else{  
					for(var t = 0; t < pageNav2.children.length; t++){  
					pageNav2.children[t].className = '';   
					 }  
					  iNum--;  
					pageNav2.children[iNum].className = tabPage.activeClass;     
					  ini(iNum);  
					 }  
					 };
					 function ini(iNum){   
						 for(var i = 0; i < pageMain2.children.length; i++){   
						pageMain2.children[i].style.display = 'none';  
					 }    
					  for(var i = 0; i < curNum; i++){ 
						 if(pageMain2.children[(iNum * curNum + i)] == undefined){ continue;
						 }  
					  pageMain2.children[(iNum * curNum + i)].style.display = 'block';   
						 }     
						  }   
						 ini(iNum);
						}
						});
 </script>
</head>

<body>
<!---------------------top-------------------------->
	<jsp:include page="../frontDesk/header.jsp" />
	<jsp:include page="../frontDesk/cate.jsp" />
    <div class="produta_til" style="margin-left: 400px;">
    	<div style="width:1200px;" class="bread2">
        	<a href="productCenter/shopIndex">首页 </a> <span> > 棉花</span>
        </div>
    </div>
<!---------------------中间内容------------------------------>
	<script type="text/javascript">
    	$(document).ready(function() {
           $(".nei").children(this).click(function(){
			   var index=$(".nei").children(this).index(this);
			   for(i=0;i<$(".nei").children(this).length;i++){
				   if(index==i){
					   $(".nei").children(this).eq(i).css("backgroundColor","#E8403F");
					   $(".nei").children(this).eq(i).css("color","#fff");
					   }else{
					   $(".nei").children(this).eq(i).css("backgroundColor","#ccc");
					   $(".nei").children(this).eq(i).css("color","#000");
						   }
				   }
			   if(index==0){
				   
				   	$(".pageMain").css("display","block");
					$(".pageMain2").css("display","none");
					$("#pageBox").css("display","block");
					$("#pageBox2").css("display","none");
					$("#left1").css("display","block");
					$("#left2").css("display","none");
				   }else if(index==1){
					   $(".pageMain2").css("display","block");
					   $(".pageMain").css("display","none");
					    $("#pageBox2").css("display","block");
					   $("#pageBox").css("display","none");
					   $("#left1").css("display","none");
						$("#left2").css("display","block");
					   }
			   }); 
        });
    </script>
<div class="mianhua">
	<div class="top1">
    	<span class="p1">${cottonFactory.factoryName}</span>
        <span class="p2">|  联系人:${cottonFactory.linkMan} |  联系电话:${cottonFactory.factoryPhone}</span>
    </div><span class="p1">棉花类型：</span>
    <div class="nei">
        <a class="p3" style="background-color:#E8403D; color:#fff;">手采棉花</a>
        <a class="p3" style="background-color:#ccc; color:#000;">机采棉花</a>
    </div>
    <div class="left" id="left1">
    	<p>手采棉花</p>
        <p>共<span style="color:red">${fn:length(cottonbyHand)}</span>条结果</p>
    </div>
    <div class="left" id="left2" style="display: none">
    	<p>机采棉花</p>
        <p>共<span style="color:red">${fn:length(cottonbyMachine)}</span>条结果</p>
    </div>
    <div class="nav">
            <ul> 
                <li style="width:180px;">批次（ 点击查看批次详情）</li>
                <li>价格类型</li>
                <li>是否公检</li>
                <li>入库时间</li>
                <li>包数</li>
                <li>毛重（吨）</li>
                <li>公重（吨）</li>
                <li style=" width:120px;">参考价（元/吨）</li>
                <li style="width:150px;">储存仓库</li>
                <li>是否售出</li>
            </ul>
        </div>
 
        <div id="pageMain" class="pageMain">    
           <c:forEach items="${cottonbyHand}" var="cotton">
                 <div class="nav1">
                <ul>
                    <li style="width:180px;">${cotton.batch}</li>
                    <li>
                    	<c:if test="${cotton.cottonType == 'jicai'}">机采棉</c:if>
                    	<c:if test="${cotton.cottonType == 'shoucai'}">手采棉</c:if>
                    </li>
                    <c:if test="${cotton.isCheck==false}">
                           <li>未公检</li>
                    </c:if>
                    <c:if test="${cotton.isCheck==true}">
                           <li>已公检</li>
                    </c:if>
                    <li>${cotton.date}</li>
                    <li>${cotton.amount}</li>
                    <li>${cotton.weight}</li>
                    <li>${cotton.netWeight}</li>
                    <li style=" width:120px;">${cotton.price}</li>
                    <li style="width:150px;">${cotton.warehouse}</li>
                    <c:if test="${cotton.isSell==false}">
                         <li>未出售</li>
                    </c:if>
                    <c:if test="${cotton.isSell==true}">
                         <li>已出售</li>
                    </c:if>
                 </ul>
              </div>
           </c:forEach>    
       </div>
			 <div id="pageBox" >
           <span id="prev">上一页</span>
           <div id="pageNav"> </div>
           <span id="next">下一页</span>
    </div>
  

 <div id="pageMain2" style="display:none;" class="pageMain2">        
       <c:forEach items="${cottonbyMachine}" var="cotton">
                 <div class="nav1">
                <ul>
                    <li style="width:180px;">${cotton.batch}</li>
                    <li>
                    	<c:if test="${cotton.cottonType == 'jicai'}">机采棉</c:if>
                    	<c:if test="${cotton.cottonType == 'shoucai'}">手采棉</c:if>
                    </li>
                    <c:if test="${cotton.isCheck==false}">
                           <li>未公检</li>
                    </c:if>
                    <c:if test="${cotton.isCheck==true}">
                           <li>已公检</li>
                    </c:if>
                    <li>${cotton.date}</li>
                    <li>${cotton.amount}</li>
                    <li>${cotton.weight}</li>
                    <li>${cotton.netWeight}</li>
                    <li style=" width:120px;">${cotton.price}</li>
                    <li style="width:150px;">${cotton.warehouse}</li>
                    <c:if test="${cotton.isSell==false}">
                         <li>未出售</li>
                    </c:if>
                    <c:if test="${cotton.isSell==true}">
                         <li>已出售</li>
                    </c:if>
                 </ul>
              </div>
           </c:forEach>  
   </div>
    <div id="pageBox2" style="display:none;">
           <span id="prev2">上一页</span>
           <div id="pageNav2"> </div>
           <span id="next2">下一页</span>
    </div>

    
            
</div>
<!---------------------foot-------------------------->

   <jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
