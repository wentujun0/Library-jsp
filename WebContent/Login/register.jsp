<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册新账号</title>
<script type="text/javascript">


function subCheck(){  
	var flag=false;
	
	var userid=document.getElementById("user_id").value;
	//alert(userid);
    var userpassword=document.getElementById("user_password").value;  
    //alert(userpassword);
    var usernewpassword=document.getElementById("user_newpassword").value;
    //alert(usernewpassword);
    var username=document.getElementById("user_name").value;
    //alert(username);
    var userno=document.getElementById("user_no").value;
    //alert(userno);
    var userlevel=document.getElementById("user_level").value;
    //alert(userlevel);
    alert("是否提交");
    if(userid==""){  
    	
        alert("用户名不能为空!");  
        return flag;  
        }  
    else if(userpassword==""){  
        alert("密码不能为空!");  
         
         return flag;  
         }  
    
    else if(usernewpassword==""){
    	alert("再次输入的密码不能为空!"); 
    	return flag;
    }
    else if(username==""){
    	alert("用户姓名不能为空!");
    	return flag;
    }
    else if(userno==""){
    	alert("用户编号不能为空!");
    	return flag;
    }
    else if(userlevel==""){
    	alert("用户类别不能为空!");
    	return flag;
    }
    else if(userlevel=="b")
    	{
    	alert("您目前没有权限!");
    	return flag;
    	}
    else if(userpassword!=usernewpassword){  
        alert("两次输入密码不相同!");  
         return flag;  
     }  
    else{
    	flag=true;
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
<%out.println("欢迎注册新用户"); %>
<div id="register_1">
<form  method="post" name="fm" onsubmit="return subCheck(fm)" action="checkedre.jsp" >
<table>
 <tr>
 	<td> 用户名:</td>
 	<td><input type="text" name="id" id="user_id" placeholder="请输入用户名" maxlength="10"onfocus = "if(this.value == '输入10个字符以内') this.value =''"><span style="color:red">*</span></td>
 </tr>
 <tr>
 	<td>密码:</td>
 	<td><input type="password" name="password" id="user_password" placeholder="请输入密码"><span style="color:red">*</span> </td>
 </tr>
 <tr>
 <td>确认密码:</td>
 	<td><input type="password" name="password" id="user_newpassword" placeholder="请再次输入密码"><span style="color:red">*</span></td>
 </tr>
 <tr>
	<td>姓名:</td>
 	<td><input type="text" name="name" id="user_name" placeholder="请输入真实姓名"><span style="color:red">*</span></td>
 
 </tr>
 <tr>
 	<td>用户编号:</td>
 	<td><input type="text" name="no" id="user_no" placeholder="请输入真实用户编号"><span style="color:red">*</span></td>
 </tr>
 <tr>
 	<td>性别:</td>
 	<td><input type="radio" name="sex" id="sex1" value="男">男
 		<input type="radio" name="sex" id="sex2" value="女">女
 	</td>
 </tr>
 <tr>
 	<td>用户类别:</td>
 	<td> <select id="user_level">
 			<option value="c" selected="selected">学生</option>
 			<option value="b">管理员</option>
 		</select><span style="color:red">*</span>
 	</td>
 	
 </tr>
 <tr>
 	<td>邮箱地址:</td>
 	<td><input type="email" name="email" placeholder="请输入你的邮箱" ></td>
 </tr>

 
</table>
 <div id="re_button">
<input type="submit" name="submit" value="提交" >
<input type="reset"  name="reset1" value="重置">

</div>
</form>
</div>


</body>
</html>