<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<link rel="stylesheet" type="text/css"
	href="content/static/css/style.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/animation.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/login.css">
<link rel="stylesheet" type="text/css"
	href="content/static/css/base.css" />
<link type="text/css" rel="stylesheet" href="content/static/css/aa.css"
	source="widget" />

<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<!-- <script type="text/javascript" -->
<!-- 	src="css/js/--login.pge.js,login.pge.init.js"></script> -->
<script src="content/static/js/tumbler/tz.js"></script>
<style type="text/css">
.frred {
	color: #FF0000;
	font-size: 12px;
}

.frbule {
	color: #0066CC;
	font-size: 12px;
}

.fgren {
	color: #339933;
	font-size: 12px;
}
</style>
<script>
	window.onload = function() {
		var url = window.location.href;
		url.toString();
		var a = url.charAt(url.lastIndexOf("1"));
		if (a.trim() != "1".trim()) {
			document.getElementsByClassName('zc').item(0).style.backgroundColor = "#f5f5f5";
			document.getElementsByClassName('zc').item(0).style.borderBottom = "1px solid #f5f5f5";
			var div = document.getElementById('zc');
			div.style.display = "block";
			document.getElementsByClassName('dl').item(0).style.backgroundColor = "#fff";
			document.getElementsByClassName('dl').item(0).style.borderBottom = "1px solid #ccc";
			var div = document.getElementById('dl');
			div.style.display = "none";
		}
	}
</script>
<title>不倒翁登录</title>
</head>

