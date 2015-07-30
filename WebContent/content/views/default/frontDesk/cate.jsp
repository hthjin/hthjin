<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#navbal{
	display: none;
}
</style>
<script>
		function ff1(){
			var divs=document.getElementById("navbal");
			divs.style.display="block";
			}
		function ff2(){
			var divs=document.getElementById("navbal");
			divs.style.display="none";
			}
	
	
		
</script>
<div class="top_nav">
	<div class="main">
		<div class="left">
			<ul>
				<li id="til" class="yel" onmouseover="ff1()"><a>全部分类</a>
					<div id="navbal" onmouseout="ff2()" >
						<div class="category-content" id="guide_2">
							<div class="category" style="margin-top: 35px;">
								<div class="zi" align="center">全部商品分类</div>
								<ul class="category-list" id="js_climit_li">
									<li class="appliance js_toggle relative first">
										<div class="category-info list-nz"
											style="border: 0px green solid;">
											<c:forEach items="${cateList}" var="cate">
												<c:if test="${cate.categoryID== 1}">
													<h3 class="category-name b-category-name">
														<a id="s-category-289"
															href="productCenter/cottonFactory?cottonType=-1"
															target="_blank" class="ml-22">${cate.category }</a>
													</h3>
													<p class="c-category-list limit-24">
														<c:forEach var="cate1" items="${cate.children}">
															<a
																href="productCenter/cottonFactory?cottonType=${cate1.categoryID}"
																target="_blank">${cate1.category }</a>
														</c:forEach>
														<a href="productCenter/cottonFactory?cottonType=shoucai" target="_blank">手采棉</a> 
                                      <a href="productCenter/cottonFactory?cottonType=jicai" target="_blank">机采棉</a> 
													</p>
												</c:if>
											</c:forEach>
										</div>
										<hr />
									</li>
									<li class="appliance js_toggle relative first">
										<div class="category-info list-nz">
											<c:forEach items="${cateList}" var="cate">
												<c:if test="${cate.categoryID== 2}">
													<h3 class="category-name b-category-name">
														<a id="s-category-289"
															href="search/cateComm?cateid=${cate.categoryID }"
															target="_blank" class="ml-22">${cate.category }</a>
													</h3>
													<p class="c-category-list limit-24">
														<c:forEach var="cate1" items="${cate.children}">
															<a href="search/result?id=${cate1.categoryID }"
																target="_blank">${cate1.category }</a>
														</c:forEach>
													</p>
												</c:if>
											</c:forEach>
										</div>
										<hr />
									</li>
									<li class="appliance js_toggle relative first">
										<div class="category-info list-nz">
											<c:forEach items="${cateList}" var="cate">
												<c:if test="${cate.categoryID== 3}">
													<h3 class="category-name b-category-name">
														<a id="s-category-289"
															href="search/cateComm?cateid=${cate.categoryID }"
															target="_blank" class="ml-22">${cate.category }</a>
													</h3>
													<p class="c-category-list limit-24">
														<c:forEach var="cate1" items="${cate.children}">
															<a href="search/result?id=${cate1.categoryID }" target="_blank">${cate1.category }</a>
														</c:forEach>
													</p>
												</c:if>
											</c:forEach>
										</div>
										<hr />
									</li>
									<li class="appliance js_toggle relative first">
										<div class="category-info list-nz">
											<c:forEach items="${cateList}" var="cate">
												<c:if test="${cate.categoryID== 4}">
													<h3 class="category-name b-category-name">
														<a id="s-category-289"
															href="search/cateComm?cateid=${cate.categoryID }"
															target="_blank" class="ml-22">${cate.category }</a>
													</h3>
													<p class="c-category-list limit-24">
														<c:forEach var="cate1" items="${cate.children}">
															<a href="search/result?id=${cate1.categoryID }" target="_blank">${cate1.category }</a>
														</c:forEach>
													</p>
												</c:if>
											</c:forEach>
										</div>
										<hr />
									</li>
								</ul>
								<!--                 <img src="images/b1.png" style="width:220px;" /> -->
							</div>
						</div>
					</div></li>
				<li style="margin-left: 150px;"><a href="hthjin">首页</a></li>
				<li><a href="productCenter/shopIndex?#mianhua">棉花</a></li>
				<li><a href="search/cateComm?cateid=2">农副产品</a></li>
				<li><a href="search/cateComm?cateid=3">家电百货</a></li>
				<li><a href="search/cateComm?cateid=4">粮食</a></li>

			</ul>
		</div>
		<div class="right"><
			<a href="user/reCarCommodity" class="shop_car"></a>
		</div>
		<div class="cl"></div>
	</div>
</div>
