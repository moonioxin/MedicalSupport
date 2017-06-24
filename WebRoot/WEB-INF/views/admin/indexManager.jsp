<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,com.medicalsupport.entity.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="Shortcut Icon" href="images\gtyytb.ico" />
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=9" > -->
		<title>锦州古塔医养服务中心</title>
		<link type="text/css" rel="stylesheet" href="css/index.css" />
		<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
		
		<script type="text/javascript" src="js/jquery.i18n.properties-1.0.9.js"></script>
		<script type="text/javascript" src="js/js_user/com.js"></script>
		<script type="text/javascript" src="js/cookie/cookie.js"></script>
		
	</head>
	<body style="overflow:auto;width:100%;height:100%;">
		<div class="main_header">
			<a href="default.do" target="mainFrame">
			<div class="header_left">
			<font id="index_string_title" style="font-size:29px;color: #FFFFFF;">&nbsp;XX医疗系统管理</font>
			<br>
			
			</div>
			</a>
			<div class="header_middle">
			    <table><tr>
			    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			    <td>&nbsp;&nbsp;&nbsp;
			    <!--<select name="lang" id="lang" onchange="changeLanguage(this.options[this.options.selectedIndex].value)">
					<OPTION id="index_string_JP" VALUE="" onclick=>日本語</OPTION>	
					<OPTION id="index_string_CN" VALUE="" >中国語</OPTION>
				</select>  --> </td>
				</tr></table>
			</div>	
			<div class="header_right">
			    <table><tr>
			<!--  	</td>				
				<td >&nbsp;			
				<a id="index_string_CN" href="javascript:changeLanguage('CN');" style="color: #FFFFFF;">
					&nbsp;中国語
				</a></td>	
				<td>&nbsp;	
				<a id="index_string_EN" href="javascript:changeLanguage('EN');" style="color: #FFFFFF;">
					&nbsp;英语
				</a>-->
				
				<td><span id="sysTime"></span></td>
				<td><span><label id="index_string_welcome">您好,</label>
				${admin.adminName}</span></td>
				<td ><a href="javascript:logout();">
				
					<input type="button" id="logoutPic"  style="border-width:1px;border-bottom-style:solid;border-right-style:solid;border-color:#FFFFFF; height:22px;width:70px;background:transparent;color: #FFFFFF;text-align:center;font-weight: bold;" value="ログアウト"/>
				</a></td>
				</tr>
				
				</table>
			</div>
		</div>
		<div class="main_content" style="">
		<table style="width:100%;height:100%;">
			<tr style="width:100%;height:100%;">
				<td style="width:182px;height:100%;">
			<div class="content_left">
				<h1>
					<a><label id="index_string_menu_h1">管理员管理</label></a>
				</h1>
				<div class="menu_line" >
					<ul>
						<li>
                            <a id="index_string_menu_1" href ="adminManage.do" target="mainFrame">管理员维护</a>
                        </li>  	
					</ul>					
				</div>
				<h1>
					<a><label id="index_string_menu_h2"></label></a>
				</h1>
				<div class="menu_line">
					<ul>
						<li>
                            <a id="index_string_menu_7" href ="member.do" target="mainFrame">会员资料维护</a>
                        </li>
						<li>
							<a id="index_string_menu_8" href="memberPoints.do" target="mainFrame">会员积分维护</a>
						</li>
						<li>
							<a id="index_string_menu_8" href="memberPointsSearch.do" target="mainFrame">会员积分查询</a>
						</li>
						<li>
						    <a id="index_string_menu_3" href="memberCreateCard.do" target="mainFrame">会员建卡</a>
					    </li>
					    <li>
						    <a id="index_string_menu_5" href="memberLossCard.do" target="mainFrame">会员卡挂失</a>
					    </li>
					    <li>
						    <a id="index_string_menu_4" href="memberRecreateCard.do" target="mainFrame">会员卡补发</a>
					    </li>
						<li>
							<a id="index_string_menu_11" href="memberRecharge.do" target="mainFrame">会员充值</a>
						</li>
						<li>
							<a id="index_string_menu_9" href="memberRechargeHistory.do" target="mainFrame">会员充值记录</a>
						</li>
						<li>
							<a id="index_string_menu_10" href="pointRecordHistory.do" target="mainFrame">会员积分变更记录</a>
						</li>
                    </ul>
                </div>
                <h1>
					<a><label id="" value="">组织架构管理</label></a>
				</h1>
				<div class="menu_line">
					<ul>
						<li>
                            <a id="" href ="departmentManage.do" target="mainFrame">部门管理</a>
                        </li>
						<li>
							<a id="" href="productManage.do" target="mainFrame">消费项目维护</a>
						</li>
                    </ul>
                </div>
                <h1>
					<a><label id="" value="">消费管理</label></a>
				</h1>
				<div class="menu_line">
					<ul>
						<li>
                            <a id="" href ="pointExchange.do" target="mainFrame">用户消费</a>
                        </li>
						<li>
							<a id="" href="pointExchangeHistory.do" target="mainFrame">消费查询</a>
						</li>
                    </ul>
                </div>
                <h1>
					<a><label id="" value="">其他</label></a>
				</h1>
				<div class="menu_line">
					<ul>
						<li>
                            <a id="" href ="exchangeView.do" target="mainFrame">财务查询</a>
                        </li>
