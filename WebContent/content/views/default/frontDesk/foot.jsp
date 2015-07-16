<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="foot">
	<div class="center" >
    	<div class="center_top" >
        	<ul>
            	<li>
                	<img src="content/static/images/footer1.jpg" />
                    <div class="center_zi">
                    <div class="bigzi">100%</div>
                    <div class="smallzi">全球正品</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer2.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">24小时内送达</div>
                    <div class="smallzi">承诺24小时之内准时送达</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer3.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">消费者保护</div>
                    <div class="smallzi">联合打假 保护隐私</div>
                    </div>
                </li>
                <li>
                	<img src="content/static/images/footer4.jpg" />
                     <div class="center_zi">
                    <div class="bigzi">真伪鉴别</div>
                    <div class="smallzi">真伪鉴别</div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="center_left">
        	<a href="#"><img src="content/static/images/logo.png" /></a>
      		<div class="center_left_zi">
        		<div class="center_left_zi1">客服电话：4008-888-888</div>
            	<div class="center_left_zi2">周一至周日9:00-20:00</div>
            </div>
        </div>
        <div class="center_center">
            <div class="center_center_big">
            <dl>
            	<dt><a  href="#">关于我们</a></dt>
                <dd><a  href="#">公司简介</a></dd>
                <dd><a  href="#">战略合作</a></dd>
                <dd><a  href="#">雨岑基地</a></dd>
                <dd><a  href="#">媒体报道</a></dd>
             </dl>
             <dl>
                <dt><a  href="#">配送须知</a></dt>
                <dd><a  href="#">配送范围及时</a></dd>
                <dd><a  href="#">配送运费</a></dd>
                <dd><a  href="#">运输包装说明</a></dd>
                <dd><a  href="#">发票制度</a></dd>
                </dl>
             <dl> 
                <dt><a  href="#">客户服务</a></dt>
                <dd><a  href="#">退换货流程</a></dd>
                <dd><a  href="#">退款说明</a></dd>
                <dd><a  href="#">正品保障</a></dd>
                <dd><a  href="#">投诉建议</a></dd>
                 </dl>
             <dl>
                <dt><a  href="#">隐私条款</a></dt>
                <dd><a  href="#">货到付款</a></dd>
                <dd><a  href="#">在线支付</a></dd>
               <dd><a  href="#"> 优惠券</a></dd>
                <dd><a  href="#">礼品卡</a></dd>
            </dl>
            </div>
        </div>
        <div class="center_right">
        	<div class="center_right_left">
            <p>关注不倒翁酒网</p>
            <img src="content/static/images/erwerma1.jpg">
            </div>
            <div class="center_right_right">
            <p>下载不倒翁APP</p>
            <img src="content/static/images/erweima2.jpg">
            </div>
        </div>
    </div>
<div class="copy">Copyright © 2015 乌鲁木齐市雨岑信息科技有限公司   联系电话：4008-888-888  联系我们.隐私声明.媒体报道.消费者保护.真伪鉴别</div>
</div>
<script>
var bool=true;
 function cardiv(){
	var t=$(".jcsdiv").offset().top;
	var sTop=document.body.scrollTop+document.documentElement.scrollTop;
	
	 if(t==sTop){
		 $(".jcsdiv").animate(
				{width:290},100).css("transition","all 0.5s").css("top","100px").css("right","-300px");
				bool=true;
		 }
	 if(bool){
	 bool=false;
	 $("#cardiv").css("transition","all 0.5s").css("right","0px");
	 $(".sidebar").css("transition","all 0.5s").css("right","300px");
	 $("#menu_l").css("transition","all 0.5s").css("right","290px");
		 }else{ 
	 bool=true;
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","9px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
			 }
	 }
	 /*鼠标脱离当前div*/
	 	   $(document).on('click', function(event){
                var $this = $(event.target),
                    $parent = $this.closest('.sidebar'),
                    isSearch = $parent.length == 0 || $this.hasClass('sidebar');
                if(isSearch){
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","9px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
                }
            });
