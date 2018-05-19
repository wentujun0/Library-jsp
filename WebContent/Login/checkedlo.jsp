<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>  
<%@page import="java.net.URLEncoder"%> 
<%@ include file="../JDBC/jdbc.jsp" %>
<%
			request.setCharacterEncoding("UTF-8");
			String userno=null;
			String userNo=null;
			String userid = request.getParameter("user");
			String userpassword = request.getParameter("password");
			String userlevel = request.getParameter("level");
			String username=null;
			String sql="select * from user_if where user_id="+" '"+userid+"' ";
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			 
			if(rs.next())
			{
				userno=rs.getString("user_no");
				username=rs.getString("user_name");
				String user_password=rs.getString("user_password");
				String user_level=rs.getString("user_level");	
				stmt.close();  //关闭执行语句
				conn.close();  //关闭一次连接
				
				if(userpassword.equals(user_password)&&userlevel.equals(user_level))
				{
					//out.println("欢迎用户"+username);
					//session传值
					session.setAttribute("userno", userno);
					
					//cookie传值
				/*
					userNo = URLEncoder.encode(userno, "UTF-8");
					Cookie cookie_no = new Cookie("user_no", userNo);
					cookie_no.setMaxAge(60*60*24);
					response.addCookie(cookie_no);
				*/
					session.setAttribute("userid", userid);
					session.setAttribute("username", username);
					session.setAttribute("userlevel", user_level);					
		            response.sendRedirect("../Manage/aduser.jsp");
		            return;
		        }
		        else if(!userpassword.equals(user_password))
		        {
		            out.print("<script language='javaScript'> alert('密码错误');</script>");
		            response.setHeader("refresh", "1;url=login.jsp");
		        }
		        else
		        {
		        	 out.print("<script language='javaScript'> alert('用户类别错误');</script>");
			            response.setHeader("refresh", "1;url=login.jsp");
		        }
			}
			 else 
			{
		     out.print("<script language='javaScript'> alert('用户名错误');</script>");
		     response.setHeader("refresh", "1;url=login.jsp");
		 	}
		
%>
