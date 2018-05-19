<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改</title>
<script type="text/javascript">
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
				int i = 0;
				//String userid = (String)session.getAttribute("userid"); //
			request.setCharacterEncoding("UTF-8");
				String userid="";
				String userno = request.getParameter("userNo"); //
				String username = ""; //
				
				String userlevel="";
				String usersex="";
				String useremail = ""; //
				String ul="";
				String sql=null;
			
				sql = "select * from user_if where user_no="+"'"+userno+"'";
			
			
				stmt = conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				
			
				while (rs.next())
				{
					i = i + 1;
					userid = rs.getString("user_id");
					username = rs.getString("user_name");
					userno = rs.getString("user_no");
					useremail = rs.getString("user_email");
					usersex = rs.getString("user_sex");
					
					//userlend = rs.getString("lend_number");
					userlevel=rs.getString("user_level");
				}	
				
			
				if(userlevel.equals("a"))
				{
				ul="高级管理员";
				}
				
				else if(userlevel.equals("b"))
				{
				ul="管理员";
				}
				
				else if(userlevel.equals("c"))
				{
				ul="学生";
				}
					
				
				stmt.close();  //关闭执行语句
				conn.close();  //关闭一次连接
			%>
<form name="userif" method="post" onsubmit="return subCheck()" action="useredit_do.jsp">
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
				<td><input type="text" name="usersex" value="<%=usersex%>"></td>
			</tr>
			
			<tr>
				<td>用户邮箱：</td>
				<td><input type="email" name="useremail" value=<%=useremail %> ></td>
			</tr>
			<tr>
				<td>用户类别：</td>
				<td><%=ul%></td>
			</tr>
			<tr>
				<td>操作：</td>
				<td><input type="submit" name="submit" value="确定"></td>
			</tr>
		
		</table>
</form>


</body>
</html>