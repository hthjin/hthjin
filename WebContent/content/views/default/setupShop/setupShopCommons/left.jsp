<%@page import="com.yc.entity.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    	<div class="indiv" style="border:1px red solid;height:auto;">
    		<div class="left indivter">
	        	<div class="indivtertil">
	        	  <p class="indivtertil_all"><a href="management/index">返回管理界面</a></p></div>
	        	  <ul>
                 	<li class="indivterta"><p>商品管理</p>
                 	<div class="indivterta_til_onc"><a href="proscenium/chushou?flag=1">出售中的商品</a> <a href="proscenium/chushou?flag=0">仓库中的商品</a> <a href="proscenium/publishComm">发布商品</a></div></li>
                    <li class="link"></li>
                    <li class="indivterta"><p>交易管理</p>
               	    <div class="indivterta_til_onc"><a href="proscenium/soldComm">订单管理</a> <a href="proscenium/refund">退款管理</a></div></li>
                    <li class="link"></li>
                    <li class="indivterta"><p>物流管理</p>
               	    <div class="indivterta_til_onc"><a href="proscenium/wuliu">物流配送</a></div></li>
                    <li class="link"></li>
              </ul>
            </div>
        </div>