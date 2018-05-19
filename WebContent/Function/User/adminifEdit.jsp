<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息更改</title>

<script>



var flag=false;
function subCheck(){
	var password=document.getElementsByName("userpassword")[0].value;
	//alert(password);
	var newpassword=document.getElementsByName("usernewpassword")[0].value;
	var id=document.getElementsByName("userid")[0].value;
	//alert(id);
	var name=document.getElementsByName("username")[0].value;
	if(id==""){
		alert("用户名不能为空!");
		return flag;
	}
	else if(name==""){
		alert("姓名不能为空!");
		return flag;
	}
	else if(password!=newpassword){
		alert("两次输入的密码不同!");
		return flag
	}
	else{
		flag=true;
		alert("确认修改!");
		return flag;
	}
}


</script>

</head>
<body>

<h1>欢迎使用</h1>

			<%
				request.setCharacterEncoding("UTF-8");
				int i = 0;
			
				String userno = request.getParameter("user_No"); //
			
				String userid = ""; //
				String username = ""; //
				
				String userlevel="管理员";
				String usersex="";
				String useremail = ""; //
				
				String sql=null;
			
				sql = "select * from user_if where user_no="+"'"+userno+"'";
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				while (rs.next())
				{
					i = i + 1;
					userid = rs.getString("user_id");
					username = rs.getString("user_name");
					userid = rs.getString("user_id");
					useremail = rs.getString("user_email");
					usersex = rs.getString("user_sex");
					
				}	
				
				stmt.close();  //关闭执行语句
				conn.close();  //关闭一次连接
			%>
<form name="userif" method="post" onsubmit="return subCheck()" action="adminifEdit_do.jsp">
		<table>
			<tr>
				<td>用户编号：</td>
				<td><input type="hidden" name="userno" value= "<%=userno%>"><%=userno %></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="username" value="<%=username %>" ></td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="userid" value="<%=userid %>" ></td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><input type="password" name="userpassword"  ></td>
			</tr>
			<tr>
				<td>确认新密码：</td>
				<td><input type="password" name="usernewpassword" ></td>
			</tr>
			<tr>
				<td>用户性别：</td>
				<td><input type="radio" name="usersex" id="usersex1" value="男" >男
 					<input type="radio" name="usersex" id="usersex2" value="女" >女</td>
			</tr>
			
			<tr>
				<td>用户邮箱：</td>
				<td><input type="text" name="useremail" value=<%=useremail %> ></td>
			</tr>
			<tr>
				<td>用户类别:</td>
 			<td><input type="radio" name="admin1" id="admin1" value="b"  checked="checked">管理员
 				<input type="radio" name="admin2" id="admin2" value="c" >学生</td>
 									
			</tr>
			<tr>
				<td>操作：</td>
				<td><input type="submit" name="submit" value="确定"></td>
			</tr>
		
		</table>
</form>

</body>
</html>