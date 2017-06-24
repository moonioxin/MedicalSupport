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
		<form action="" name="memberForm" id="memberForm" target="result" method="post" onsubmit="return checkInfo();">
			<input name="memberID" id="memberID" value="${pointInfo.memberID }" type = "hidden"/>
			<input type="hidden" name="productId" id="productId" value="${product.id}"/>
			<table border="0" cellpadding="0" cellspacing="0">
			    <tr class="info">
					<th><label id="memberInfo_cardNo">会员号:</label></th>
					<td><input type="text" name="cardNo" id="cardNo" class="input_txt" maxlength=20 value="${pointInfo.cardNo }" /><label style="color:red;">*</label></td>
				</tr>
				<tr class="info">
				    <th><label id="memberInfo_name">会员名:</label></th>
					<td><input type="text" name="name" id="name" class="input_txt" readonly="readonly" maxlength=20 value="${pointInfo.name }" />
					</td>
				</tr>
				<tr class="info">
				    <th><label id="memberInfo_leftPoints">剩余积分:</label></th>
					<td><input type="text" name="leftPoints" id="leftPoints" class="input_txt" readonly="readonly" maxlength=20 value="${pointInfo.totalPoints}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
				    <th><label id="memberInfo_leftAmount">剩余金额:</label></th>
					<td><input type="text" name="leftAmount" id="leftAmount" class="input_txt" readonly="readonly" maxlength=20 value="${pointInfo.totalPoints}" />
					<label style="color:red;">*</label>
					</td>
				</tr>
				<tr class="info">
					<th><label id="memberInfo_rechargeAmount">消费项目:</label></th>
					<td><input type="text" name="productName" id="productName" class="input_txt" readonly="readonly" maxlength=20  value="${product.productName}"/></td>
					
<!-- 					<td><select id="productItems" > -->
<!--                         <option value ="0" selected="selected">--请选择--</option> -->
<!--                       </select> -->
<!-- 					</td><td /> -->
				</tr>
				<tr><label></label></tr>
				<tr><label></label></tr>
				<tr><label></label></tr>
				<tr><label></label></tr>
				<tr class="info">
					<th><label>所需积分:</label></th>
					<td><input type="text" name="needPoint" id="needPoint" class="input_txt" readonly="readonly" maxlength=20  value="${product.needPoint}"/></td>
				</tr>
				<tr class="info">
				    <th><label>所需金额:</label></th>
					<td><input type="text" name="needCash" id="needCash" class="input_txt" readonly="readonly" maxlength=20  value="${product.needCash}"/></td>
				</tr>
				<tr class="info">
				    <th><label>额外需收取金额:</label></th>
					<td><input type="text" name="extraCash" id="extraCash" class="input_txt" readonly="readonly" maxlength=20  value=""/></td>
				</tr>
				<tr class="info">
					<td><input id="exchange" type="button" value="确定兑换" style="margin-left:50px; padding: .2em;" />
					</td><td />
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
	var E0008 = "请输入正确的会员卡号!";
	var E0009 = "请选择消费项目!";
	var E0010 = "剩余积分不足!";
	var E0011 = "剩余余额不足!";
	var E0050 = "";
	var E0053 = "";
	
	//alert("1111");
    var cardNo = "";
    var productId = "";
	$(document).ready(function() {
// 		$.ajax({
// 	        type: "post",
// 	        dataType: "json",
// 	        url: 'selectProductInfo.do',
// 	        data: {productId : productId},
// 	        success: function (dataList) {
// 	        	$("#productItems").empty();
// 	        	$("#productItems").append("<option value='0'>--请选择--</option>");
	        	
// 	        	if(!dataList) {
// 	        		return;
// 	        	}
// 	        	for(var i = 0; i < dataList.length; i++) {
// 	        		$("#productItems").append(
// 	        				"<option value='" + dataList[i].id + "'>" + dataList[i].productName 
// 	        				      + "</option>")
// 	        	}
	        	
// 	        }
// 	    });
		
// 		$("#productItems").change(function(){
// 			productId = $("#productItems").val().trim();
// 		    $.ajax({
// 		        type: "post",
// 		        dataType: "json",
// 		        url: 'selectProductInfo.do',
// 		        data: {productId : productId},
// 		        success: function (data) {
// 		            $("#needPoint").val(data[0].needPoint);
// 		            $("#needCash").val(data[0].needCash);
// 		        }
// 		    });
// 		  });
		
		var card=document.getElementById("cardNo");
		card.oninput = function(){
			cardNo = $("#cardNo").val().trim();
			productId = $("#productId").val();
		    $.ajax({
		        type: "post",
		        dataType: "json",
		        url: 'selectPointInfo.do',
		        data: {cardNo: cardNo, productId: productId},
		        success: function (data) {
		            $("#cardNo").val(data.result.cardNo);
		            $("#name").val(data.result.name);
		            $("#idNumber").val(data.result.idNumber);
		            $("#leftPoints").val(data.result.leftPoints);
		            $("#leftAmount").val(data.result.leftAmount);
		            $("#extraCash").val(data.result.extraCash);
		        }
		    });
		  };
		
// 		$("#cardNo").blur(function(){
// 			cardNo = $("#cardNo").val().trim();
// 		    $.ajax({
// 		        type: "post",
// 		        dataType: "json",
// 		        url: 'selectPointInfo.do',
// 		        data: {cardNo: cardNo},
// 		        success: function (data) {
// 		            $("#cardNo").val(data.result.cardNo);
// 		            $("#name").val(data.result.name);
// 		            $("#idNumber").val(data.result.idNumber);
// 		            $("#leftPoints").val(data.result.leftPoints);
// 		            $("#leftAmount").val(data.result.leftAmount);
// 		        }
// 		    });
// 		  });
		
		$("#exchange").click(function(){
			if ($("#leftPoints").val() == "" || $("#leftAmount").val() == "") {
				alert(E0008);
				$("#cardNo").focus();
				return false;
			}
			
			if ($("#productItems").val() == "0") {
				alert(E0009);
				$("#productItems").focus();
				return false;
			}
			
			var leftPoints = parseInt($("#leftPoints").val());
			var leftAmount = parseInt($("#leftAmount").val());
			
			var needPoint = parseInt($("#needPoint").val());
			var needCash = $("#needCash").val();
			var cash = $("#extraCash").val();
			
			if(leftPoints<needPoint) {
				alert(E0010);
				return false;
			}
			
// 			if(leftAmount<needCash) {
// 				alert(E0011);
// 				return false;
// 			}
			
			var cardNo = $("#cardNo").val();
			var productId = $("#productId").val();
			if (confirm("确定兑换吗？")) {  
				$.ajax({
			        type: "post",
			        dataType: "json",
			        url: 'doExchange.do',
			        data: {
			        	"cardNo": cardNo, 
			        	"productId": productId
			        },
			        success: function (data) {
			            alert(data.result);
			        }
			    });
		    }
		});
	});
	
	
	function checkInfo() {
		/* alert("anwser me quickly!");
		alert($("#jobNo").val()); */
		if ($("#rechargeAmount").val().trim() == "") {
			alert(E0008);
			$("#rechargeAmount").focus();
			return false;
		}
		

		if (confirm("确定充值吗？")) {  
	        return true;
	    }
		else {
			return false;
		}
	}
	
	function success() {
		frameElement.lhgDG.curWin.successReload(); 
		dg.cancel();
	}
</script>
	</body>
</html>