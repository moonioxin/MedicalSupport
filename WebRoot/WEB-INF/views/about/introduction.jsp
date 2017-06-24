<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>锦州市古塔医养服务中心</title>
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
<!-- 	<div class="header" style="margin-bottom: 10px"> -->



<!-- <form action="searchword.html" method="post"> -->
<!-- 	<div class="search"> -->
<!-- 	<input type="submit" value="搜索" class="button01" style="width: 50px;color: white;"> -->
<!-- 	<input id="word" name="wordInfo" type="text" value="" placeholder="请输入关键字"/> -->
<!-- 	<div class="clear"></div> -->
<!-- 	</div> -->
<!-- </form> -->
<!-- <div class="logo"><img src="images/logo432.jpg" width="208" height="71" /></div> -->
<!-- <div class="clear"></div> -->

<!-- <a href="http://oa.zjjiayuan.cn/login/Login.jsp?logintype=1&gopage=&message=" style="float: right;font-family: Microsoft YaHei;">会员登录</a> -->
<!-- <a href="http://jiayuan.mordo-care.com/" style="float: right;font-family: Microsoft YaHei;">会员注册&nbsp;|&nbsp;</a> -->
<!-- </div> -->


<!-- 	<div class="naver"> -->
<!-- <ul> -->
<!-- <li ><a href="index.html">首页</a></li> -->
<!-- <li class="here"><a href="about_57.html">关于我们</a></li> -->
<!-- <li ><a href="interface.html">医患交互</a></li> -->
<!-- <li ><a href="community_66.html">积分管理</a></li> -->
<!-- <li ><a href="health.html">便民服务</a></li> -->
<!-- <li ><a href="contact.html">预约挂号</a></li> -->
<!-- </ul> -->
<!-- </div> -->

   <%@include file="../common/header.jsp" %>

	<div class="pagebanner">
		<img src="images/pagebanner01.jpg" width="1000" height="332" /></div>

	<div class="pageall">
		<div class="pageall_r">
			<div class="pageall_r_top">
				<div class="pagetitle" id="m_title">锦州市古塔医养服务中心</div>
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
				<div class="yellow">关于我们</div>
				<div class="grey">ABOUT US</div>
			</div>
			<div class="pageall_l_sidebar">
				<ul>
									<li><a id="type57" href="introductionView.do">企业介绍</a></li>
									<li><a id="type58" href="organizationalStructureView.do">组织架构</a></li>
									<li><a id="type59" href="notionView.do">企业理念</a></li>
									<li><a id="type60" href="honorView.do">企业荣誉</a></li>
								</ul> 
			</div>

		</div>

		<div class="clear"></div>
	</div>



</div>

﻿<div class="bottom">
<div class="bot">
<div class="bottom_r">
<p style="font-family: Microsoft YaHei;margin-right: 50px">Copyright©2017 All Rights Reserved.锦州市古塔区医养服务中心 版权所有<br />公司地址：锦州市东二里53号 </p>
</div>
<div class="bottom_l"><img src="images/logo.jpg" width="95" height="90" /></div>
<div class="clear"></div>
</div>
</div>
</body>
</html>