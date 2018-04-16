<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.lang.*,java.sql.*,java.util.*"%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
}
catch(java.lang.ClassNotFoundException e)
{
	out.println("Class.forName Exception:"+e.getMessage());
}

String url="jdbc:mysql://localhost:3306/library";
String user="root";
String password="123456";
Connection conn=null;
Statement stmt=null;
PreparedStatement pstmt=null;

ResultSet rs=null;
try { 
	   conn = DriverManager.getConnection(url,user,password); 
}
catch(SQLException e){
	  out.print("SQL DriverManager or Statement Exception:"+e.getMessage());
	}

%>
