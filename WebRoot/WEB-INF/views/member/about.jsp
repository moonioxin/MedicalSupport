<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>XX医养网站</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/lrtk.js"></script>
<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.slideBox.js" type="text/javascript"></script>
<script>
jQuery(function($){
	$('#demo1').slideBox();
	$('#demo2').slideBox({
		direction : 'top',//left,top#方向
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		startIndex : 1//初始焦点顺序
	});
	$('#demo3').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
	$('#demo4').slideBox({
		hideBottomBar : true//隐藏底栏
	});
});

function turn1() {
	if($("#goverment").val()!==""){
		window.open($("#goverment").val());
	}
}
function turn2() {
	if($("#partent").val()!==""){
		window.open($("#partent").val());
	}
}
function turn3() {
	if($("#hot").val()!==""){
		window.open($("#hot").val());
	}
}
</script>
</head>

<body>
<div class="all"><div class="header" style="margin-bottom: 10px">
<form action="searchword.html" method="post">
	<div class="search">
	<input type="submit" value="搜索" class="button01" style="width: 50px;color: white;">
	<input id="word" name="wordInfo" type="text" value="" placeholder="请输入关键字"/>
	<div class="clear"></div>
	</div>
</form>
<div class="logo"><img src="images/logo.jpg" width="208" height="71" /></div>
<div class="clear"></div>

<a href="http://oa.zjjiayuan.cn/login/Login.jsp?logintype=1&gopage=&message=" style="float: right;font-family: Microsoft YaHei;">会员登录</a>
<a href="http://jiayuan.mordo-care.com/" style="float: right;font-family: Microsoft YaHei;">会员注册&nbsp;|&nbsp;</a>
</div> <div class="naver">
<ul>
<li class="here"><a href="index.html">首页</a></li>
<li ><a href="about_57.html">关于我们</a></li>
<li ><a href="interface.html">医患交互</a></li>
<li ><a href="pointManager_1.html">积分管理</a></li>
<li ><a href="convenienceService.html">便民服务</a></li>
<li ><a href="appointment.html">预约挂号</a></li>
</ul>
</div>


<div class="boxA">
<div id="demo1" class="slideBox" style="float: left">
  <ul class="items">
                <li><a href="news_detail.html?id=258" title="测试1"><img src="css/upload/72af82df4e790e4d.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=256" title="测试2"><img src="css/upload/9707a9c62bdc1c6a.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=254" title="测试3"><img src="css/upload/ad8e72f7b4770803.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=250" title="测试4"><img src="css/upload/dc20a28c9e4cb773.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=247" title="测试5"><img src="css/upload/6208e6185c41fe46.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=240" title="测试6"><img src="css/upload/014818c4ba603d74.jpg" style="height: 285px;width: 500px"/></a></li>
            <li><a href="news_detail.html?id=239" title="测试7"><img src="css/upload/b4d66647f6c7a390.jpg" style="height: 285px;width: 500px"/></a></li>
        </ul>
</div>
<div>
<ul style="float: right;height: 30px;line-height: 30px">
<li>
	<div class="boxA_r_title">
	<div class="more01"><a href="news_62_1.html">MORE</a></div>
	<div class="title01">集团新闻</div>
	<div class="icon01"><img src="images/icon01.jpg" width="12" height="6" /></div>
	<div class="clear"></div>
	</div>
	<dl>
		<dd><a href="news_detail.html?id=267"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px"> 测试1</a></dd>
		<dd><a href="news_detail.html?id=258"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px">测试2</a></dd>
		<dd><a href="news_detail.html?id=256"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px">测试3</a></dd>
		<dd><a href="news_detail.html?id=254"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px">测试4</a></dd>
		<dd><a href="news_detail.html?id=250"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px">测试5</a></dd>
		<dd><a href="news_detail.html?id=247"
		style=" width:490px;display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei;font-size: 16px">测试6</a></dd>
		</dl>
	</li>
</ul>
</div>
</div>



<div class="banner"><img src="images/banner.jpg" width="1000"
	height="104" /></div>
<div class="boxB">
<div class="boxB_r">
<ul>
	<li class="here"><a href="index.html">首页</a></li>
    <li ><a href="about_57.html">关于我们</a></li>
    <li ><a href="policy.html">医患交互</a></li>
    <li ><a href="community_66.html">积分管理</a></li>
    <li ><a href="health.html">便民服务</a></li>
    <li ><a href="contact.html">预约挂号</a></li>
