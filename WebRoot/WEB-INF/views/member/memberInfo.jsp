<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>会员管理界面</title>
		<link type="text/css" rel="stylesheet" href="../css/main.css" />
		<style type="text/css">
body {
	width: 100%;
	height: 100%;
	background-color: #FFFFFF;
	text-align: center;
}

.input_txt {
	width: 200px;
	height: 20px;
	line-height: 20px;
}


.info {
	height: 40px;
	line-height: 40px;
}

.info th {
	text-align: right;
	width: 90px;
	color: #4f4f4f;
	padding-right: 5px;
	font-size: 13px;
}

.info td {
	text-align: left;
}
</style>
	</head>
	<body>
		<form action="saveMember.do" name="memberForm" id="memberForm" target="result"
			method="post" onsubmit="return checkInfo();parent.dg.cleanDialog();">
			<input name="memberID" id="memberID" value="${editMember.memberID }" type = "hidden"/>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr class="info">
					<th><label id="memberInfo_name">会员名:</label></th>
					<td><input type="text" name="name" id="name" class="input_txt"	maxlength=20 value="${editMember.name }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_name">卡号:</label></th>
					<td><input type="text" name="cardNo" id="cardNo" class="input_txt"	maxlength=20 value="${editMember.cardNo }" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_sex">性别:</label></th>
					<td><select id="sexS" >
                        <option value ="1" selected="selected">男</option>
                        <option value ="2">女</option>
                      </select>
					<input type="hidden" name="sex" id="sex" class="input_txt" maxlength=20 value="${editMember.sex}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_birthday">生日:</label></th>
					<td><input type="text" name="birthDate" id="birthDate" class="input_txt" onClick="WdatePicker()" maxlength=20 value="${editMember.birthDate}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_idNumber">身份证号:</label></th>
					<td><input type="text" name="idNumber" id="idNumber" class="input_txt" maxlength=20 value="${editMember.idNumber}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_telephone">联系电话:</label></th>
					<td><input type="text" name="telephone" id="telephone" class="input_txt" maxlength=20 value="${editMember.telephone}" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_mobile">手机号:</label></th>
					<td><input type="text" name="mobile" id="mobile" class="input_txt" maxlength=20 value="${editMember.mobile}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_emergencyPhone">紧急联系号码:</label></th>
					<td><input type="text" name="emergencyPhone" id="emergencyPhone" class="input_txt" maxlength=20 value="${editMember.emergencyPhone}" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_email">邮箱:</label></th>
					<td><input type="text" name="email" id="email" class="input_txt" maxlength=20 value="${editMember.email}" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_address">住址:</label></th>
					<td><input type="text" name="address" id="address" class="input_txt" maxlength=20 value="${editMember.address}" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_password">密码:</label></th>
					<td><input type="password" name="password" id="password" class="input_txt" maxlength=20 value="${editMember.password}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
			</table>
		</form>
		<iframe name="result" id="result" src="about:blank" frameborder="0"
			width="0" height="0"></iframe>
    <script language="javascript" type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
	<script type="text/javascript" src="js/js_user/com.js"></script>
	<script type="text/javascript" src="js/cookie/cookie.js"></script>
	<script type="text/javascript">
	//alert("0000");
	var dg;
	
	
	var save = "保存";
	var E0002 = "密码不能为空!";
	var E0008 = "会员名不能为空!";
	var E0009 = "权限等级不能为空!";
	var E00010 = "";
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
		
		dg = frameElement.lhgDG;
		dg.addBtn('OK', save, function() {
			$("#memberForm").submit();
			window.close();
		});
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
		if ($("#purview").val().trim() == "") {
			alert(E0009);
			$("#purview").focus();
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