<!-- 						<li> -->
<!-- 							<a id="" href="" target="mainFrame">呼叫中心</a> -->
<!-- 						</li> -->
                    </ul>
                </div>
			</div>
			</td>
			<td style="width:10px;height:100%;">
			<div class="content_center">
				&nbsp;
			</div>
			</td>
			<td style="width:100%;height:100%;">
			<div class="content_right" style="overflow:auto;width:100%;height:100%;">
				<table cellspacing="0" cellpadding="0" style="width:100%;height:100%;">
					<tr
						style="height: 29px; background: url('images/content-bg.gif') repeat-x;">
						<td
							style="height: 29px; width: 17px; background: url('images/left-top-right.gif') no-repeat;"></td>
						<td style="height: 29px; line-height: 29px;">
							<div class="content_title">
								<label id="index_string_pagename">首页</label>
							</div>
						</td>
						<td
							style="height: 29px; width: 16px; background: url('images/nav-right-bg.gif') no-repeat;"></td>
					</tr>
					<tr  id="centerRightTr" style="width:100%;">
						<td style="background: url('images/mail_leftbg.gif') repeat-y;"></td>
						<td style="background-color: #FAFBFD;">
							<iframe name="mainFrame" id="mainFrame" frameborder="0"
								src="default.do" style="width: 100%;"></iframe>
						</td>
						<td style="background: url('images/mail_rightbg.gif') repeat-y;"></td>
					</tr>
					<tr style="background: url('images/buttom_bgs.gif') repeat-x;">
						<td
							style="height: 17px; background: url('images/buttom_left2.gif') no-repeat;"></td>
						<td></td>
						<td
							style="height: 17px; background: url('images/buttom_right2.gif') no-repeat;"></td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="sys_bottom">
								<label id="index_string_copyright">Copyright</label> &copy; <label id="index_string_sysname">2016  锦州市古塔区医养服务系统</label>
							</div>
						</td>
					<tr>
				</table>
			</div>
			</td>
			</tr>
		</table>
		</div>

		<script type="text/javascript">
		
			var language = getCookieValue("language");
			var year = "";
			var month = "";
			var day = "";
			var I0001="";
	$(document).ready(
					function() {
					    $("#logoutPic").attr("value","退出");
						
						loadProperties(language,setPageByLanguage);
						getTime();
						window.setInterval(getTime, 1000);
						
						$(".main_header a").bind("click",function(){
							$(".content_title").html($.i18n.prop('index_string_pagename'));
						});
						
						$("h1 a").bind("click", function() {
							var obj = $(this).parent().next();
							obj.slideToggle("fast", "linear");
							//obj.fadeToggle("fast","linear");
							});
						$(".menu_line a")
								.bind(
										"click",
										function() {
											$(".content_title").html(
													$(this).html());
											//$("#mainFrame").attr("src","");
											$(".menu_line a")
													.css("background-image",
															"url('images/menu_bg1.gif')");
											$(".menu_line a").css("color",
													"#333333");
											$(".menu_line a").css(
													"font-weight", "normal");
											$(".menu_line a")
													.bind(
															{
																mouseover : function() {
																	$(this)
																			.css(
																					"background-image",
																					"url('images/menu_bg2.gif')");
																	$(this)
																			.css(
																					"color",
																					"#006600");
																	$(this)
																			.css(
																					"font-weight",
																					"bold");
																},
																mouseout : function() {
																	$(this)
																			.css(
																					"background-image",
																					"url('images/menu_bg1.gif')");
																	$(this)
																			.css(
																					"color",
																					"#333333");
																	$(this)
																			.css(
																					"font-weight",
																					"normal");
																}
															})
											$(this)
													.css("background-image",
															"url('images/menu_bg2.gif')");
											$(this).css("color", "#006600");
											$(this).css("font-weight", "bold");
											$(this).unbind("mouseout");
										});
						//initRightContentHeightAndWidth();
						var height = $(window).height() < $(document).height() ? $(window)
								.height() : $(document).height();
						$(".main_content").height(height - $(".main_header").height());
						$("#mainFrame").height(
								height - $(".main_header").height() - $(".sys_bottom").height()
								- 46);

					});
	  
	function initRightContentHeightAndWidth() {
	//	return false;
		var height = $(window).height() < $(document).height() ? $(window)
				.height() : $(document).height();
		var width = $(window).width() < $(document).width() ? $(window).width()
				: $(document).width();
		if(width > 800){
			var height = $(window).height() < $(document).height() ? $(window)
				.height() : $(document).height();
		    var width = $(window).width() < $(document).width() ? $(window).width()
				: $(document).width();
  		    $(".content_right").width(
				width - $(".content_left").width()
						- $(".content_center").width());
		    $(".content_right table tr:eq(1) td").height(
				height - $(".main_header").height() - $(".sys_bottom").height()
						- 46);	
		}else{
			//$(".content_right table").width(800);
			//$(".content_right table tr:eq(1) td").height(400);	
		}
		
		
	}
	
	
	
							$(window).resize(function() {
						    var width = $(this).width();
						    var height = $(this).height();
						    if(width > 800){
			                    var height = $(window).height() < $(document).height() ? $(window)
				                   .height() : $(document).height();
		                        var width = $(window).width() < $(document).width() ? $(window).width()
				                   : $(document).width();
/* 		                        $(".content_right table").width(
				                width - $(".content_left").width()
						        - $(".content_center").width()); 
		                        $(".content_right table tr:eq(1) td").height(
				                height - $(".main_header").height() - $(".sys_bottom").height()
						        - 46);	*/
						        
		      /*                   $(".content_right table").width(
		                                width - $(".content_left").width()
		                 	        - $(".content_center").width()); */
		                                      
		                                       $(".main_content").height(
		                                              height - $(".main_header").height()); 	
		                                       $("#mainFrame").height(
		                                     		 height - $(".main_header").height() - $(".sys_bottom").height()-46); 
						        
		                   }else{
			                 //  $(".content_right table").width(800);
			                  // $(".content_right table tr:eq(1) td").height(400);	
		                   }
					    });   
	/**	
	function initRightContentHeightAndWidth() {
		var height = $(window).height() < $(document).height() ? $(window)
				.height() : $(document).height();
		var width = $(window).width() < $(document).width() ? $(window).width()
				: $(document).width();
		$(".content_right table").width(
				width - $(".content_left").width()
						- $(".content_center").width());
		$(".content_right table tr:eq(1) td").height(
				height - $(".main_header").height() - $(".sys_bottom").height()
						- 46);
	}**/
    

	function getTime() {
		var date = new Date();
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		var h = date.getHours();
		var i = date.getMinutes();
		var s = date.getSeconds();
		$("#sysTime").html(
				y + year + (m > 9 ? m : ("0" + m)) + month
						+ (d > 9 ? d : ("0" + d)) + day
						+ (h > 9 ? h : ("0" + h)) + ":"
						+ (i > 9 ? i : ("0" + i)) + ":"
						+ (s > 9 ? s : ("0" + s)));
	}

	function logout() {
		if (confirm(I0001)) {
			document.location = "logout.do";
		}
	}
	
	//ADD BY WEI 20151106 START
	function changeLanguage(lang) { 
		setCookie("language",lang,365*24,"/");
		window.location.reload()
	}
	//国际化
	function setPageByLanguage(){
		
		document.title = $.i18n.prop('index_string_title');
		var JP =$.i18n.prop('index_string_JP');
		var CN =$.i18n.prop('index_string_CN');
		
		if (language=="JP"){
			$('#lang').append('<OPTION VALUE="JP" SELECTED>'+JP+'</OPTION>'+'<OPTION  VALUE="CN">'+CN+'</OPTION>');
		} else if (language=="CN"){
			$('#lang').append('<OPTION VALUE="JP">'+JP+'</OPTION>'+'<OPTION  VALUE="CN" SELECTED>'+CN+'</OPTION>');
		} else {
			$('#lang').append('<OPTION VALUE="JP">'+JP+'</OPTION>'+'<OPTION  VALUE="CN" SELECTED>'+CN+'</OPTION>');
		}
		
		
		//$('#index_string_EN').html($.i18n.prop('index_string_EN'));
		$('#index_string_welcome').html($.i18n.prop('index_string_welcome')); 
		$('#index_string_menu_h1').html($.i18n.prop('index_string_menu_h1'));
		$('#index_string_menu_h2').html($.i18n.prop('index_string_menu_h2'));
		$('#index_string_menu_h3').html($.i18n.prop('index_string_menu_h3'));
		$('#index_string_menu_h4').html($.i18n.prop('index_string_menu_h4'));
		$('#index_string_menu_1').html($.i18n.prop('index_string_menu_1'));
		$('#index_string_menu_2').html($.i18n.prop('index_string_menu_2'));		
		$('#index_string_menu_3').html($.i18n.prop('index_string_menu_3'));
		$('#index_string_menu_4').html($.i18n.prop('index_string_menu_4'));
		$('#index_string_menu_5').html($.i18n.prop('index_string_menu_5'));
		$('#index_string_menu_6').html($.i18n.prop('index_string_menu_6'));
		$('#index_string_menu_7').html($.i18n.prop('index_string_menu_7')); 
		$('#index_string_menu_8').html($.i18n.prop('index_string_menu_8')); 
		$('#index_string_menu_9').html($.i18n.prop('index_string_menu_9'));
		$('#index_string_menu_10').html($.i18n.prop('index_string_menu_10'));
		$('#index_string_menu_11').html($.i18n.prop('index_string_menu_11'));
		$('#index_string_menu_12').html($.i18n.prop('index_string_menu_12'));
		$('#index_string_menu_13').html($.i18n.prop('index_string_menu_13'));
		$('#index_string_pagename').html($.i18n.prop('index_string_pagename'));
		$('#index_string_copyright').html($.i18n.prop('index_string_copyright'));
		$('#index_string_sysname').html($.i18n.prop('index_string_sysname'));
		$('#index_string_title').html($.i18n.prop('login_string_title'));
		I0001 = $.i18n.prop('I0001');
		year = $.i18n.prop('index_string_year');
		month = $.i18n.prop('index_string_month');
		day = $.i18n.prop('index_string_day');

	}
	//ADD BY WEI 20151106 END
	
</script>
	</body>
</html>