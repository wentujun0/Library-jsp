<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆</title>
<script >
var flag=false;
function subInput(){
	
	
	var userid=document.getElementById("user_id").value;
	var userpassword=document.getElementById("user_password").value;
	
	if(userid=="")
		{alert("用户名不能为空!");
		return flag;
		}
	else if(userpassword=="")
		{alert("密码不能为空!");
		return flag;
		}
	else
		{flag=true;
		return flag;
		}
}
    
    
    

</script>

</head>
<body>

<div id="head1">
<h1 style="font-family:宋体; ">
欢迎使用图书馆管理系统
</h1>
</div>
<br>
<div id="login_1">

<form method="post" onsubmit="return subInput(this)" action="checkedlo.jsp" >
<table>
 <tr>
 	<td> 用户名:</td>
 	<td><input type="text" name="user" id="user_id" placeholder="请输入用户名" maxlength="10" ></td>
 	
 </tr>
 <tr>
 	<td>密码:</td>
 	<td><input type="password" name="password" id="user_password" placeholder="请输入密码"></td>
 </tr>
  <tr>
 	<td>用户类别:</td>
 	<td> <select name="level">
 			<option value="c" selected="selected">学生</option>
 			<option value="b">管理员</option>
 			<option value="a">高级管理员</option>
 		</select>
 	</td>
 	
 </tr>
</table>
<div id="lo_button">
<input type="submit" name="submit" value="登录" >
<input type="reset"  name="reset1"  value="重置" >

</div>

</form>
<a id="noAccount" href="register.jsp" target="_blank">注册账号</a><br>

</div>




</body>
</html>
