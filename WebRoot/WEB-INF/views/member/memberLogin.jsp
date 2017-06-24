<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <!-- header -->
    <!--#include file="head.htm"-->
    <!--end header-->
    <form id="form1" runat="server" defaultbutton="btnLogin">
    <table width="970px;">
        <tr>
            <td align="left" style="padding-left: 150px; padding-top: 10px;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="/indexmember/login_img04.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td style="background-image: url(/indexmember/login_img05.gif); text-align: center; padding-left:30px; height:200px;">
                            <table style="background-color: #f9fdff; width: 350px; height: 130px;">
                                <tr>
                                    <td style="width: 100px; text-align: right;">
                                        账 号：
                                    </td>
                                    <td>
                                        <input type="text" id="txtuser"></input>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        密 码：
                                    </td>
                                    <td>
                                        <input id="txtpwd" type="text"></input>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 4px; text-align: center;" colspan="2">
                                        <input id="btnLogin" type="text"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="/indexmember/login_img06.gif" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background-image: url(indexmember/login.jpg); width: 16px;">
            </td>
            <td width="200px;" valign="top">
                <table>
                    <tr>
                        <td colspan="2" style="font-size: 14px; font-weight: bold;">
                            <img src="indexmember/dian2.gif" />&nbsp;&nbsp;&nbsp; 新闻资讯 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="NewsList.aspx">
                                <img src="indexmember/more.gif" style="border: 0;" /></a>
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <!--#include file="foot.htm"-->
    </form>
</body>
</html>