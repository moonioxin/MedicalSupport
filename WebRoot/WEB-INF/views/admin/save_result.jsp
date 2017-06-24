<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="images\gtyytb.ico" />
<title>保存结果</title>
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/Flexigrid/flexigrid.js"></script>
	<script type="text/javascript" src="js/Flexigrid/flexigrid.pack.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_gray"></script>
	<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
	<script type="text/javascript" src="js/js_user/com.js"></script>
	<script type="text/javascript" src="js/cookie/cookie.js"></script>

<script type="text/javascript"><!--
var dg;
		$(document).ready(function() {
		dg = frameElement.lhgDG;
		dg.addBtn('ok', '保存', function() {
			$("#userForm").submit();
		});
		/*if ($("#id").val() != "") {
			$("#username").attr("readonly", "readonly");
			$("#username").css("color", "gray");
			var state = "${user.state}";
			if (state != "") {
				$("#state").val(state);
			}
		}*/
	});
function success() {
			if (dg.curWin.document.forms[0]) {
				dg.curWin.document.forms[0].action = dg.curWin.location + "";
				dg.curWin.document.forms[0].submit();
			} else {
				dg.curWin.location.reload();
			}
			dg.cancel();
		}

		function failed() {
			alert("新增失败，该用户名已存在！");
			//$("#username").select();
			//$("#username").focus();
		}
		--></script>
</head>
<body>
	<script type="text/javascript">
		var msg = "${msg}";

	    alert(msg);
		parent.success();
	</script>
</body>
</html>