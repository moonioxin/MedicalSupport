<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工管理界面</title>
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
		<form action="saveProduct.do" name="userForm" id="userForm" target="result"
			method="post" onsubmit="return checkInfo();">
			<input name="id" id="id" value="${product.id }" type = "hidden"/>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr class="info">
					<th><label>项目名:</label></th>
					<td><input type="text" name="productName" id="productName" class="input_txt"	maxlength=20 value="${product.productName }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label>所属部门:</label></th>
					<td>
					<select name="department" id="department" style="WIDTH: 205px;height: 25px"  onchange="">
						<option value="0"></option>
						<c:forEach items="${listInfo.departmentList}" var="department" varStatus="vs">
						  <OPTION value="${department.id}" <c:if test="${product.department eq department.id}">SELECTED</c:if>>${department.departmentName}</OPTION>
						</c:forEach>
					</select>
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label>所需积分:</label></th>
					<td><input type="text" name="needPoint" id="needPoint" class="input_txt"	maxlength=20 value="${product.needPoint }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label>所属现金:</label></th>
					<td><input type="text" name="needCash" id="needCash" class="input_txt"	maxlength=20 value="${product.needCash }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
			</table>
		</form>
		<iframe name="result" id="result" src="about:blank" frameborder="0"
			width="0" height="0"></iframe>
    <script language="javascript" type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>  
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
	<script type="text/javascript" src="js/js_user/com.js"></script>
	<script type="text/javascript" src="js/cookie/cookie.js"></script>
	<script type="text/javascript">
	//alert("0000");
	var dg;
	
	
	var save = "保存";
	var E0002 = "所属部门不能为空!";
	var E0008 = "产品名不能为空!";
	var E0009 = "所需积分不能为空!";
	var E00010 = "所需现金不能为空!";
	var E00011 = "";
	var E00050 = "";
	var E00053 = "";
	//alert("1111");

	$(document).ready(function() {
		dg = frameElement.lhgDG;
		dg.addBtn('ok', save, function() {
			$("#userForm").submit();
		});
		/* if ($("#dateGraduation").val() == ""){
				$("#state").val(null);
		} */
	});
	
	function checkInfo() {
		/* alert("anwser me quickly!");
		alert($("#jobNo").val()); */
		$("#adminType").val($("#adminTypeS").val());
		if ($("#productName").val().trim() == "") {
			alert(E0008);
			$("#productName").focus();
			return false;
		}
		if ($("#department").val().trim() == "" || $("#department").val().trim() == "0") {
			alert(E0002);
			$("#department").focus();
			return false;
		}
		if ($("#needPoint").val().trim() == "") {
			alert(E0009);
			$("#needPoint").focus();
			return false;
		}
		if ($("#needCash").val().trim() == "") {
			alert(E00010);
			$("#needCash").focus();
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