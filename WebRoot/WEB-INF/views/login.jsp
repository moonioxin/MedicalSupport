<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="images\gtyytb.ico" />
<title>锦州市古塔医养服务中心</title>
<style type="text/css">
	body{margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;background-color: #1B3142;}
	.header{width:100%;height:41px;background: url(images/login-top-bg.gif) repeat-x;}
	.center{width:100%;height:532px;background: url(images/login_bg.jpg) repeat-x;}
	.login{float:right;width:65%;height:100%;background: url(images/login-wel.gif) bottom no-repeat;}
	.login_titletop{margin-left:35px;font-family: Microsoft Yahei, Helvetica, sans-serif;font-size: 24px;height:70px;line-height: 36px;color: #666666;font-weight: bold;}
	.login_titletop .f{color: #086BB2;font-size:50px;}
	.login_title{margin-left:35px;font-family: Microsoft Yahei, Helvetica, sans-serif;font-size: 14px;height:36px;line-height: 36px;color: #666666;font-weight: bold;}
	.login_info{margin-left:35px;font-family: Microsoft Yahei, Helvetica, sans-serif;font-size: 12px;height:36px;line-height: 36px;color: #333333;}
	.login_btn{margin-left:150px;font-family: Microsoft Yahei, Helvetica, sans-serif;font-size: 12px;height:36px;line-height: 36px;color: #333333;}
    .login_cookie{margin-left:35px;font-family: Microsoft Yahei, Helvetica, sans-serif;font-size: 12px;height:20px;line-height: 20px;color: #333333;}
	.login_input{width:150px;height:20px;margin-left:30px;border:1px solid #7F9DB9;vertical-align: middle;}
	.login_select{width:150px;height:20px;border:1px solid #7F9DB9;vertical-align: middle;}
	.login_code{width:70px;height:20px;margin-left:30px;border:1px solid #7F9DB9;vertical-align: middle;}
	.btn{width:60px;height:25px;border-width:0px;background-image: url(images/btn-bg2.gif);letter-spacing: 3px;margin-right:70px;cursor: pointer;}
	.login_info img{vertical-align: middle;cursor: pointer;}
	.width_lbl{width:520px;}
	.errInfo{display:none;color:red;}
	
	.logo{width:100%;height:50px;background: url(images/logo2.png) no-repeat;_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/logo2.png';)}
	.left_txt{font-family: Arial, Helvetica, sans-serif;font-size: 12px;line-height: 25px;color: #666666;}
	
	.bottom{width:100%;height:auto;text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 10px;color: #ABCAD3;text-decoration: none;line-height: 20px;}
	#login_string_CXEE_right{padding-left:14px;}
	#login_string_CT_left{padding-left:14px;} 
</style>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/cookie/cookie.js"></script>
<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
<script type="text/javascript" src="js/js_user/com.js"></script>
</head>
<body> 
<div style="width:100%;min-width:1280px;height:645px;position: absolute;top:50%;left:50%;margin-top:-320px;margin-left:-50%;">
	<div class="header"></div>
	<form action="login.do" method="post" name="loginForm" onsubmit="return checked();">
	<input type="hidden" name="username" id="username" value=""/>
	<input type="hidden" name="password" id="password" value=""/>
	<div class="center">
		<div class="login">
			<div style="width:100%;height:auto;margin-top:100px;">
		 <!--	<form action="login_right.do" method="post" name="loginForm_right" onsubmit="return check_right();">-->
			    <div class="login_titletop">
					<label class="f">■  </label><label id="login_string_CXEE_right">XX 医养 System</label><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!--<label id="login_string_sysname_right"></label>-->
				</div>
				<div class="login_title">
					<label id="login_string_systemlogin_right">后台系统登录</label>
				</div>
				<div class="login_info">
				    <table><tr><td width=80px;>
					<label id="login_string_username_right" style="font-size: 13px">用户名：</label></td>
					<td><input type="text" name="username_right" id="username_right" class="login_input" value="${username_right}"/>
					</td>
					</tr></table>
				</div>
				<div class="login_info">
				    <table><tr><td width=80px;>
					<label id="login_string_password_right" style="font-size: 13px" >密　码：</label></td>
					<td><input type="password" name="password_right" id="password_right" class="login_input" value="${password_right}" onkeydown="if(event.keyCode==13){check();}"/>
					</td>
					</tr></table>
				</div>
				<!-- <div class="login_info">
					<label>验证码：</label><input type="text" name="code" id="code" class="login_code"/>&nbsp;&nbsp;
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					&nbsp;<span id="codeerr" class="errInfo"></span>
				</div>
				 -->
				<div class="login_cookie">
				        <table><tr><td width=97px;>
                        <span style="font-size:12px; color:black;"><label id="login_string_rememberPassword_right" style="font-size: 13px"></label></span></td>  
                        <td>&nbsp;&nbsp;&nbsp;<input id="saveCookie_right" type="checkbox" value="" /></td>
                        </tr></table>
				</div>
				<br>
				<div class="login_btn">
					<input id="login_string_loginBtn_right" type="button" name="loginBtn_right" value="登录" class="btn" onclick="javascript:check()"/>
					<input id="login_string_cancelBtn_right" type="reset" name="cancelBtn_right" value="取消" class="btn"/>
				</div>
				<br>
				<br>
				<div class="login_info">
				    <table><tr><td width=580px;>
					<label id="login_string_memo_right" style="font-size: 13px" >※XX地区XX医院后台管理系统！</label></td>
					</tr></table>
				</div>
			<!--</form>-->
			</div>
		</div>
	</div>
	</form>
</div>
<script type="text/javascript">
if (window != top) 
top.location.href = location.href; 
	
		var errInfo = "${errInfo}";
		var nameerrInfo = "";
		var passworderrInfo = "";
		//用户名或密码错误，请重新输入。
		var E0003 = "";
		var E0004 = "";
		var E00061 = "";
		var language = getCookieValue("language");
		
		var type = "";
		
		$(document).ready(function(){			
			if (language!="CN" && language!="JP"){
				language = "CN";
			}
			loadProperties(language,setPageByLanguage);
			
			if(errInfo!=""){
				
				if(errInfo == "E0003"){
					alert(E0003);
				} else if(errInfo == "E0004"){
					alert(E0004);
				}else if(errInfo == "E00061"){
					alert(E00061);
				}
			}
		});
		
		function check(){
			$("form").submit();
		}
	
		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}
	 
		//function changeCode(){
			//$("#codeImg").attr("src","code.do?t="+genTimestamp());
		//}
		
		function resetErr(){
			//$("#nameerr_right").hide();
			//$("#nameerr_right").html("");
			//$("#pwderr_right").hide();
			//$("#pwderr_right").html("");
			/** 取消验证码
			$("#codeerr").hide();
			$("#codeerr").html("");
			**/
		}
		
		function checked(){
			resetErr();			
			setCookie("language",language,365*24,"/");
			if($("#username_right").val()==""){
				$("#nameerr_right").show();
				//$("#nameerr").html("用户名不得为空！");
				alert(nameerrInfo);
				$("#username_right").focus();
				return false;
			}
			if($("#password_right").val()==""){
				$("#pwderr_right").show();
				//$("#pwderr").html("密码不得为空！");
				alert(passworderrInfo);
				$("#password_right").focus();
				return false;
			}
			/** 取消验证码
			if($("#code").val()==""){
				$("#codeerr").show();
				$("#codeerr").html("验证码不得为空！");
				$("#code").focus();
				return false;
			}
			**/
			if( $("#saveCookie_right").attr("checked")){
                setCookie("userName_right",$("#username_right").val(),365*24,"/");  
                setCookie("password_right",$("#password_right").val(),365*24,"/");  
            }else{
                deleteCookie("userName_right","/");
                deleteCookie("password_right","/");
            }
			 $("#username").val($("#username_right").val()); 
			 $("#password").val($("#password_right").val());
			
			return true;
		}
		//ADD BY WEI 20151029 START
		//国际化
		function setPageByLanguage(){
			//左边CT登录
			$('#login_string_CT_left').html($.i18n.prop('login_string_CT_left'));
			$('#login_string_sysname_left').html($.i18n.prop('login_string_sysname_left'));
			$('#login_string_systemlogin_left').html($.i18n.prop('login_string_systemlogin_left'));
			$('#login_string_username_left').html($.i18n.prop('login_string_username_left'));
			$('#login_string_password_left').html($.i18n.prop('login_string_password_left')); 
			$('#login_string_rememberPassword_left').html($.i18n.prop('login_string_rememberPassword_left')); 
			$('#login_string_loginBtn_left').val($.i18n.prop('login_string_loginBtn_left'));
			$('#login_string_cancelBtn_left').val($.i18n.prop('login_string_cancelBtn_left'));
			$('#login_string_memo_left').html($.i18n.prop('login_string_memo_left'));		
			
			$('#login_string_CXEE_right').html($.i18n.prop('login_string_CXEE_right'));
			$('#login_string_sysname_right').html($.i18n.prop('login_string_sysname_right'));
			$('#login_string_systemlogin_right').html($.i18n.prop('login_string_systemlogin_right'));
			$('#login_string_username_right').html($.i18n.prop('login_string_username_right'));
			$('#login_string_password_right').html($.i18n.prop('login_string_password_right')); 
			$('#login_string_rememberPassword_right').html($.i18n.prop('login_string_rememberPassword_right')); 
			$('#login_string_loginBtn_right').val($.i18n.prop('login_string_loginBtn_right'));
			$('#login_string_cancelBtn_right').val($.i18n.prop('login_string_cancelBtn_right'));
			$('#login_string_memo_right').html($.i18n.prop('login_string_memo_right'));		

			nameerrInfo = $.i18n.prop('E0001');
			passworderrInfo = $.i18n.prop('E0002');
			E0003 = $.i18n.prop('E0003');
			E0004 = $.i18n.prop('E0004');
			E00061 = $.i18n.prop('E00061');
			document.title =$.i18n.prop('login_string_title');
		}
		//ADD BY WEI 20151029 END
	</script>
</body>
</html>