</ul>
</div>
<div class="boxB_l">
<ul>
	<li class="boxB_news">
	<div class="boxA_r_title">
	<div class="more01"><a href="news_63_1.html">MORE</a></div>
	<div class="title01">行业新闻</div>
	<div class="icon01"><img src="images/icon01.jpg" width="12" height="6" /></div>
	<div class="clear"></div>
	</div>
	<dl>
				<dd><a href="news_detail.html?id=255"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试1</a></dd>
				<dd><a href="news_detail.html?id=251"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试2</a></dd>
				<dd><a href="news_detail.html?id=234"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试3</a></dd>
				<dd><a href="news_detail.html?id=197"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试4</a></dd>
				<dd><a href="news_detail.html?id=196"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试5</a></dd>
				<dd><a href="news_detail.html?id=171"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试6</a></dd>
				<dd><a href="news_detail.html?id=130"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试7</a></dd>
		
	</dl>
	</li>
	<li class="boxB_news" style="margin-right: 0px;">
	<div class="boxA_r_title">
	<div class="more01"><a href="news_80_1.html">MORE</a></div>
	<div class="title01">优秀案例</div>
	<div class="icon01"><img src="images/icon01.jpg" width="12" height="6" /></div>
	<div class="clear"></div>
	</div>
	<dl>
				<dd><a href="news_detail.html?id=242"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试1</a></dd>
				<dd><a href="news_detail.html?id=241"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试2</a></dd>
				<dd><a href="news_detail.html?id=231"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试3</a></dd>
				<dd><a href="news_detail.html?id=199"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试4</a></dd>
				<dd><a href="news_detail.html?id=195"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试5</a></dd>
				<dd><a href="news_detail.html?id=186"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试6</a></dd>
				<dd><a href="news_detail.html?id=184"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试7</a></dd>
		
	</dl>
	</li>
	<li class="boxB_news"style="margin-top: 10px">
	<div class="boxA_r_title" >
	<div class="more01"><a href="news_81_1.html">MORE</a></div>
	<div class="title01">管理解读</div>
	<div class="icon01"><img src="images/icon01.jpg" width="12" height="6" /></div>
	<div class="clear"></div>
	</div>
	<dl>
				<dd><a href="news_detail.html?id=252"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试1</a></dd>
				<dd><a href="news_detail.html?id=198"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试2</a></dd>
				<dd><a href="news_detail.html?id=192"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试3</a></dd>
				<dd><a href="news_detail.html?id=181"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试4</a></dd>
				<dd><a href="news_detail.html?id=180"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试5</a></dd>
				<dd><a href="news_detail.html?id=170"
			style="color: #4c4c4c; width: 100%; display: block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试6</a></dd>
		
	</dl>
	</li>
	<li class="boxB_news" style="margin-right: 0px;margin-top: 10px">
	<div class="boxA_r_title">
	<div class="more01"><a href="policy.html">MORE</a></div>
	<div class="title01">政策法规</div>
	<div class="icon01"><img src="images/icon01.jpg" width="12" height="6" /></div>
	<div class="clear"></div>
	</div>
	<dl>
				<dd><a href="news_detail.html?id=249"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试1</a></dd>
				<dd><a href="news_detail.html?id=236"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试2</a></dd>
				<dd><a href="news_detail.html?id=233"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试3</a></dd>
				<dd><a href="news_detail.html?id=229"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试4</a></dd>
				<dd><a href="news_detail.html?id=228"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试5</a></dd>
				<dd><a href="news_detail.html?id=227"
			style="color: #4c4c4c; width: 100%; display: block;  overflow: hidden; text-overflow: ellipsis; white-space: nowrap;font-family: Microsoft YaHei">测试6</a></dd>
		
	</dl>
	</li>
</ul>
</div>
<div class="clear"></div>
</div>
<div class="link">
<ul>
	<li style="width:190px;"><select id="goverment" name="" size="1" onchange="toLinkPage(this.value)">
		<option value="">政府机构</option>
					<option value="http://preview.www.mca.gov.cn/">测试1</option>
					<option value="http://www.nhfpc.gov.cn/">测试2</option>
					<option value="http://www.cncaprc.gov.cn/">测试3</option>
					<option value="http://www.zgllcy.org/chanye/">测试4</option>
					<option value="http://www.zjmz.gov.cn/">测试5</option>
					<option value="http://www.jiaxing.gov.cn/">测试6</option>
					<option value="http://www.zjwst.gov.cn/">测试7</option>
					<option value="http://www.jxsmz.gov.cn/New/">测试8</option>
	</select></li>
	<li style="width:190px;"><select id="partent" name="" size="1" onchange="toLinkPage(this.value)">
		<option value="">合作伙伴</option>
					<option value="http://www.morhome.com.cn/">测试1</option>
					<option value="http://www.sidhilchina.com/">测试2</option>
					<option value="http://www.mordo-iot.com/">测试3</option>
					<option value="http://www.tianchengsmart.com/">测试4</option>
	</select></li>
	<li style="width:190px;"><select id="hot" name="" size="1" onchange="toLinkPage(this.value)">
		<option value="">热门站点</option>
					<option value="http://www.rymanhealthcare.co.nz/">测试1</option>
					<option value="http://www.huichenlife.com/">测试2</option>
					<option value="http://www.yiheyuan365.com/">测试3</option>
					<option value="http://www.nichii.net.cn">测试4</option>
					<option value="http://www.jadetowerccrc.com/index.html">测试5</option>
					<option value="http://www.xfj.vanke.com/Home">测试6</option>
					<option value="http://www.gongheyuan.com/">测试7</option>
	</select></li>
    
    <li style="width:190px;"><select id="hot" name="" size="1" onchange="toLinkPage(this.value)">
		 <option>佳源控股</option>
			<option value="http://www.xingdingan-hotel.cn/">测试1</option>
					<option value="http://www.shimaogardenhotel.com/">测试2</option>
					<option value="http://www.jy-wuye.com/">测试3</option>
					<option value="http://www.5star.cn/">测试4</option>
					<option value="http://www.jiayuanintl.com/tc/index.php">测试5</option>
					<option value="http://www.skuo.com.cn/">测试6</option>
					<option value="http://www.zjjiayuan.cn/">测试7</option>
			</select></li>
</ul>
</div>
</div>
<script>
	function toLinkPage(url){
		if(url.length>0){
			window.open(url);
		}
	}
</script>
﻿<div class="bottom">
<div class="bot">
<div class="bottom_r">
<p style="font-family: Microsoft YaHei;margin-right: 50px">Copyright©2017 All Rights Reserved.锦州XX医养系统 版权所有<br />公司地址：锦州市XX </p>
</div>
<div class="bottom_l"><img src="images/logo2.jpg" width="176" height="60" /></div>
<div class="clear"></div>
</div>
</div>
</body>
</html>
