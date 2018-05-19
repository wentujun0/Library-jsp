<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
</head>
<body>
<% out.println("..........."); %>

<%
	request.setCharacterEncoding("UTF-8");
	//String userno= (String)session.getAttribute("userno");
	String userno=request.getParameter("userno");
	out.println("用户编号:"+userno+"<br>");
	
	String bookname = request.getParameter("search2");//图书名称
	String bookno="";//图书编号
	String bookauthor="";//图书作者
	String bookedition="";//图书出版社
	String booknumber="";//图书馆藏数量
	String bookcat="";//图书种类
	float bookprice=0;//图书价格
	int booklrnd=-1;//借阅数量
	int booklend=-1;//剩余量
	int number=-1;//要借阅的数量
	String bookn="";
	
	
	String sql="select * from book_if where book_name="+" '"+bookname+"' ";
	stmt = conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	
	if(rs.next())
	{
		bookno=rs.getString("book_no");
		bookauthor=rs.getString("book_author");
		bookedition=rs.getString("book_edition");
		bookcat=rs.getString("book_cat");
		booknumber=rs.getString("book_number");
		bookprice=rs.getFloat("book_price");
		booklrnd=rs.getInt("book_lrnd");
		booklend=rs.getInt("book_lend");
		
		rs.close();
		
		String sql1="select book_n from book_cats where book_cat="+" '"+bookcat+"'";
		ResultSet rs1=null;
		rs1=stmt.executeQuery(sql1);
		if(rs1.next())
		{
		bookn=rs1.getString("book_n");
		}
		else
		{
			out.println("<script language='javaScript'> alert('没有找到该图书种类');</script>");
			
			
			return;
		}
		rs1.close();
		
		stmt.close();  //关闭执行语句
		conn.close();  //关闭一次连接  
		session.setAttribute("bookName", bookname);
	}
	else
	{
		out.println("<script language='javaScript'> alert('没有找到该图书');</script>");
		//out.println("<a href="search.jsp">返回</a>");
		
		return;
	}

%>
<form name="bookif">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="10%">图书编号</th>
				<th width="10%">图书名称</th>
				<th width="10%">图书作者</th>
				<th width="10%">图书出版社</th>
				<th width="10%">馆藏数量</th>
				<th width="10%">图书价格</th>
				<th width="10%">图书种类</th>
				<th width="10%">借阅数量</th>
				<th width="10%">剩余量</th>
				<th width="10%">操作</th>
			<tr>
				<td><%=bookno%></td>
				<td><%=bookname%></td>
				<td><%=bookauthor%></td>
				<td><%=bookedition%></td>
				<td><%=booknumber%></td>
				<td><%=bookprice%></td>
				<td><%=bookn%></td>
				<td><%=booklrnd%></td>
				<td><%=booklend%></td>
				<td><a href="lend_do.jsp?bookno=<%=bookno%>&bookname=<%=bookname%>&userno=<%=userno%>">借阅</a></td>
				
			</tr>
		</table>
	</form>
	<br><a href="javascript:history.back()">返回</a>


</body>
</html>