</script>
<!--右侧购物车-->
<div class="sidebar">
	<div class="car" onClick="cardiv()" >
    	<a href="#"></a>
    </div>
   <div class="bar" onClick="bardiv()" >
   </div>
   <div class="cs">
   </div>
   <script>
   var bools=false;
   		function bardiv(){
			var t=$(".jcsdiv").offset().top;	
	var sTop=document.body.scrollTop+document.documentElement.scrollTop;
	 if($(".jcsdiv").offset().top>sTop){
			$(".jcsdiv").css("z-index","2");
			$(".gwcdiv").css("z-index","1");
			$(".jcsdiv").animate(
				{width:290},100).css("transition","all 0.5s").css("top","0px").css("right","0px");
				bools=true;
		 		}
	 if(bools){
	 $("#cardiv").css("transition","all 0.5s").css("right","0px");
	 $(".sidebar").css("transition","all 0.5s").css("right","300px");
	 $("#menu_l").css("transition","all 0.5s").css("right","290px");
	 bools=false;
		 }else{ 
	 bools=true;
	 $("#cardiv").css("transition","all 0.5s").css("right","-290px");
	 $(".sidebar").css("transition","all 0.5s").css("right","9px");
	 $("#menu_l").css("transition","all 0.5s").css("right","0px");
			 }
			}
   </script>
   <div  id="cardiv" class="cardiv" style="height:100%; width:290px;  float:right; position:fixed;  right:0; z-index:0; top:0; right:-305px; background-color:#901531" >
    <div class="gwcdiv" style="background-color:#ccc; width:290px; position:absolute; z-index:0;  margin-left:10px; margin-top:0px; height:100%; display:block;" >
            <div style="width:100%; height:100%; position:absolute; top:0px; left:0px;  background-color:#f1f1f1">
            	<!--购物车列表-->
            		<div>
                    	<ul style="height:30px; margin-left:15px; ">
                        	<li style="line-height:30px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:4px; font-size:12px;"><span style=" margin-top:0px; margin-left:2px;" >全选</span><span style=" margin-left:140px; font-size:14px; margin-top:4px;"><a >全屏查看&gt;</a></span></li>
                        </ul>
                        <hr style="width:240px; margin-top:0px; border:1px solid ; border-bottom:none; "/>
                    	<ul style="height:80px; margin-top:-5px;  margin-left:15px; ">
                        	<li style="line-height:80px;float:left; " ><input type="checkbox"  /></li>
                            <li style="float:left; margin-top:0px;"><img src="content/static/images/sp.png" /></li>
                            <li style="float:left;"><div style="font-size:12px; color:#333; width:50px; overflow:hidden; height:30px; margin-top:20px;" >78941...<br/>白酒</div></li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:20px;">1</li>
                            <li style="float:left; font-size:12px;color:#333; line-height:80px; margin-left:25px;">888.00</li>
                        </ul>
                        <hr style="width:240px; border:1px solid #ccc; border-bottom:none; margin-top:5px;"/>
                        <div style="position:absolute; bottom:0;  width:280px; height:80px; " >
                        	<span style="float:left; font-size:14px; font-family:'微软雅黑'; " >已选1件</span><span style="float:left; margin-left:170px; color:#901531;font-size:12px; font-family:'微软雅黑'; " >￥888.00</span>					
                                    <div style="width:200px; height:40px; background-color:#901531; margin:0 auto; margin-top:20px; line-height:10px; text-align:center;">
                                        <a href="javascript:;"  id="loginsubmit" tabindex="6" style="color:#fff; line-height:40px;" clstag="pageclick|keycount|20150112ABD|2">付&nbsp;&nbsp;&nbsp;&nbsp;款</a>
                                    </div>
                        </div>
                    </div>
            </div>
    </div>
	<!--酒常识-->
    <div class="jcsdiv"  style="background-color:#ccc;position:absolute; z-index:1; right:-300px; width:290px; top:100px; margin-left:10px; height:100%; display:block;" >
    		<span style=" float:left; font-size:18p; margin-top:3px; margin-left:22px;">酒常识</span>
            <div style="width:270px; height:100%; position:absolute; top:30px; left:20px;">
            <div>
            	<ul>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px; " >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px; " >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px; " >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px; " >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
            		<li>
            	     <div style="font-size:14px; width:250px; background-color:#fff; margin-top:15px; line-height:20px;" >
                	  <span>Q:这个酒好喝吗？</span><br/>
                	  <span>A:挺好喝的</span>
                	</div>
                </li>
                </ul>
                </div>
            </div>
    </div>
</div>
</div>