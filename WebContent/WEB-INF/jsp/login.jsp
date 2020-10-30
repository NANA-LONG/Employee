<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<title>员工信息登录页面</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	   type=text/css rel=stylesheet>
<link href="${pageContext.request.contextPath}/css/boot-crm.css"
	   type=text/css rel=stylesheet>
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<script>
// 判断是登录账号和密码是否为空
function check(){
    var username = $("#username").val();
    var password = $("#password").val();
    var role = $("#role").val();
    if(usercode=="" || password==""||role==""){
    	$("#message").text("账号或密码不能为空");
        return false;
    }  
    return true;
}
</script>
</head>
<body background="/images/cs.jpg">
<div align="center" width="100%">
<table border="0" width="400px" cellspacing="0" cellpadding="0" id="table1">
	<tr>
		<td height="200"></td>
		<td></td>
	</tr>
	<tr align="center">
   <td class="login_msg" width="400" align="center">
	 <!-- margin:0px auto; 控制当前标签居中 -->
	 <fieldset style="width: auto; margin: 0px auto;">
		  <legend>
		     <font style="font-size:15px" face="宋体">
		          欢迎使用员工信息管理系统
		     </font>
		  </legend> 
		<font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
		<%-- 提交后的位置：/WEB-INF/jsp/staff.jsp--%>
		<!--jsp   ${pageContext.request.contextPath }  -->
		<form action="${pageContext.request.contextPath }/login.action" 
			                       method="post" onsubmit="return check()">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
          账&nbsp;号：<input id="username" type="text" name="username" autofocus="autofocus" placeholder="请输入账号" />
          <br /><br />
          密&nbsp;码：<input id="password" type="password" name="password" placeholder="请输入密码" />
          <br /><br />
          身&nbsp;份：<input id="role" type="text" name="role" />
          <br /><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="submit" value="登录" />
         
        　　</form>
		 </form>
	 </fieldset>
	</td>
	</tr>
</table>
</div>
<div> &nbsp;</div>
<div>&nbsp;</div>
<div> &nbsp;</div>
<div>&nbsp;</div>
<div> &nbsp;</div>
<div>&nbsp;</div>
<div> &nbsp;</div>
<div>&nbsp;</div>
<div> &nbsp;</div>
<div id="ft" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2020&nbspv1.0;&nbsp;版权归湖南信息职业技术学院所有&nbsp;&nbsp;</div>

</body>
</html>