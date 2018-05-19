<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
</head>
<body>
<% out.println("欢迎使用"); %>

<form name="userif">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="10%">用户编号</th>
				<th width="10%">姓名</th>
				<th width="20%">用户名</th>
				<th width="10%">性别</th>
				<th width="10%">借阅数量</th>
				<th width="20%">邮箱地址</th>
				<th width="10%">用户类别</th>
				<th width="10%">设置</th>
			</tr>
			<%
				int i = 0;
				String userid = (String)session.getAttribute("userid"); //
			
				String userno = ""; //
				String username = ""; //
				String userlend ="";
				String userlevel="";
				String usersex="";
				String useremail = ""; //
				String ul="";
				String sql=null;
			
				sql = "select * from user_if where user_id="+"'"+userid+"'";
			
			
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
					
					userlend = rs.getString("lend_number");
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

			<tr>
				<td><%=userno%></td>
				<td><%=username%></td>
				<td><%=userid%></td>
				<td><%=usersex %></td>
				<td><%=userlend %></td>
				<td><%=useremail %></td>
				<td><%=ul%></td>
				<td><a href="useredit.jsp?userNo=<%=userno%>">修改</a></td>
			</tr>
		</table>
	</form>
<br><a href="aduser.jsp">返回</a>



</body>
</html>