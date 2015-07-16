<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="seller" style="margin: 30px 0 0 190px; font-size: 12px;">
	<div class="center">
		<div class="top_nav">
			<div class="top_nav_class">
				<ul>
					<a href="proscenium/openShop"><li
						style="background-color: #a40c59; color: #fff;">我是卖家</li></a>
					 <a href="management/index"><li>返回管理界面</li></a>
				</ul>
			</div>
		</div>
		<div class="left_nav">
			<div class="box">
				<h4 onClick="f1(this,son2)">
					<img src="content/static/images/zk.png" /><span>交易管理</span>
				</h4>
				<ul id="son2">
					<li><a href="proscenium/soldComm">已卖出的商品</a></li>
					<li><a href="proscenium/refund">退款管理</a></li>
				</ul>
			</div>

			<div class="box">
				<h4 onClick="f1(this,son4)">
					<img src="content/static/images/zk.png" /><span>商品管理</span>
				</h4>
				<ul id="son4">
					<!--                     	<li><a href="proscenium/releaseCommoidty">发布商品</a></li> -->
					<li><a href="proscenium/publishComm">发布商品</a></li>
					<li><a href="proscenium/chushou?flag=1">出售中的商品</a></li>
					<li><a href="proscenium/chushou?flag=0">仓库中的商品</a></li>
				</ul>
			</div>

		</div>
	</div>
</div>