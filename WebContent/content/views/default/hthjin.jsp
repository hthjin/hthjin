<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
<title>华腾汇金</title> 
<link rel="stylesheet" type="text/css" href="content/static/css/style.css"/>
<script src="content/static/js/tumbler/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="content/static/js/tumbler/jquery.SuperSlide.2.1.1.js"></script>
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
</head>

<body>
<!--头部开始-->
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
<!--头部结束-->
 <!--banner开始-->
 <script type="text/javascript">
$(document).ready(function(){

	$(".prev,.next").hover(function(){
		$(this).stop(true,false).fadeTo("show",0.9);
	},function(){
		$(this).stop(true,false).fadeTo("show",0.4);
	});
	
	$(".banner-box").slide({
		titCell:".hd ul",
		mainCell:".bd ul",
		effect:"fold",
		interTime:3500,
		delayTime:500,
		autoPlay:true,
		autoPage:true, 
		trigger:"click" 
	});

});
</script>
    <div class="banner">
    		<div class="banner-box">
	<div class="bd">
        <ul>          	    
            <li style="background:#F3E5D8;">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="content/static/images/banner.jpg" /></a>
                </div>
            </li>
            <li style="background:#B01415">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="content/static/images/banner2.jpg" /></a>
                </div>
            </li>
            <li style="background:#C49803;">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="content/static/images/banner3.jpg" /></a>
                </div>
            </li>
            <li style="background:#FDFDF5">
                <div class="m-width">
                <a href="javascript:void(0);"><img src="content/static/images/banner4.jpg" /></a>
                </div>
            </li>  
         
        </ul>
    </div>
    <div class="banner-btn">
        <a class="prev" href="javascript:void(0);"></a>
        <a class="next" href="javascript:void(0);"></a>
        <div class="hd"><ul></ul></div>
    </div>
</div>
   		
    <div class="box">
        	<div class=" box_top"></div>
             <span>综合性仓储物流企业</span>
        	 <p>专业铁路、公路综合性仓储物流企业  打造南北疆第一大铁路物流基地。计划建设以棉花、农副产品贸易、大宗商品、仓储物流为集散功能的铁路专用线及大宗商品电商物流基地.</p>
        </div>
    </div>
    <!--banner结束-->
<div class="center1">
	<div class="box">
    	<div class="zi">产品中心</div>
   		<ul id="oul">
        	<a href="mianhua.html"><li style="margin-left:46px;"><div class="img1"></div><p>棉花</p></li></a>
            <a href="nong.html"><li><div class="img2"></div><p>农副产品</p></li></a>
            <a href="jia.html"><li><div class="img3"></div><p>家电百货</p></li></a>
            <a href="liang.html"><li><div class="img4"></div><p>粮食</p></li></a>
            <a href="productCenter/shopIndex"><li><div class="img5"></div><p>产品中心>></p></li></a>
        </ul>
    </div>
</div>
<script>
	$(document).ready(function() {
       $(".li1").hover(function(){
		$(".bb1").css("display","block");
		},function(){
			$(".bb1").css("display","none");
			});
			
		$(".li2").hover(function(){
		$(".bb2").css("display","block");
		},function(){
			$(".bb2").css("display","none");
			}); 
			
		$(".li3").hover(function(){
		$(".bb3").css("display","block");
		},function(){
			$(".bb3").css("display","none");
			});  
    });
	
</script>

<div class="center2">
	<div class="box">
    	<div class="zi">运输服务</div>
        <ul>
        	<li class="li1">
            	<a href="wuliu.html"><div class="aa">
                    <img src="content/static/images/yun1.jpg"/>
                    <div class="jie">
                        <div class="top1">铁路公路双线</div>
                        <p>企业简介：我公司是一家专业从事以铁路物流为主，公路物流为辅，集生产加工为一体的综合性仓储物流企业</p>
                    </div>
                </div></a>
                <div class="bb1" style="display:none;"></div>
            </li>
           
          <li class="li2" >
          		<a href="wuliu.html"><div class="aa">
                    <img src="content/static/images/yun2.jpg" />
                    <div class="jie">
                        <div class="top1">全方位全天候</div>
                        <p>按照客户的要求有效利用物流设施和网络资源，制定合理、全方位、全天候的物流配送服务</p>
                    </div>
                </div></a>
                <div class="bb2" style="display:none;"></div>
            </li>
            
           <li class="li3">
           		<a href="wuliu.html"><div class="aa">
                    <img src="content/static/images/yun3.jpg" />
                    <div class="jie">
                        <div class="top1">综合性仓储物流</div>
                        <p>当前企业的发展目标：打造南北疆第一大铁路物流基地。计划建设以棉花、农副产品贸易、大宗商品、仓储物流为集散...</p>
                    </div>
                </div></a>
                <div class="bb3" style="display:none;"></div>
            </li>
        </ul>
    </div>
