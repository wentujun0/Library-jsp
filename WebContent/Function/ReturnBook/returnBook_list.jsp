<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户的借阅信息</title>


</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String operator = request.getParameter("userno");
	String user_No = request.getParameter("search2");
	out.println("operator:"+operator+"<br>");
%>

<form name="fm">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="10%">借阅表序号</th>
				<th width="20%">用户编号</th>
				<th width="20%">图书编号</th>
				<th width="20%">图书名称</th>
				<th width="20%">借阅时间</th>
				<th width="10">操作</th>
			</tr>
			<%
				int lrifNo = 0; //
				String userNo = ""; //
				String bookNo = ""; //
				String bookName = ""; //
				java.sql.Date lendTime=null;
				
				String sql = "select * from book_lrif where book_statue='0'and user_no="+" '"+user_No+"' ";
				int i = 0;
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
				while (rs.next()) {
					i = i + 1;
					lrifNo = rs.getInt("lrif_no");
					userNo = rs.getString("user_no");
					bookNo = rs.getString("book_no");
					bookName = rs.getString("book_name");
					lendTime=rs.getDate("lend_time");
			%>

			<tr>
				<td><%=lrifNo %></td>
				<td><%=userNo%></td>
				<td><%=bookNo%></td>
				<td><%=bookName%></td>
				<td><%=lendTime%></td>
				<td><a href="returnBook_do.jsp?lrifno=<%=lrifNo%>&operator=<%=operator%>&userno=<%=userNo%>">还书</a></td>
			</tr>
			<%
				}
				}
				else{
					out.println("<script language='javaScript'> alert('注册失败!');</script>");
				}
			%>
		</table>
		<br> <a href="../../Manage/aduser.jsp">返回</a>
			
	</form>





</body>
</html>