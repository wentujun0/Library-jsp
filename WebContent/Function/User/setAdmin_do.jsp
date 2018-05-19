<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp" %>

<%
		request.setCharacterEncoding("UTF-8");
		String userno = request.getParameter("user_No");
		String sql="update user_if set user_level='b' where user_no="+" '"+userno+"' ";
		stmt=conn.createStatement();
		int count=stmt.executeUpdate(sql);		
		if(count>0)
		{
			out.println("<script language='javaScript'> alert('设置成功!');</script>");
		}
		else
		{
			out.println("<script language='javaScript'> alert('设置失败!');</script>");
		}
		response.setHeader("refresh", "0;url=setAdmin.jsp");

%>