</div>
<div class="center3">
	<div class="box">
    	<div class="title">
        	<img src="content/static/images/img_r.png" />
            <div class="wenhua">
            	<p class="p1">Corporate culture</p>
                <p class="p2">企业文化</p>
            </div>
        </div>
        <img src="content/static/images/c4.jpg" />
        <div class="right">
        	<ul>            	
                <li>
                	<span>诚 |</span>
                    <p>华腾公司秉承“优质服务，客户至上”的服务宗旨</p>
                </li>
                <li>
                	<span>信 |</span>
                    <p style= "margin-left:0px;">树立“安全快捷，诚信服务”的经营理念</p>
                </li>
                <li>
                	<span>创 |</span>
                    <p>坚持“不断创新，追求卓越”的价值观</p>
                </li>
                <li>
                	<span>新 |</span>
                    <p>立足新疆知名企业行列，以优质、用心的服务走向</p>
                </li>
            </ul>
            <p>本真为诚，源自使命，始于责任，方能惠及百姓，泽被天下</p>
            <p>践诺为信，坦荡无私，志存高远，方能一诺千金，八方纵驰</p>
            <p>开先为创，百折不挠，自强不息，方能与时俱进，引领风骚</p>
            <p>摒旧为新，励精图治，厚积薄发，方能提纯复壮，玉汝于成</p>
        </div>
    </div>
</div>
<div class="center4">
	<div class="box">
    	<div class="left">
            <div class="title">
                <img src="content/static/images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Corporate strategy</p>
                    <p class="p2">公司战略</p>
                </div>
       		</div>
            <img src="content/static/images/c5.jpg" />
            <p>近年来，公司的棉花加工、仓储、化纤、物流行业等得到了长足发展，我们将不断优化经济结构，加快构建现代化产业体系，不断增强自主创新能力，研发具有自主知识产权的品牌，不断培育企业文化精神，争当推进新疆经济跨越式发展和社会长治久安的排头兵。我们坚信，经过我们的不断努力和追求，一定可以完成企业与社会的互利共赢。</p>
        </div>
    	<div class="right">
        	<div class="title">
                <img src="content/static/images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Announcement notice</p>
                    <p class="p2">公告通知</p>
                </div>
       		 </div>
            <div class="box">
            	<ul id="newlog">
                	<a href="news.html"><li><span>1.</span> 专业铁路、公路综合性仓储物流企业...</li></a>
                    <a href="news.html"><li><span>2.</span> 设施和网络资源  制定合作物流配送服...</li></a>
                    <a href="news.html"><li><span>3.</span> 公路物流基地计划物流配送服务企业的...</li>
                    <a href="news.html"><li><span>4.</span> 打造南北疆第一铁路物流铁路物流基地...</li></a>
                    <a href="news.html"><li><span>5.</span> 企业的发展铁路物流基地计划建设...</li></a>
                    <a href="news.html"><li><span>6.</span> 集生产加工  农副产品贸易大宗商品...</li></a>
                    <a href="news.html"><li><span>7.</span> 打造南北疆第一铁路物流配送服务企业...</li></a>
                    <a href="news.html"><li><span>8.</span> 铁路物流基地计划建设物流基地计划...</li></a>
                    <a href="news.html"><li><span>9.</span> 物流配送服务企业的发展物流配送服务...</li></a>
                    <a href="news.html"><li><span>10.</span> 公路物流为辅  集生产加工基地计划...</li></a>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="center5">
	<div class="box">
    	<div class="left">
        	<div class="title">
                <img src="content/static/images/img_r.png" />
                <div class="wenhua">
                    <p class="p1">Company profile</p>
                    <p class="p2">公司简介</p>
                </div>
       		 </div>
            <p>我公司是一家专业从事以铁路物流为主，公路物流为辅，集生产加工为一体的综合性仓储物流企业。</p>
            <p>按照客户的要求有效利用物流设施和网络资源，制定合理、全方位、全天候的物流配送服务。当前企业的发展目标：打造南北疆第一大铁路物流基地。计划建设以棉花、农副产品贸易、大宗商品、仓储物流为集散...<a href="jianjie.html" style="margin-left:40px;">[全部]</a></p>
            
        </div>
    	<img src="content/static/images/c6.png" />
    </div>
</div>
<jsp:include page="frontDesk/foot.jsp" />
</body>
</html>
