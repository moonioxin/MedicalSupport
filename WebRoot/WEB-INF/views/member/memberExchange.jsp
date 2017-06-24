<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎</title>
<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/flexigrid.pack.css" />
	<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="js/Flexigrid/flexigrid.js"></script>
	<script type="text/javascript" src="js/Flexigrid/flexigrid.pack.js"></script>
	<script type="text/javascript" src="js/lhgdialog/lhgdialog.min.js?t=self&s=areo_gray"></script>
	<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
	<script type="text/javascript" src="js/js_user/com.js"></script>
	<script type="text/javascript" src="js/cookie/cookie.js"></script>
	
	<style type="text/css">
       body,table{
         font-size:13px;
         font-family: Microsoft YaHei, Helvetica, sans-serif;
       }
       label{
         color:black;
       }
    </style>
	<script type="text/javascript">
	
	var language = getCookieValue("language");
	var tblname ="";
	var tblgender = "";
	var tblposition = "";
	var tbldepartment = "";
	var tblbranch = "";
	var tblsuperior="";
	var tblemail ="";
	var tblstateName="";
	var tblrole="";
	var tbladd="";
	var tbldelete="";
	var tbledit="";
	var tbldownloadStaff="";
	var tbluploadStaff="";
	var tblpagestat="";
	var tbltitle="";
	var I0004="";
	var I0005="";
	var I0006="";
	var rowtitle="";
	var tbldownloadtitle="";
	var I0007="";
	var tbluploadtitle="";
	var I0008="";
	var tbldeleteinfo1="";
	var tbldeleteinfo2="";
	var I0002="";
	var tbladduser = "";
	var I0009 = "";
	var tblupduser="";
	var tblcancel="";
	var tbldateQuitCompany="";
	var tblcomment="";
	var E00045="";
	var E00046="";
	var E00047="";
	var E00048="";
	var staff_string_deleteComplete="";
	var staff_string_deleteFailed="";
	
    function successReload(){
	    $('#gridTable').flexOptions().flexReload();
	}
	$(document).ready(function(){
	/**
	 * add event dialog
	 */
		$("#query").click(function() {
						var staffID   = $("#staffid").val();
				        var staffName       = $("#staffname").val();
				        var params = [{"name" : "id","value" : staffID}
				                     ,{"name" : "productName","value" : staffName}
				                     ];
				        $('#gridTable').flexOptions({params : params, newp : 1}).flexReload(); 
	    });
		
		$("#cardNo").blur(function(){
			cardNo = $("#cardNo").val().trim();
		    $.ajax({
		        type: "post",
		        dataType: "json",
		        url: 'selectPointInfo.do',
		        data: {cardNo: cardNo},
		        success: function (data) {
		            $("#cardNo").val(data.result.cardNo);
		            $("#name").val(data.result.name);
		            $("#idNumber").val(data.result.idNumber);
		            $("#leftPoints").val(data.result.leftPoints);
		            $("#leftAmount").val(data.result.leftAmount);
		        }
		    });
		  });
	
		//CHI追加button处理
		$("#add").click(function() {
			var dg = new $.dialog({
				title:'新增消费项目',
				id:'user_new',
				width:500,
				height:400,
				iconTitle:false,
				cover:true,
				maxBtn:false,
				xButton:true,
				resize:false,
				page:'addProduct.do'
				});
			dg.ShowDialog();
		});
		//编集button处理
		$("#edit").click(function() {
			var ids = "";
			$('#gridTable .trSelected td:nth-child(1) div').each(function(i) {
				  if (i) ids += ',';
				  ids += $(this).text();
			});
			if(ids=="")
		    {alert("选择一行进行兑换!");}
			else{
			    var dg = new $.dialog({
			        title:'兑换商品',
			        id:'user_edit',
			        width:500,
			        height:500,
			        iconTitle:false,
			        cover:true,
			        maxBtn:false,
			        xButton:false,
			        resize:false,
			        page:'exchangeProduct.do?id='+ids
			    });
				dg.ShowDialog();
			}
		});
		//删除button处理
		$("#delete").click(function() {
			selected_count = $('#gridTable .trSelected').length;
		    if (selected_count == 0) {
			    alert("请选择一条记录!");
			    return;
		    }
		    var name = '';
		    var ids = '';
			    $('#gridTable .trSelected td:nth-child(2) div').each(function(i) {
			    	if (i)  name += ',';
					name += $(this).text();
				});
			    
			    $('#gridTable .trSelected td:nth-child(1) div').each(function(i) {
					if (i) ids += ','; 
					ids += $(this).text();
				});
		    if (confirm("确定删除消费项目[" + name + "]?")) {
				$.ajax({ 
				        type: "post", 
				        url: "deleteProducts.do?ids="+ids, 
				        dataType: "json", 
				        success: function (data) {
	                        if(data.result == "success"){
	                            alert("删除成功!");
	                            	$('#gridTable').flexReload();
	                        }else{
	                            alert("删除失败!");
	                        }
				        }, 
				        error: function (XMLHttpRequest, textStatus, errorThrown) { 
				            alert("网络传输错误,请刷新或稍后重试!!"); 
				        } 
				});
		    }
		});
		
		$("#gridTable").flexigrid({
			
			url : 'listProduct.do',
			dataType : 'json',
			colModel : [ 
			 {
				display : 'ID',
				name : 'id',
				width : 100,
				sortable : false,
				align : 'left',
			}, 
			{
				display : '项目名',
				name : 'productName',
				width : 150,
				sortable : false,
				align : 'center'
			},
			{
				display : '所属部门',
				name : 'departmentName',
				width : 150,
				sortable : false,
				align : 'center'
			},
			{
				display : '所需积分',
				name : 'needPoint',
				width : 100,
				sortable : false,
				align : 'right'
			},
			{
				display : '所需现金',
				name : 'needCash',
				width : 150,
				sortable : false,
				align : 'right'
			},
			{
				display : '创建者',
				name : 'creator',
				width : 100,
				sortable : true,
				align : 'left'
			},
			{
				display : '创建时间',
				name : 'createTimeString',
				width : 200,
				sortable : true,
				align : 'left'
			}  ],
			useRp: true,
			pagestat : tblpagestat,
			sortname : "id",
			title: '消费项目维护',
			method : 'POST', 
			showToggleBtn : false,
			sortorder : "asc",
			autoload : false,
			usepager : true,
			query: '',
			useRp : true,
			nomsg : I0004,
			rp : 15,
			singleSelect : true,
			showTableToggleBtn : true,
			onRowDblclick : rowDblclick,
			procmsg : I0005, 
			width : 1000,
			height : 'auto'
		});
		
		var staffID   = $("#staffid").val();
        var staffName       = $("#staffname").val();
        var params = [{"name" : "id","value" : staffID}
                     ,{"name" : "productName","value" : staffName}
                     ];
        $('#gridTable').flexOptions({params : params, newp : 1}).flexReload();
	});
		 function rowDblclick(rowData){
		    var staffId = $(rowData).data("staffID").toString(); 
		     var dg = new $.dialog({
				        title:rowtitle,
				        id:'user_more',
				        width:500,
				        height:400,
				        iconTitle:false,
				        cover:true,
				        maxBtn:false,
				        xButton:true,
				        cancelBtnTxt:tblcancel,
				        resize:false,
				        page:'staff/more.do?id='+staffId
				    });
    		dg.ShowDialog();
         }
    </script>
