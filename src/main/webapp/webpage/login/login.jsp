<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.jeecgframework.core.util.SysThemesUtil,org.jeecgframework.core.enums.SysThemesEnum"%> 
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<%
String lang = org.jeecgframework.core.util.BrowserUtils.getBrowserLanguage(request);
String langurl = "plug-in/mutiLang/" + lang +".js";
SysThemesEnum sysTheme = SysThemesUtil.getSysTheme(request);
String lhgdialogTheme = SysThemesUtil.getLhgdialogTheme(sysTheme);
%>

<html>
<head>
<title></title>
<link rel="shortcut icon" href="resources/fc/images/icon/favicon.ico">
<script src=<%=langurl%> type="text/javascript"></script>
<!--[if lt IE 9]>
   <script src="plug-in/login/js/html5.js"></script>
  <![endif]-->
<!--[if lt IE 7]>
  <script src="plug-in/login/js/iepng.js" type="text/javascript"></script>
  <script type="text/javascript">
	EvPNG.fix('div, ul, img, li, input'); //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
</script>
  <![endif]-->
<link href="plug-in/login/css/zice.style.css" rel="stylesheet" type="text/css" />
<link href="plug-in/login/css/buttons.css" rel="stylesheet" type="text/css" />
<link href="plug-in/login/css/icon.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="plug-in/login/css/tipsy.css" media="all" />
<style type="text/css">
html {
	background-image: none;
}

label.iPhoneCheckLabelOn span {
	padding-left: 0px
}

#versionBar {
	background-color: #212121;
	position: fixed;
	width: 100%;
	height: 35px;
	bottom: 0;
	left: 0;
	text-align: center;
	line-height: 35px;
	z-index: 11;
	-webkit-box-shadow: black 0px 10px 10px -10px inset;
	-moz-box-shadow: black 0px 10px 10px -10px inset;
	box-shadow: black 0px 10px 10px -10px inset;
}

.copyright {
	text-align: center;
	font-size: 10px;
	color: #CCC;
}

.copyright a {
	color: #A31F1A;
	text-decoration: none
}

.on_off_checkbox {
	width: 0px;
}

#login .logo {
	width: 500px;
	height: 51px;
}
.title_login{
	font-size: 24px;
    color: rgba(0,0,0,.85);
    font-family: Chinese Quote,-apple-system,BlinkMacSystemFont,Segoe UI,PingFang SC,Hiragino Sans GB,Microsoft YaHei,Helvetica Neue,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    font-weight: 600;
    position: relative;
    top: 2px;
}
</style>
</head>
<body>
    <div id="alertMessage"></div>
    <div id="successLogin"></div>
    <div class="text_success"><img src="plug-in/login/images/loader_green.gif" alt="Please wait" /> <span><t:mutiLang langKey="common.login.success.wait"/></span></div>
    <div id="login">
       <!--  <div class="ribbon" style="background-image: url(plug-in/login/images/typelogin.png);"></div> -->
        <div class="inner">
            <div class="logo">
            	<h2 class="title_login">产品交付数据包管理系统</h23>
            </div>
            <div class="formLogin">
                <form name="formLogin" id="formLogin" action="loginController.do?login" check="loginController.do?checkuser" method="post">
                    <input name="userKey" type="hidden" id="userKey" value="D1B5CC2FE46C4CC983C073BCA897935608D926CD32992B5900" />
                    <div class="tip">
                        <input class="userName" name="userName" type="text" id="userName" title="" iscookie="true"  nullmsg="" />
                    </div>
                    <div class="tip">
                        <input class="password" name="password" type="password" id="password" title=""  nullmsg="" />
                    </div>
                    <!-- <div>
                        <div style="float: right; margin-left:-150px; margin-right: 20px;">
                            <img id="randCodeImage" src="randCodeImage" />
                        </div>
                        <input class="randCode" name="randCode" type="text" id="randCode" title="" value="" nullmsg="" />
                    </div> -->
                    <input type="hidden" id="langCode" name="langCode" value="zh" />
                    <div class="loginButton">
                        <div style="float: left; margin-left: 80px;">
                            <input type="checkbox" id="on_off" name="remember" checked="ture" class="on_off_checkbox" />
                            <span class="f_help"><t:mutiLang langKey="common.remember.user"/></span>
                        </div>                        
                        <div style="float: right; padding: 3px 0; margin-right: 80px;">
                            <div>
                                <ul class="uibutton-group">
                                    <li><a class="uibutton normal" href="#" id="but_login"><t:mutiLang langKey="common.login"/></a></li>
                                    <li><a class="uibutton normal" href="#" id="forgetpass"><t:mutiLang langKey="common.reset"/></a></li>
                                </ul>
                            </div>
                            <br>                            
                        </div>
                        <div class="clear"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="shadow"></div>
    </div>
    <!--Login div-->
    <div class="clear"></div>
    <div id="versionBar">
        <div class="copyright">&copy; <t:mutiLang langKey="common.copyright"/> <span class="tip"><a href=""  target="_blank" title=<t:mutiLang langKey="common.platform"/>></a> <t:mutiLang langKey="common.browser.recommend"/><a href="" target="_blank" title=<t:mutiLang langKey="common.platform"/>></a></span></div>
    </div>
    <!-- Link JScript-->
    <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="plug-in/jquery/jquery.cookie.js"></script>
    <script type="text/javascript" src="plug-in/login/js/jquery-jrumble.js"></script>
    <script type="text/javascript" src="plug-in/login/js/jquery.tipsy.js"></script>
    <script type="text/javascript" src="plug-in/login/js/iphone.check.js"></script>
    <script type="text/javascript" src="plug-in/login/js/login.js"></script>
 <!--    <script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js"></script> -->
    <%=lhgdialogTheme %>
<script type="text/javascript">
   //输入验证码，回车登录
  $(document).bind('keyup', function(event) {
	if (event.keyCode == "13") {
		$('#but_login').click();
	}
  });
</script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?098e6e84ab585bf0c2e6853604192b8b";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>