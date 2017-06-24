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
						var memberID   = $("#memberid").val();
				        var cardNo       = $("#membercardNo").val();
				        var idNumber   = $("#memberidNumber").val();
				        var memberName = $("#membername").val();
				        var params = [{"name" : "memberID","value" : memberID}
				                     ,{"name" : "cardNo","value" : cardNo}
				                     ,{"name" : "idNumber","value" : idNumber}
				                     ,{"name" : "memberName","value" : memberName}
				                     ];
				        $('#gridTable').flexOptions({params : params, newp : 1}).flexReload(); 
	    });
		
		//编集button处理
		$("#add").click(function() {
			var ids = "";
			$('#gridTable .trSelected td:nth-child(1) div').each(function(i) {
				  if (i) ids += ',';
				  ids += $(this).text();
			});
			if(ids=="")
		    {alert("选择一行编辑!");}
			else{
			    var dg = new $.dialog({
			        title:tblupduser,
			        id:'user_edit',
			        width:500,
			        height:400,
			        iconTitle:false,
			        cover:true,
			        maxBtn:false,
			        xButton:true,
			        resize:false,
			        page:'addPoints.do?memberId='+ids
			    });
				dg.ShowDialog();
			}
		});
		
		$("#reduce").click(function() {
			var ids = "";
			$('#gridTable .trSelected td:nth-child(1) div').each(function(i) {
				  if (i) ids += ',';
				  ids += $(this).text();
			});
			if(ids=="")
		    {alert("选择一行编辑!");}
			else{
			    var dg = new $.dialog({
			        title:tblupduser,
			        id:'user_edit',
			        width:500,
			        height:400,
			        iconTitle:false,
			        cover:true,
			        maxBtn:false,
			        xButton:true,
			        resize:false,
			        page:'reducePoints.do?memberId='+ids
			    });
				dg.ShowDialog();
			}
		});
		
		$("#gridTable").flexigrid({
			
			url : 'listPointInfo.do',
			dataType : 'json',
			colModel : [ 
			 {
				display : '会员ID',
				name : 'memberId',
				width : 200,
				sortable : false,
				align : 'left',
			}, 
			{
				display : '会员卡号',
				name : 'cardNo',
				id:'name',
				width : 100,
				sortable : false,
				align : 'center'
			},
			{
				display : '会员名',
				name : 'name',
				width : 100,
				sortable : true,
				align : 'left'
			},
			{
				display : '身份证号',
				name : 'idNumber',
				width : 200,
				sortable : true,
				align : 'left'
			},
			{
				display : '积分',
				name : 'leftPoints',
				width : 200,
				sortable : true,
				align : 'left'
			},
			{
				display : '余额',
				name : 'leftAmount',
				width : 200,
				sortable : true,
				align : 'left'
			}
			],
			useRp: true,
			pagestat : tblpagestat,
			sortname : "memberID",
			title: '会员积分维护',
			method : 'POST', 
			showToggleBtn : false,
			sortorder : "asc",
			autoload : false,
			usepager : true,
			query: '',
			useRp : true,
			nomsg : I0004,
			rp : 15,
			showTableToggleBtn : true,
			onRowDblclick : rowDblclick,  
			procmsg : I0005, 
			width : 1050,
			height : 'auto'
		});
		
		var memberID   = $("#memberid").val();
        var cardNo       = $("#membercardNo").val();
        var idNumber   = $("#memberidNumber").val();
        var memberName = $("#membername").val();
        var params = [{"name" : "memberID","value" : memberID}
                     ,{"name" : "cardNo","value" : cardNo}
                     ,{"name" : "idNumber","value" : idNumber}
                     ,{"name" : "memberName","value" : memberName}
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
<body style="width:1050px;" >
	<p style="height:15px;"></p>
 	<table id="search_condition_cxee">
        <tr>
            <td style="width:5px;">
            <td style="width:130px;">
                <label id="member_id">会员ID:</label>
			    <input type="text" id="memberid" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>
			<td style="width:150px;">
                <label id="member_cardNo">会员卡号:</label>
			    <input type="text" id="membercardNo" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>	
            <td style="width:130px;">
                <label id="member_name">会员名:</label>
			    <input type="text" id="membername" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>
			<td style="width:188px;">
                <label id="member_idNumber">身份证号:</label>
			    <input type="text" id="memberidNumber" style="margin-bottom:5px; width:68px; padding: .2em;" maxlength="20"/>
			</td>
			<td style="width:auto;">
                <input id="query" type="button" value="查询" style="margin-left:5px; padding: .2em;"> 
                <input id="add" type="button" value="增加" style="margin-left:5px; padding: .2em;">
                <input id="reduce" type="button" value="减少" style="margin-left:5px; padding: .2em;">
            </td>
        </tr>
 </table>
 <p style="height:10px;"></p>
 <div id="gridCXEE">
<table id="gridTable" style="width:1050px;"></table>
</div>
</body>
</html>