<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>XX医养网站</title>
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	 <script src="js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
	 function load() {
            var p = $("#ids").val();
            var div = document.getElementById('type'+p); 
            div.className="here";
	    }
	 </script>
</head>
<body onload="load()">
<input type="hidden" id="ids" name="ids" value="57"/>
<div class="all">

   <%@include file="../common/header.jsp" %>

	<div class="pagebanner">
		<img src="images/pagebanner01.jpg" width="1000" height="332" /></div>

	<div class="pageall">
		<div class="pageall_r">
			<div class="pageall_r_top">
				<div class="pagetitle" id="m_title">积分查看</div>
				<div class="icon02"><img src="images/icon02.jpg" width="20" height="9" /></div>
			</div>
			<div class="pagemain">
				<p id="content">
					<p><span style="font-family:Microsoft YaHei;font-size:16px;">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style="font-size: 16px;"><span style="font-family:Microsoft YaHei;">测试1</span></span></p><p><span style="font-size: 16px;"><span style="font-family:Microsoft YaHei;">&nbsp; &nbsp; &nbsp; 测试2</span></span></p><p><span style="font-size: 16px;"><span style="font-family:Microsoft YaHei;">&nbsp; &nbsp; &nbsp; 测试3</span></span></p>
				</p>

			</div>
		</div>
		<div class="pageall_l">
			<div class="pageall_l_top">
				<div class="yellow">积分管理</div>
				<div class="grey">Point Manage</div>
			</div>
			<div class="pageall_l_sidebar">
				<ul>
									<li><a id="type57" href="pointCheckView.do">积分查看</a></li>
									<li><a id="type58" href="pointChangeView.do">积分兑换</a></li>
									<li><a id="type59" href="pointTransferenceView.do">积分转赠</a></li>
								</ul> 
			</div>

		</div>

		<div class="clear"></div>
	</div>



</div>

﻿<div class="bottom">
<div class="bot">
<div class="bottom_r">
<p style="font-family: Microsoft YaHei;margin-right: 50px">Copyright©2017 All Rights Reserved.锦州市古塔医养服务中心版权所有<br />公司地址：锦州市东二里53号 </p>
</div>
<div class="bottom_l"><img src="images/logo.jpg" width="95" height="90" /></div>
<div class="clear"></div>
</div>
</div>
</body>
</html>