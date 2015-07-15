<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">

<script type="text/javascript"
	src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="content/static/css/bootstrap/bootstrap-tree.css"
	rel="stylesheet">
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page='../common/header.jsp' />
<script type="text/javascript">
	// Popup window code
	function popupWindow(url) {
		popupWindow = window
				.open(
						url,
						'popUpWindow',
						'height=600,width=600,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
	}
</script>
<br>
<br>
<div class="row clearfix">
<br>
	<jsp:include page='../common/menu.jsp' />
	<div class="col-md-4 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					分类
				</h3>
			</div>
			<div class="tree well">
				<c:set var="index" value="0" scope="request" />
				<!-- 自增序号，注意scope-->
				<c:set var="level" value="0" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:import url="__department2.jsp" />
			</div>
		</div>
	</div>
	<div class="col-md-6 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">操作</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<br>
					<form class="form-horizontal"  name="IUpload" action="management/shouyeaddOrUpdateDep"  id="form" 
						method="POST"  enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">上级分类:</label>
							<c:if test="${department.parentLevel != null }">
								<label class="col-sm-2 control-label">${department.parentLevel.departmentname }</label>
							</c:if>
							<br>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类名称:</label> 
							<div class="col-sm-8">
							<input id="departmentID" name="departmentID" value="${department.id }" type="hidden">
								<input name="departmentname" class="form-control"
									value="${department.departmentname }"> <br>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8" style="text-align: center;">
								<button type="button" id="btn_upload" onclick="detect();" class="btn btn-default">添加下级分类</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="btn_upload2" class="btn btn-default" onclick="updateDepartmen();">修改此分类</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" onclick="deleteDepartmen();">删除此分类</button>
							</div>
						</div>
					</form>
				</P>
			</div>
		</div>
	</div>
<script> 
   function PreviewImage(imgFile) 
   { 
    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
    if(!pattern.test(imgFile.value)) 
    { 
     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
     imgFile.focus(); 
    } 
    else 
    { 
     var path; 
     if(document.all)//IE 
     { 
      imgFile.select(); 
      path = document.selection.createRange().text; 
      document.getElementById("imgPreview").innerHTML=""; 
      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
     } 
     else//FF 
     { 
      path = URL.createObjectURL(imgFile.files[0]);
      document.getElementById("imgPreview").innerHTML = "<img name='picshow' src='"+path+"'/>"; 
     } 
    } 
   } 
   function imgExceedSize(w,h){
		if(!document.IUpload.sendFile.value==""){
			if(picshow.width !=w||picshow.height !=h){
				alert("图像尺寸："+picshow.width+"X"+picshow.height+"。\\n图像尺寸过大！你只能上传尺寸为 "+w+"×"+h+"的图像，请重新浏览图片！");
				document.getElementById("imgPreview").innerHTML = "";
				return true;
			}else{
				return false;
			}
		}else{
			return true;
		}
	}
	
	function detect(){
		document.IUpload.submit();
	}
  </script> 
	<script type="text/javascript">
		function onclickID(id) {
			location.href = 'management/shouyegetAgriculturalsSort?id=' + id+"&page=sortList";
		}
		function updateDepartmen(){
				document.IUpload.action="management/shouyeupdateDepartmen?departmentId="+$('#departmentID').val();
				document.IUpload.submit();
			
		}
		function deleteDepartmen(){
			document.IUpload.action="management/shouyedeleteDepartmen?departmentId="+$('#departmentID').val();
			document.IUpload.submit();
		}
		$(function() {
			$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr(
					'title', 'Collapse this branch');
			$('.tree li.parent_li > span').on(
					'click',
					function(e) {
						var children = $(this).parent('li.parent_li').find(
								' > ul > li');
						if (children.is(":visible")) {
							children.hide('fast');
							$(this).attr('title', 'Expand this branch').find(
									' > i').addClass('icon-plus-sign')
									.removeClass('icon-minus-sign');
						} else {
							children.show('fast');
							$(this).attr('title', 'Collapse this branch').find(
									' > i').addClass('icon-minus-sign')
									.removeClass('icon-plus-sign');
						}
						e.stopPropagation();
					});
		});
	</script>
<jsp:include page='../common/footer.jsp' />