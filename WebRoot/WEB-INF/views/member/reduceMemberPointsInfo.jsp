<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>会员积分维护界面</title>
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
		<form action="confirmReducePoints.do" name="memberForm" id="memberForm" target="result"
			method="post" onsubmit="return checkInfo();">
			<input name="memberId" id="memberId" value="${memberForPoints.memberId }" type = "hidden"/>
			<table border="0" cellpadding="0" cellspacing="0">
			    <tr class="info">
					<th><label id="memberInfo_cardNo">会员号:</label></th>
					<td><input type="text" name="cardNo" id="cardNo" class="input_txt" readonly="readonly" maxlength=20 value="${memberForPoints.cardNo }" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_name">会员名:</label></th>
					<td><input type="text" name="memberName" id="memberName" class="input_txt" readonly="readonly" maxlength=20 value="${memberForPoints.name }" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_idNumber">身份证号:</label></th>
					<td><input type="text" name="idNumber" id="idNumber" class="input_txt" readonly="readonly" maxlength=20 value="${memberForPoints.idNumber}" />
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_totalPoints">减少积分数:</label></th>
					<td><input type="text" name="changePoints" id="changePoints" class="input_txt" maxlength=20 />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_totalPoints">减少积分理由:</label></th>
					<td><textarea name="note" id="note" cols="29" rows="3"></textarea>
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
	var E0002 = "减少分数理由不能为空!";
	var E0008 = "减少分数不能为空!";
	var E0009 = "权限等级不能为空!";
	var E00010 = "";
	var E00011 = "";
	var E00050 = "";
	var E00053 = "";
	//alert("1111");

	$(document).ready(function() {
		dg = frameElement.lhgDG;
		dg.addBtn('ok', save, function() {
			$("#memberForm").submit();
		});
		/* if ($("#dateGraduation").val() == ""){
				$("#state").val(null);
		} */
	});
	
	function checkInfo() {
		/* alert("anwser me quickly!");
		alert($("#jobNo").val()); */
		if ($("#changePoints").val().trim() == "") {
			alert(E0008);
			$("#changePoints").focus();
			return false;
		}
		if ($("#note").val().trim() == "") {
			alert(E0002);
			$("#note").focus();
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