<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册新账号</title>
<script type="text/javascript">
function addCheck(){  
    var username=document.getElementById("username").value;  
    var password=document.getElementById("password").value;  
    var newword=document.getElementById("newword").value;  
    if(username==""){  
        alert("用户名不能为空!");  
        document.getElementById("username").focus();    
        return false;  
        }  
    if(password==""){  
        alert("密码不能为空!");  
         document.getElementById("password").focus();  
         return false;  
         }  
    if(password != newword){  
        alert("两次输入密码不相同!");  
         document.getElementById("newword").focus();  
         return false;  
         }  
}  
function validate(){  
    var flag = addCheck();  
    if(flag == false)  
        return false;  
    return true;  
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
<%out.println("欢迎注册新用户"); %>
<div id="register_1">
<form name="from2" method="post" action="checkedre.jsp" >
<table>
 <tr>
 	<td> 用户名:</td>
 	<td><input type="text" name="id" id="userid" placeholder="请输入用户名" maxlength="10"onfocus = "if(this.value == '输入10个字符以内') this.value =''"></td>
 </tr>
 <tr>
 	<td>密码:</td>
 	<td><input type="password" name="password" id="userpassword" placeholder="请输入密码"></td>
 </tr>
 <tr>
 <td>确认密码:</td>
 	<td><input type="password" name="password" id="userpassword" placeholder="请再次输入密码"></td>
 </tr>
 <tr>
	<td>姓名:</td>
 	<td><input type="text" name="name" id="username" placeholder="请输入真实姓名"></td>
 
 </tr>
 <tr>
 	<td>用户编号:</td>
 	<td><input type="text" name="no" id="userno" placeholder="请输入真实用户编号"></td>
 </tr>
 <tr>
 	<td>性别:</td>
 	<td><input type="radio" name="sex" id="sex1" value="男">男
 		<input type="radio" name="sex" id="sex2" value="女">女
 	</td>
 </tr>
 <tr>
 	<td>用户类别:</td>
 	<td> <select name="level">
 			<option value="c" selected="selected">学生</option>
 			<option value="b">管理员</option>
 		</select>
 	</td>
 	
 </tr>
 <tr>
 	<td>邮箱地址:</td>
 	<td><input type="email" name="email" placeholder="请输入你的邮箱" ></td>
 </tr>

 
</table>
 <div id="re_button">
<input type="submit" name="submit" value="提交">
<input type="reset"  name="reset1" value="重置">

</div>
</form>
</div>


</body>
</html>