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
		<form action="saveDepartment.do" name="userForm" id="userForm" target="result"
			method="post" onsubmit="return checkInfo();">
			<input name="id" id="id" value="${department.id }" type = "hidden"/>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr class="info">
					<th><label id="staffInfo_name">部门名:</label></th>
					<td><input type="text" name="departmentName" id="departmentName" class="input_txt"	maxlength=20 value="${department.departmentName }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="staffInfo_departmentCategory">部门归属:</label></th>
					<td><input type="text" name="departmentCategory" id="departmentCategory" class="input_txt"	maxlength=20 value="${department.departmentCategory }" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="staffInfo_note">备注:</label></th>
					<td><input type="text" name="note" id="note" class="input_txt"	maxlength=20 value="${department.note }" />
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
	var E0002 = "部门归属不能为空!";
	var E0008 = "部门名不能为空!";
	var E0009 = "权限等级不能为空!";
	var E00010 = "";
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
		if ($("#departmentName").val().trim() == "") {
			alert(E0008);
			$("#departmentName").focus();
			return false;
		}
		if ($("#departmentCategory").val().trim() == "") {
			alert(E0002);
			$("#departmentCategory").focus();
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