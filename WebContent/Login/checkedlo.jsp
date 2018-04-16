<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/JDBC/jdbc.jsp"  %>
<body>
<%
				request.setCharacterEncoding("UTF-8");

				String userid = request.getParameter("user");
				String userpassword = request.getParameter("password");
				String userlevel = request.getParameter("level");
		if(conn!= null)
		{	
		try{
			String sql="select user from user_if where user_id='"+userid+"' and user_password='"+ userpassword + "'and user_level='"+userlevel+"'";
			 stmt = conn.createStatement();
			 rs=stmt.executeQuery(sql);
			}
		catch(Exception e){
			out.println("存在错误"+e);
		}
			if(rs.next()){
				String username=rs.getString("user");
				//response.sendRedirect("home.jsp");
				out.println("欢迎用户"+username);
			}
			else{
				out.print("(请注意选择正确的用户类别)用户名或密码错误，请重新输入!");
				%>
				<a href="javascript:history.back()">返回</a>
				<% 
			}			
			
			conn.close();
		}
		else
		{
			// 输出连接信息
			out.println("数据库连接失败！");						
		}
	
%>
</body>