</head>
<body style="width:1300px;" >
	<p style="height:15px;"></p>
 	<table id="search_condition_cxee">
<!--  	    <tr class="info"> -->
<!--  	        <td style="width:5px;"> -->
<!-- 			<td style="width:188px;"> -->
<!-- 			    <label id="memberInfo_cardNo">会员号:</label> -->
<%-- 			    <input type="text" name="cardNo" id="cardNo"  style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20" maxlength=20 value="${pointInfo.cardNo }" /> --%>
<!-- 			</td> -->
<!-- 			<td><label id="memberInfo_name">会员名:</label> -->
<%-- 			<input type="text" name="name" id="name"  style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20" readonly="readonly" maxlength=20 value="${pointInfo.name }" /> --%>
<!-- 			</td> -->
<!-- 			<td><label id="memberInfo_leftPoints">剩余积分:</label> -->
<%-- 			<input type="text" name="leftPoints" id="leftPoints"  style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20" readonly="readonly" maxlength=20 value="${pointInfo.totalPoints}" /> --%>
<!-- 			<label style="color:red;">*</label> -->
<!-- 			</td> -->
<!-- 			<td><label id="memberInfo_leftAmount">剩余金额:</label> -->
<%-- 			<input type="text" name="leftAmount" id="leftAmount"  style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20" readonly="readonly" maxlength=20 value="${pointInfo.totalPoints}" /> --%>
<!-- 			<label style="color:red;">*</label> -->
<!-- 			</td> -->
<!-- 		</tr> -->
        <tr>
            <td style="width:5px;">
            <td style="width:118px;">
                <label id="staff_id">ID:</label>
			    <input type="text" id="staffid" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>	
            <td style="width:188px;">
                <label id="staff_name">项目名:</label>
			    <input type="text" id="staffname" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>
			<td style="width:auto;">
                <input id="query" type="button" value="查询" style="margin-left:5px; padding: .2em;">
<!--                 <input id="add" type="button" value="增加" style="margin-left:5px; padding: .2em;"> -->
                <input id="edit" type="button" value="兑换" style="margin-left:5px; padding: .2em;">
<!--                 <input id="delete" type="button" value="删除" style="margin-left:5px; padding: .2em;"> -->
            </td>
        </tr>
 </table>
 <p style="height:10px;"></p>
 <div id="gridCXEE">
<table id="gridTable" style="width:950px;"></table>
</div>
</body>
</html>