<body>

	<div class="center">
		<div class="logos">
			<a href="index"><img src="content/static/images/logo.png"></a>
			<div class="logowz">
				<span>欢迎登录</span>
			</div>
		</div>
		<div class="llr">
			<div class="title">
				<a onclick="javascript(0);" style="text-decoration: none;cursor:pointer;">
					<div class="dl" onclick="qhdiv('dl','zc')">
						<span>登录</span>
					</div>
				</a>
				<a onclick="javascript(0);" style="text-decoration: none;cursor:pointer;">
					<div class="zc" onclick="qhdiv('zc','dl')">
						<span>注册</span>
					</div>
				</a>
			</div>
			<div class="titltezw">
				<div id="dl" class="dlshow">
					<div class="dlimg">
						<img src="content/static/img/banner.jpg" />
					</div>
					<div class="login-form">
						<div class="login-box">
							<div class="mt">
								<h1 style="margin-top: 20px; margin-left: 1px;">不倒翁会员</h1>

							</div>
							<div class="msg-wrap">
								<div class="msg-warn hide">
									<b></b>
								</div>
								<div class="msg-error hide">
									<b></b>
								</div>
							</div>
							<div class="mc">
								<div class="form">
									<form id="formlogin" name="formlogin" method="post">
										<input type="hidden" id="uuid" name="uuid"
											value="a59566c1-83f0-4a93-a0ca-c95e0d0ebb45" /> <input
											type="hidden" name="machineNet" id="machineNet" value=""
											class="hide" /> <input type="hidden" name="machineCpu"
											id="machineCpu" value="" class="hide" /> <input
											type="hidden" name="machineDisk" id="machineDisk" value=""
											class="hide" /> <input type="hidden" name="TYBcQSVsoI"
											value="DIgwa" />
											<input type="hidden" name="page" value="${page }">
										<div class="item item-fore1">
											<label for="loginname" class="login-label name-label"></label>
											<input id="mobile" type="text" class="itxt"
												name="mobile" tabindex="1" autocomplete="off"
												placeholder="请输入手机号" /> <span class="clear-btn"></span>
										</div>
										<div id="entry" class="item item-fore2">
											<label class="login-label pwd-label" for="nloginpwd"></label>
											</label> <input type="password" id="inputPasw" name="password"
												class="itxt itxt-error" tabindex="2" autocomplete="off"
												placeholder="密码" /> <input type="hidden" name="loginpwd"
												id="loginpwd" value="" class="hide" /> <span
												class="clear-btn"></span> <span class="capslock"><b></b>大小写锁定已打开</span>
										</div>
										<div class="item item-fore3">
											<div class="safe">
												<span> <input id="autoLogin" name="chkRememberMe"
													type="checkbox" class="jdcheckbox" tabindex="3"
													clstag="pageclick|keycount|20150112ABD|6"> <label
													for="">自动登录</label>
												</span> <span class="forget-pw-safe"> <a
													href="javascript:if(confirm('http://safe.jd.com/findPwd/index.action  \n\n该文件无法用 Teleport Ultra 下载, 因为 它是一个域或路径外部被设置为它的启始地址的地址。  \n\n你想在服务器上打开它?'))window.location='http://safe.jd.com/findPwd/index.action'"
													tppabs="http://safe.jd.com/findPwd/index.action" class=""
													target="_blank" clstag="pageclick|keycount|20150112ABD|8">忘记密码?</a>
												</span>
											</div>
											<div class="updata" id="updata" style="display: none;">
												安全控件升级了!<a href="javascript:void(0);" class="up-two">立即更新</a>
												<a class="up-one" href="javascript:void(0);"
													onclick="$('#updata').hide();"></a>
											</div>
										</div>

										<div id="o-authcode" class="item item-vcode item-fore4  hide ">
											<input id="authcode" type="text" class="itxt itxt02"
												name="authcode" tabindex="5"> <img
												id="JD_Verification1" class="verify-code"
												src2="https://authcode.jd.com/verify/image?a=1&amp;acid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;uid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45"
												onclick="this.src= document.location.protocol +'//authcode.jd.com/verify/image?a=1&amp;acid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;uid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;yys='+new Date().getTime();$('#authcode').val('');" />
											<a href="javascript:void(0)"
												onclick="$('#JD_Verification1').click();">看不清楚换一张</a>
										</div>
										<div class="item item-fore5">
											<div class="login-btn">
												<a href="javascript:void(0);" class="btn-img btn-entry"
													id="loginsubmit" tabindex="6" onclick="loginIng();"
													clstag="pageclick|keycount|20150112ABD|2">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="zc" class="zcshow">
				<div class="dlimg">
					<img src="content/static/img/banner.jpg" />
				</div>
				<div class="login-form">
					<div class="login-box">
						<div class="mt">
							<h1 style="margin-top: 20px; margin-left: 1px;">会员注册</h1>

						</div>
						<div class="msg-wrap">
							<div class="msg-warn hide">
								<b></b>
							</div>
							<div class="msg-error hide">
								<b></b>
							</div>
						</div>
						<div class="mc">
							<div class="form">
								<form id="formRegist" name="formRegist" method="post" onsubmit="checkAll();">
									<input type="hidden" id="uuid" name="uuid"
										value="a59566c1-83f0-4a93-a0ca-c95e0d0ebb45" />
									<div class="item item-fore1">
										<label for="mobile" class="login-label name-label"></label> <input
											id="mobile1" type="text" class="itxt" name="phone"
											tabindex="1" autocomplete="off" placeholder="登录名：请输入手机号"
											onblur="checkformname1();" /> <span class="clear-btn"
											id="sname1"></span>
									</div>
									<input type="hidden" name="page" value="${page }">
									<div class="item item-fore1" style="width: 150px;">
										<input id="mobile_code" type="text" class="itxtzcm"
											name="mobile_code" tabindex="1" autocomplete="off"
											placeholder="验证码" /> 
										<span class="clear-btn"></span>
									</div>
									<div
										style="border: 0px solid #BDBDBD; background-color: #4F8CD8; color: #fff; width: 150px; height: 40px; margin-left: 154px; margin-top: -60px; margin-bottom: 18px; text-align: center; line-height: 40px; font-size: 16px;">
										<span id="zphone" onclick="get_mobile_code();">获取验证码</span>
									</div>
									<div id="entry" class="item item-fore2">
										<label class="login-label pwd-label" for="nloginpwd"></label>
										</label> <input type="password" id="inputPassword3" name="password1"
											class="itxt itxt-error" tabindex="2" autocomplete="off"
											placeholder="密码" onblur="checkpwd();" /> <span
											class="clear-btn" id="spwd"></span> <span class="capslock"><b></b>大小写锁定已打开</span>
									</div>
									<div id="entry" class="item item-fore2">
										<label class="login-label pwd-label" for="nloginpwd"></label>
										</label> <input type="password" id="inputPassword4" name="password"
											class="itxt itxt-error" tabindex="2" autocomplete="off"
											placeholder="确认密码" onblur="rcheckpwd();"/><span
											class="clear-btn" id="srpwd"></span> <span class="capslock"><b></b>大小写锁定已打开</span>
									</div>
									<div class="item item-fore3">
										<div class="safe">
											<span> <input id="autoLogin" name="chkRememberMe"
												type="checkbox" class="jdcheckbox" tabindex="3"
												clstag="pageclick|keycount|20150112ABD|6"> <label
												for="">自动登录</label>
											</span> <span class="forget-pw-safe"> <a
												href="javascript:if(confirm('http://safe.jd.com/findPwd/index.action  \n\n该文件无法用 Teleport Ultra 下载, 因为 它是一个域或路径外部被设置为它的启始地址的地址。  \n\n你想在服务器上打开它?'))window.location='http://safe.jd.com/findPwd/index.action'"
												tppabs="http://safe.jd.com/findPwd/index.action" class=""
												target="_blank" clstag="pageclick|keycount|20150112ABD|8">忘记密码?</a>
											</span>
										</div>
										<div class="updata" id="updata" style="display: none;">
											安全控件升级了!<a href="javascript:void(0);" class="up-two">立即更新</a>
											<a class="up-one" href="javascript:void(0);"
												onclick="$('#updata').hide();"></a>
										</div>
									</div>

									<div id="o-authcode" class="item item-vcode item-fore4  hide ">
										<input id="authcode" type="text" class="itxt itxt02"
											name="authcode" tabindex="5"> <img
											id="JD_Verification1" class="verify-code"
											src2="https://authcode.jd.com/verify/image?a=1&amp;acid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;uid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45"
											onclick="this.src= document.location.protocol +'//authcode.jd.com/verify/image?a=1&amp;acid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;uid=a59566c1-83f0-4a93-a0ca-c95e0d0ebb45&amp;yys='+new Date().getTime();$('#authcode').val('');" />
										<a href="javascript:void(0)"
											onclick="$('#JD_Verification1').click();">看不清楚换一张</a>
									</div>
									<div class="item item-fore5">
										<div class="login-btn">
											<a href="javascript:void(0);" class="btn-img btn-entry"
												id="loginsubmit" tabindex="6"
												clstag="pageclick|keycount|20150112ABD|2" onclick="register();">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function checkAll(){
		//var uname = $("#mobile1").val();
		//var validateCode = $("#mobile_code").val();
		//var pwd = $("#inputPassword3").val();
		//var confirmpwd = $("#inputPassword4").val();
		//验证用户名：
		var fname = document.getElementById("mobile");
		var ftname = document.getElementById("sname");
		if (fname.value == "" || fname.value.length != 11) {
			ftname.className = "frred";
			//fname.focus();
			ftname.innerHTML = "× 请输入11位手机号";
		} else {
			if (!/^[+|-]?\d+\.?\d*$/.test(fname.value) && fname.value != '') {
				ftname.className = "frred";
				//fname.focus();
				ftname.innerHTML = "x 手机号不可用!";
			} else {
				ftname.className = "fgren";
				ftname.innerHTML = "√用户名可用!";
			}
		}
		//验证验证码
		
		//验证密码
		var fpwd = document.getElementById("inputPassword3");
		var ftpwd = document.getElementById("spwd");
		if (fpwd.value == "" || fpwd.value.length<6||fpwd.value.length>20) {
			ftpwd.className = "frred";
			//fpwd.focus();
			ftpwd.innerHTML = "× 请输入6-20位用户密码！";
		} else {
			ftpwd.className = "fgren";
			ftpwd.innerHTML = "√密码可用！"
		}
		//验证再次输入密码
		var fpwd = document.getElementById("inputPassword3");
		var frpwd = document.getElementById("inputPassword4");
		var ftrpwd = document.getElementById("srpwd");
		if (frpwd.value == "") {
			ftrpwd.className = "frred";
			//frpwd.focus();
			$("#loginsubmit").attr("onclick", "null");
			ftrpwd.innerHTML = "× 请输入您的重复密码！"
		} else {
			if (frpwd.value != fpwd.value) {
				ftrpwd.className = "frred";
				//fpwd.focus();
				$("#loginsubmit").attr("onclick", "null");
				ftrpwd.innerHTML = "× 俩次密码输入不一致，请重新输入！";
			} else {
				ftrpwd.className = "fgren";
				ftrpwd.innerHTML = " √ 密码输入正确";
				$("#loginsubmit").attr("onclick", "register();");
			}
		}
		
	}
	function register(){
		document.formRegist.action = "user/regist";
		var flag = 0;
		//验证用户名：
		var fname = document.getElementById("mobile");
		var ftname = document.getElementById("sname");
		if (fname.value == "" || fname.value.length != 11) {
			ftname.className = "frred";
			//fname.focus();
			flag = 1;
			ftname.innerHTML = "× 请输入11位手机号";
		} else {
			if (!/^[+|-]?\d+\.?\d*$/.test(fname.value) && fname.value != '') {
				ftname.className = "frred";
				//fname.focus();
				flag = 1;
				ftname.innerHTML = "x 手机号不可用!";
			} else {
				ftname.className = "fgren";
				ftname.innerHTML = "√用户名可用!";
			}
		}
		//验证验证码
		
		//验证密码
		var fpwd = document.getElementById("inputPassword3");
		var ftpwd = document.getElementById("spwd");
		if (fpwd.value == "" || fpwd.value.length<6||fpwd.value.length>20) {
			ftpwd.className = "frred";
			//fpwd.focus();
			flag = 1;
			ftpwd.innerHTML = "× 请输入6-20位用户密码！";
		} else {
			ftpwd.className = "fgren";
			ftpwd.innerHTML = "√密码可用！"
		}
		//验证再次输入密码
		var fpwd = document.getElementById("inputPassword3");
		var frpwd = document.getElementById("inputPassword4");
		var ftrpwd = document.getElementById("srpwd");
		if (frpwd.value == "") {
			ftrpwd.className = "frred";
			//frpwd.focus();
			$("#loginsubmit").attr("onclick", "null");
			ftrpwd.innerHTML = "× 请输入您的重复密码！";
			flag = 1;
		} else {
			if (frpwd.value != fpwd.value) {
				ftrpwd.className = "frred";
				//fpwd.focus();
				$("#loginsubmit").attr("onclick", "null");
				ftrpwd.innerHTML = "× 俩次密码输入不一致，请重新输入！";
				flag = 1;
			} else {
				ftrpwd.className = "fgren";
				ftrpwd.innerHTML = " √ 密码输入正确";
				$("#loginsubmit").attr("onclick", "register();");
			}
		}
		if (flag==0) {
			document.formRegist.submit();
		}		
	}
	function loginIng(){
		document.formlogin.action = "user/login";
		document.formlogin.submit();
	}
	function checkpwd() {
		var fpwd = document.getElementById("inputPassword3");
		var ftpwd = document.getElementById("spwd");
		if (fpwd.value == "" || fpwd.value.length<6||fpwd.value.length>20) {
			ftpwd.className = "frred";
			//fpwd.focus();
			ftpwd.innerHTML = "× 请输入6-20位用户密码！";
		} else {
			ftpwd.className = "fgren";
			ftpwd.innerHTML = "√密码可用！"
		}
	}
	function rcheckpwd() {
		var fpwd = document.getElementById("inputPassword3");
		var frpwd = document.getElementById("inputPassword4");
		var ftrpwd = document.getElementById("srpwd");
		if (frpwd.value == "") {
			ftrpwd.className = "frred";
			//frpwd.focus();
			$("#loginsubmit").attr("onclick", "null");
			ftrpwd.innerHTML = "× 请输入您的重复密码！"
		} else {
			if (frpwd.value != fpwd.value) {
				ftrpwd.className = "frred";
				//fpwd.focus();
				$("#loginsubmit").attr("onclick", "null");
				ftrpwd.innerHTML = "× 俩次密码输入不一致，请重新输入！";
			} else {
				ftrpwd.className = "fgren";
				ftrpwd.innerHTML = " √ 密码输入正确";
				$("#loginsubmit").attr("onclick", "register();");
			}
		}
	}
		function checkformname() {
			var fname = document.getElementById("mobile");
			var ftname = document.getElementById("sname");
			if (fname.value == "" || fname.value.length != 11) {
				ftname.className = "frred";
				//fname.focus();
				ftname.innerHTML = "× 请输入11位手机号";
			} else {
				if (!/^[+|-]?\d+\.?\d*$/.test(fname.value) && fname.value != '') {
					ftname.className = "frred";
					//fname.focus();
					ftname.innerHTML = "x 手机号不可用!";
				} else {
					ftname.className = "fgren";
					ftname.innerHTML = "√用户名可用!";
				}
			}
		}
		var iosk = false;
		function checkformname1() {
			var fname = document.getElementById("mobile1");
			var ftname = document.getElementById("sname1");
			if (fname.value == "" || fname.value.length != 11) {
				ftname.className = "frred";
				//fname.focus();
				ftname.innerHTML = "× 请输入11位手机号";
			} else {
				if (!/^[+|-]?\d+\.?\d*$/.test(fname.value) && fname.value != '') {
					ftname.className = "frred";
					//fname.focus();
					ftname.innerHTML = "x 手机号不可用!";
				} else {
					ftname.className = "fgren";
					ftname.innerHTML = "√用户名可用!";
					iosk = true;
				}
			}
		}
		function get_mobile_code() {
			if(iosk == true){
				$.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : 'verification/smsVerification?mobile='
							+ jQuery.trim($('#mobile1').val()),
					dataType : 'json',
					success : function(msg) {
						if (msg.name == '提交成功') {
							RemainTime();
						}
					}
				});
			}
		}
		var iTime = 59;
		var Account;
		function RemainTime() {
			$("#zphone").attr("onclick", "null");
			var iSecond, sSecond = "", sTime = "";
			if (iTime >= 0) {
				iSecond = parseInt(iTime % 60);
				iMinute = parseInt(iTime / 60)
				if (iSecond >= 0) {
					if (iMinute > 0) {
						sSecond = iMinute + "分" + iSecond + "秒";
					} else {
						sSecond = iSecond + "秒";
					}
				}
				sTime = sSecond;
				if (iTime == 0) {
					clearTimeout(Account);
					sTime = '获取手机验证码';
					iTime = 59;
					$("#zphone").attr("onclick", "null");
					$("#zphone").attr("onclick", "get_mobile_code();");
				} else {
					Account = setTimeout("RemainTime()", 1000);
					iTime = iTime - 1;
				}
			} else {
				sTime = '没有倒计时';
			}
			$('#zphone').html(sTime);
			document.getElementById('zphone').html(sTime);
		}
	</script>
	</div>
	<!--脚部-->
	<jsp:include page="../frontDesk/foot.jsp" />
</body>
</html>
