<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>
	<link rel="stylesheet" type="text/css" href="css/zhuce.css">
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
	<script type="text/javascript" src="js/cookie/cookie.js"></script>
	<script src="js/register/layer.js"></script><link rel="stylesheet" href="css/layer.css" id="layui_layer_skinlayercss">
<!--     <script type="text/javascript" src="js/register/register.js"></script> -->
</head>
<body>
    <div class="margin" id="box">
        <a href=""><img src="images/logo.jpg"></a>
    </div>
    <div class="margin" id="content">
        <div class="head">
            <ul>
                <li class="li1"><a href=""><b>会员注册</b></a></li>
            </ul>
			<!-- <div class="existing_account">
				<p>已有账户？</p>
				<span>登录</span>	
			</div> -->
        </div>
		
    <div class="clear"></div>

    <!-- 会员注册 -->
    <div class="ipt geren">
        <form method="get" action="saveMember.do" id="from1" method="post" onsubmit="return checkInfo();">
            <!-- 会员号 -->
            <div class="ipt1">
                <span><b>*</b>会员名</span><input id="name" type="text" placeholder="6-16个字符，只能数字、字母" name="name">
                <b class="b_01">会员名不能为空</b>
                <b class="b_02">会员名格式不正确</b>
            </div>
            <!-- 密码 -->
            <div class="ipt2">
                <span><b>*</b>登录密码</span><input id="password" type="password" placeholder="6-18个字符，数字、字母、特殊字符，至少包含两种" name="password">
                <b class="b_03">密码不能为空</b>
                <b class="b_04">请按提示填写密码</b>
            </div>
            <!-- 确认密码 -->
            <div id="repassword_div">
                <span><b>*</b>确认密码</span><input id="repassword" type="password" placeholder="请再次输入密码" name="password">
                <b id="repassword_icon" style="display:none;">两次密码不一致</b>
            </div>
            <!-- 姓名 -->
            <div class="ipt3">
                <span><b>*</b>身份证号</span><input id="idNumber" type="text" name="idNumber" placeholder="请输入身份证号">
                <b class="b_05">身份证号不能为空</b>
                <b class="b_06">身份证号仅支持数字和英文字母</b>
            </div>
            <div class="ipt3">
                <span><b>*</b>性别</span><select id="sexS" >
                        <option value ="1" selected="selected">男</option>
                        <option value ="2">女</option>
                      </select>
                      <input type="hidden" name="sex" id="sex" class="input_txt" maxlength=20 />
            </div>
            
            <div class="ipt4">
                <span><b>*</b>手机号码</span><input id="mobile" type="text" name="mobile" placeholder="请输入手机号" maxlength="11">
                <b class="b_07">手机号码不能为空</b>
                <b class="b_08">请填写正确手机号码</b>
            </div>
			
            <input type="submit" class="sub" id="person_submit" value="提交注册" />
        </form>
    </div>
    </div>
	<!--图形验证-->
	<footer class="footer">
		<span><a class="jingbei" href="">辽备号</a></span>
		<p>2017 </p>
    </footer>
	<script type="text/javascript">
		//alert("0000");
		var dg;
		
		
		var save = "保存";
		var E0002 = "密码不能为空!";
		var E0008 = "会员名不能为空!";
		var E0009 = "手机号不能为空";
		var E00010 = "两次密码输入不一致";
		var E00011 = "";
		var E00050 = "";
		var E00053 = "";
		//alert("1111");
	
		$(document).ready(function() {
			
			var sex=$("#sex").val();
			var sexS=$("#sexS").val();
			if(sex=="") {
				$("#sex").val(sexS);
			} else {
				$("#sexS").val(sex);
			}
			
			$("#sexS").change(function(){
				var sexS=$("#sexS").val();
			    $("#sex").val(sexS);
			  });
			
// 			dg = frameElement.lhgDG;
// 			dg.addBtn('OK', save, function() {
// 				$("#memberForm").submit();
// 				window.close();
// 			});
			/* if ($("#dateGraduation").val() == ""){
					$("#state").val(null);
			} */
		});
		
		function checkInfo() {
			/* alert("anwser me quickly!");
			alert($("#jobNo").val()); */
			if ($("#name").val().trim() == "") {
				alert(E0008);
				$("#name").focus();
				return false;
			}
			if ($("#password").val().trim() == "") {
				alert(E0002);
				$("#password").focus();
				return false;
			}
			if ($("#mobile").val().trim() == "") {
				alert(E0002);
				$("#mobile").focus();
				return false;
			}
			if (password != repassword) {
				alert(E00010);
				$("#password").focus();
				return false;
			}
			return true;
		}
		
		function success() {
			frameElement.lhgDG.curWin.successReload(); 
			dg.cancel();
		}
	</script>
</body>
</html>