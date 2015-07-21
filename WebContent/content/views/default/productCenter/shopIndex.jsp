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
<title>华腾汇金产品中心</title>
<link href="content/static/css/style2.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="content/static/css/index.css" rel="stylesheet" type="text/css" />
<script src="content/static/js/hthjin/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/js.js" type="text/javascript"></script>
<script src="content/static/js/hthjin/slide.js" type="text/javascript"></script>
<script type="text/javascript" src="content/static/js/hthjin/script.js"></script>

</head>
<script type="text/javascript">
         $(function(){
        	 $.getJSON(
        		  "toJsonFmatUtil/getAdvertisement",
        		  {
        			  whichPage: "产品中心"
        		   }, function(json) {
        			   $.each(json.advertisementList, function(i,item){
        				   //  alert(item.id);	//id
//         				   alert(item.imagePath);//宣传图片
//         				   alert(item.link);//链接
//         				   alert(item.adverDistribution.position);//广告所在位置
        				   if(item.adverDistribution.position=='产品中心大眼睛'){
                       	    $("#Adv_1").append("<div class=\"kv_item\"><a href=\""+item.link+"\"><img src=\""+item.imagePath+"\"/></a></div>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A1'){
                      	     $("#Adv_2").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A2'){
                      	     $("#Adv_3").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A3'){
                      	     $("#Adv_4").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A4'){
                      	     $("#Adv_5").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A5'){
                      	     $("#Adv_6").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A6'){
                      	     $("#Adv_7").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"292\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A7'){
                      	     $("#Adv_8").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"291\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A8'){
                      	     $("#Adv_9").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"291	\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品中心推荐A9'){
                      	     $("#Adv_10").append("<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"291\" height=\"159\" /></a>");
        				   }else if(item.adverDistribution.position=='产品推荐'){
                      	     $("#text1").append( "<a href=\""+item.link+"\"><li><img src=\""+item.imagePath+"\"/></li></a>");
        				   }else if(item.adverDistribution.position=='采购专区'){
                      	     $("#text2").append( "<a href=\""+item.link+"\"><li><img src=\""+item.imagePath+"\"/></li></a>");
        				   }else if(item.adverDistribution.position=='采购专区'){
                      	     $("#Adv_11").append( "<a href=\""+item.link+"\"><img src=\""+item.imagePath+"\" width=\"240px\" height=\"110px\" /></a>");
        				   }
        			   });//动态生成广告
        			   var $kv = jQuery('.js_nf_hp_kv')
        				var $kv_window = $kv.find('.js_window');
        				var $kv_items = $kv.find('.kv_item');
        				var $kv_nav = $kv.find('.js_nav');
        				var $kv_prev = $kv.find('.js_btn_prev');
        				var $kv_next = $kv.find('.js_btn_next');
        				var kv_items_count = $kv_items.length;
        				
        				var $ts = jQuery('.js_nf_hp_teaser_c3x')
        				var $ts_groups = $ts.find('.js_t_group');
        				var animate_dur = 500;
        				var play_dur = 2000;
        				var stop_flag = false;
        				
        				var $window = jQuery(window);
        				
        				var cur_idx = 0;
        				
        				

        						
        				$kv_items.hide();
        				$ts_groups.find('.t_item').hide();
        				var goto = function( idx ){
        					cur_idx = idx;
        					
        					//idx from 0
        					var $kv_visible = $kv_items.filter(':visible');
        					if ( $kv_visible.length ){
        						$kv_visible.fadeOut(animate_dur);
        						$kv_items.eq(idx).fadeIn(animate_dur);
        					}else{
        						$kv_items.eq(idx).show();
        					}
        				
        					$ts_groups.each(function(g_idx){
        						var $ts_group = jQuery(this);
        						var $ts_items = $ts_group.find('.t_item');
        						var $ts_visible = $ts_items.filter(':visible');

        						if ( $ts_visible.length ){
        							$ts_visible.css({'z-index':99});
        							
        							window.setTimeout(function(){
        								$ts_items.eq(idx).css({'top':'158px','z-index':100}).show().animate({'top':0},animate_dur,function(){
        									$ts_visible.hide();
        								});
        							}, 80*g_idx );
        							
        						}else{
        							$ts_items.eq(idx).show();
        						}
        					});
        					
        					$kv_nav.find('li').eq(idx).addClass('active').siblings().removeClass('active');
        					
        				}
        				
        				//init $kv_prev $kv_next
        				$kv_prev.click(function(){
        					var next_idx = cur_idx - 1;
        					if ( next_idx < 0 ){
        						next_idx = kv_items_count - 1;
        					}
        					goto( next_idx );
        				});

        				$kv_next.click(function(){
        					var next_idx = cur_idx + 1;
        					if ( next_idx >= kv_items_count ){
        						next_idx = 0;
        					}
        					goto( next_idx );
        				});		
        				
        				//init $nav
        				for ( var i=0; i<kv_items_count; i++ ){
        					var $li = jQuery('<li><a href="javascript:;">'+ ( i+1 ) +'</a></li>');
        					
        					(function(){
        						var cur_idx = i;
        						$li.click(function(){
        							goto(cur_idx);
        						});
        					})();
        					
        					$kv_nav.append($li);
        				}
        				$kv_nav.css('margin-left',-(kv_items_count*10));
        				
        				//init kv_item
        				$kv_items.each(function(){
        					var $this_kv_item = jQuery(this);
        					var this_bg = $this_kv_item.data('bg');
        					$this_kv_item.css('background-image','url('+this_bg+')');
        				});
        				
        				//init btn_nav
        				var repos_btn_nav = function(){
        					var offset = $kv.offset();
        				}
        				$window.resize(function(){
        					repos_btn_nav();
        				});
        				


        				$kv.hover(function(){
        					stop_flag = true;
        				},function(){
        					stop_flag = false;
        				});

        				$ts.hover(function(){
        					stop_flag = true;
        				},function(){
        					stop_flag = false;
        				});	
        				
        				window.setInterval(function(){
        					if ( !stop_flag ){
        						$kv_next.click();
        					}
        				},play_dur);
        				
        				
        				
        				repos_btn_nav();
        				goto(cur_idx);
        			   
        		   });
         });
 </script>
<body>
<!---------------------top-------------------------->
<jsp:include page="../frontDesk/header.jsp" />
<jsp:include page="../frontDesk/cate.jsp" />
<!---------------------banner_img-------------------------->

    <div class="banner_img">
    	<div align="left">
                <div class="main_content">

	<div class="nf_hp_kv  js_nf_hp_kv">
		<div class="window js_window"  id="Adv_1">
		</div>
		<ul class="nav js_nav"></ul>
		<div class="btn_prev js_btn_prev"><a href="javascript:;">Prev</a></div>
		<div class="btn_next js_btn_next"><a href="javascript:;">Next</a></div>
	</div>
	
	<div class="nf_hp_teaser_c3x js_nf_hp_teaser_c3x">
		<div class="t_l js_t_group">
			<div class="t_item" id="Adv_2"></div>
			<div class="t_item" id="Adv_3"></div>
			<div class="t_item" id="Adv_4"></div>
		</div>
		<div class="t_m js_t_group">
			<div class="t_item" id="Adv_5"></div>
			<div class="t_item" id="Adv_6"></div>
			<div class="t_item" id="Adv_7"></div>
		</div>
		<div class="t_r js_t_group">
			<div class="t_item" id="Adv_8"></div>
			<div class="t_item" id="Adv_9"></div>
			<div class="t_item" id="Adv_10"></div>
		</div>
	</div>
</div>
              </div>
    </div>
<!---------------------notice-------------------------->

<!---------------------layout_main-------------------------->
	<script type="text/javascript">
    	$(document).ready(function() {
           $("#cata_til").children(this).click(function(){
			   var index=$("#cata_til").children(this).index(this);
			   for(i=0;i<$("#cata_til").children(this).length;i++){
				   if(index==i){
					   $("#cata_til").children(this).eq(i).css("backgroundColor","#E8403F");
					   $("#cata_til").children(this).eq(i).children( $("#cata_til").children(this).eq(i)).css("color","#fff");
					   }else{
					   $("#cata_til").children(this).eq(i).css("backgroundColor","#fff");
					   $("#cata_til").children(this).eq(i).children( $("#cata_til").children(this).eq(i)).css("color","#9999B2");
						   }
				   }
			   if(index==0){
				   	$("#text1").css("display","block");
					$("#text2").css("display","none");
				   }else if(index==1){
					   $("#text2").css("display","block");
					   $("#text1").css("display","none");
					   }
			   }); 
        });
    </script>
	<div class="layout_main">
    	<div class="left">
        	<div class="cata">
            	<ul class="cata_til" id="cata_til">
                	<li class="cata_til_onck" style="background-color:#e8403f; color:#fff;"><a style="color:#fff;">产品推荐</a></li>
                    <li class="cata_til_onck" ><a >采购专区</a></li>
                </ul>
            	<ul class="cata_til1" id="text1">
                </ul>
                <ul class="cata_til1" id="text2" style="display:none">
                </ul>
            </div>
        </div>
    	<div class="right" style="float:right;">
        	<div class="news">
            	<ul class="news_til">
                	<li class="news_til_onck">最新公告</li>
                </ul>
              	<ul class="news_prod" style="display:block;">
              	   <c:forEach items="${newsList }" var="news">
						<c:if test="${loop < 6}">
							<li><a href="${ns.activityUrl }">${ns.title }</a></li>
							<c:set var="loop" value="${loop +1 }"></c:set>
						</c:if>
					</c:forEach>
                </ul>
            </div>
            <div style=" " id="Adv_11">
<!--             	<img src="images/b2.png" width="240px" height="110px"/> -->
            </div>
        </div>
        <div class="cl"></div>
    </div>
    
    
<!---------------------conts-------------------------->

	<div class="conts" id="mianhua">    
    	<div class="conts_til">
        	<ul>
            	<li class="conts_til_onck"><a style=" background-color:#E8403F">棉花</a></li> 
            </ul>
            <p><a href="productCenter/cottonFactory?cottonType=-1" class="conts_til_all"><img src="content/static/images/conts_til_all.jpg" width="112" height="26" /></a></p>
        </div>
        <div class="conts_prod1" style="display:block;">
        	<ul>
        	   <c:forEach items="${cottonFactoryList}" var="cottonFactory" begin="0"  end="7">
        	        <a href="productCenter/cottonInfo?factoryId=${cottonFactory.factoryId}">
        	        <li>
                	<div class="bg">
                    	<p style="padding-top:30px;">${cottonFactory.factoryName}</p>
                        <p>电话：${cottonFactory.factoryPhone}</p>
                    </div>
                     <p>地址：${cottonFactory.factoryAddress}</p>
                   </li>
                   </a>
        	   </c:forEach>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
    
    <div class="conts" id="nong">    
    	<div class="conts_til">
        	<ul>
            	<li class="conts_til_onck"><a style=" background-color:#3CB38D">农副产品</a></li> 
            </ul>
            <p><a href="produtclass.html" class="conts_til_all"><img src="content/static/images/conts_til_all.jpg" width="112" height="26" /></a></p>
        </div>
        <div class="conts_prod">
        	<ul>
               <c:forEach items="${tillerShops}" var="tillerShop">
            	<li><a href="javascript:void(0)"><p class="conts_prod_img"><img src="${tillerShop.shopCommImages[0].imagePath}" /></p><p>${tillerShop.commoidtyName}</p><p class="red">${tillerShop.unitPrice}元</p></a>
                <a href="javascript:void(0)"><p>${tillerShop.belongTo.shopName}</p></a></li>
               </c:forEach>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
    
    <div class="conts" id="jia">    
    	<div class="conts_til">
        	<ul>
            	<li class="conts_til_onck"><a style=" background-color:#42A9F6">家电百货</a></li> 
            </ul>
            <p><a href="produtclass.html" class="conts_til_all"><img src="content/static/images/conts_til_all.jpg" width="112" height="26" /></a></p>
        </div>
        <div class="conts_prod" style="display:block;">
        	<ul>
               <c:forEach items="${appliancesShops}" var="appliancesShop">
            	<li><a href="javascript:void(0)"><p class="conts_prod_img"><img src="${appliancesShop.shopCommImages[0].imagePath}" /></p><p>${appliancesShop.commoidtyName}</p><p class="red">${appliancesShop.unitPrice}元</p></a>
                <a href="javascript:void(0)"><p>${appliancesShop.belongTo.shopName}</p></a></li>
               </c:forEach>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
    <div class="conts" id="liang">    
    	<div class="conts_til">
        	<ul>
            	<li class="conts_til_onck"><a style=" background-color:#D06716">粮食</a></li> 
            </ul>
            <p><a href="produtclass.html" class="conts_til_all"><img src="content/static/images/conts_til_all.jpg" width="112" height="26" /></a></p>
        </div>
        <div class="conts_prod" style="display:block;">
        	<ul>
        	    <c:forEach items="${foodShops}" var="foodShop">
            	<li><a href="produtall.html"><p class="conts_prod_img"><img src="${foodShop.shopCommImages[0].imagePath}" /></p><p>${foodShop.commoidtyName}</p><p class="red">${foodShop.unitPrice}元/500g </p></a>
                <a href="indiv_shop.html"><p>${foodShop.belongTo.shopName}</p></a></li>
               </c:forEach>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
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
    <div class="top">
        <div class="yi">意见反馈</div>
        <a href="shop.html"><img src="content/static/images/top.png" /></a>
    </div>
    <div class="liulan" style="display:none;">
    	<p>*请描述你的意见:</p>
        <textarea></textarea>        
        <form>
        	<p>*您对我们的整体满意度如何？</p>
        	<input type="radio" name="yi" />非常满意<br />
            <input type="radio" name="yi" />满意<br />
            <input type="radio" name="yi" />一般<br />
            <input type="radio" name="yi" />不满意<br />
            <input type="radio" name="yi" />非常不满意<br />
           
        </form>
        <hr />
        <div class="dd">
         &nbsp;姓名：<input type="text" /><br />
         *电话：<input type="tel"  />
         </div>
        <button class="tijiao">提 交</button>
        <a class="butijiao">暂不提交</a>
    </div>
    <script type="text/javascript">
    	$(document).ready(function() {
            $(".yi").click(function(){
					$(".liulan").css("display","block");
				});
			 $(".tijiao").click(function(){
					$(".liulan").css("display","none");
				});
			 $(".butijiao").click(function(){
					$(".liulan").css("display","none");
				});
        });
    </script>
</body>
</html>
