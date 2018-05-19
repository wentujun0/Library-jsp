<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置管理员</title>
</head>
<body>
<form name="fm">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="10%">用户编号</th>
				<th width="15%">登录名</th>
				<th width="10%">姓名</th>
				<th width="8%">性别</th>
				<th width="10%">借阅数量</th>
				<th width="10%">用户类别</th>
				<th width="20%">邮箱地址</th>
				<th width="7%">操作</th>
			</tr>
			<%
				String user_no = ""; //1、图书编号
				String username = ""; //2、图书名称
				String userid = ""; //3、图书作者
				String usersex = ""; //4、图书出版社
				String userlevel="";//5、图书种类
				String useremail="";//7
				int lendnumber=-1;//6、馆藏数量
				String level="";
				
				
				
				String sql = "select * from user_if where user_level='c' group by user_no";
				int i = 0;
				
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while (rs.next()) {
					i = i + 1;
					user_no = rs.getString("user_no");
					username = rs.getString("user_name");
					userid = rs.getString("user_id");
					usersex = rs.getString("user_sex");
					userlevel=rs.getString("user_level");
					useremail=rs.getString("user_email");
					lendnumber=rs.getInt("lend_number");
					if(userlevel.equals("a")){
						level="高级管理员";
					}
					else if(userlevel.equals("b")){
						level="管理员";
					}
					else if(userlevel.equals("c")){
						level="学生";
					}
					
			%>

			<tr>
				<td><input type="checkbox" name="selectUser"
					value="<%=user_no%>"><%=user_no%></td>
				<td><%=userid%></td>
				<td><%=username%></td>
				<td><%=usersex%></td>
				<td><%=lendnumber%></td>
				<td><%=level%></td>
				<td><%=useremail%></td>
				
				
				<td><a href="setAdmin_do.jsp?user_No=<%=user_no%>">设定</a>&nbsp;&nbsp;
					</td>
			</tr>
			<%
				}
			%>
		</table>
			<br> 
		<br><a href="../../Manage/aduser.jsp">返回</a>
	</form>






</body>
</html>