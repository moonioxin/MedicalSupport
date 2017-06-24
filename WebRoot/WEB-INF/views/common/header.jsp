<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="Shortcut Icon" href="images/gtyytb.ico" />
<title>Insert title here</title>
<!-- <link href="css/css.css" rel="stylesheet" type="text/css" /> -->
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="js/lrtk.js"></script> -->
<!-- <link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" /> -->
<!-- <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script> -->
<!-- <script src="js/jquery.slideBox.js" type="text/javascript"></script> -->
<script>
$(function($){
	$('li').click(function(){
		$(this).addClass('here');                    // 添加当前元素的样式
// 		$(this).siblings('li').removeClass('here');  // 删除其他兄弟元素的样式
	});
});
</script>
</head>
<body>
<div class="header" style="margin-bottom: 10px">
<form action="searchword.html" method="post">
	<div class="search">
	<input type="submit" value="搜索" class="button01" style="width: 50px;color: white;">
	<input id="word" name="wordInfo" type="text" value="" placeholder="请输入关键字"/>
	<div class="clear"></div>
	</div>
</form>
<div class="logo"><img src="images/logo.jpg" width="100" height="100" /></div>
<div class="clear"></div>

<a href="login.do" target="_black" style="float: right;font-family: Microsoft YaHei;">后台管理</a>
<a href="register.do" target="_black" style="float: right;font-family: Microsoft YaHei;">会员注册&nbsp;|&nbsp;</a>

</div> <div class="naver">
<ul>
<li ><a href="index.do">首页</a></li>
<li ><a href="introductionView.do">关于我们</a></li>
<li ><a href="contactUsView.do">医患交互</a></li>
<li ><a href="pointCheckView.do">积分管理</a></li>
<li ><a href="convenienceServiceView.do">便民服务</a></li>
</ul>
</div>
</body>
</html>