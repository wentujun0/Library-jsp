<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借阅图书信息</title>
</head>
<body>
<form name="fm">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="10%">序号</th>
				<th width="10%">用户编号</th>
				<th width="10%">图书编号</th>
				<th width="20%">图书名称</th>
				<th width="20%">借书时间</th>
				<th width="20%">还书时间</th>
				<th width="10%">图书状态</th>
				<th width="10%">操作者</th>
			</tr>
			<%
				int lrifNo = 0; //
				String userNo = ""; //
				String bookNo = ""; //
				String bookName= ""; //
				java.sql.Date lendTime=null;
				java.sql.Date returnTime=null;
				String bookStatue="";
				String operator="";
				String Statue=null;
				//数据库操作
				String sql = "select * from book_lrif";
				int i = 0;
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					i = i + 1;
					lrifNo=rs.getInt("lrif_no");
					userNo= rs.getString("user_no");
					bookNo= rs.getString("book_no");
					bookName= rs.getString("book_name");
					bookStatue= rs.getString("book_statue");
					operator= rs.getString("operator");
					lendTime=rs.getDate("lend_time");
					try{
					returnTime=rs.getDate("return_time");
					}
					catch(SQLException e){
						out.println("错误"+e+"<br>");
					}
					if(bookStatue.equals("1"))
					{
						Statue="在库中";
					}
					else if(bookStatue.equals("0"))
					{
						Statue="出库";
					}
			%>

			<tr>
				<td><%=lrifNo %></td>
				<td><%=userNo%></td>
				<td><%=bookNo%></td>
				<td><%=bookName%></td>
				<td><%=lendTime%></td>
				<td><%=returnTime%></td>
				<td><%=Statue%></td>
				<td><%=operator%></td>
				
			</tr>
			<%
				}
			%>
		</table>
		<br> <a href="javascript:history.back()">返回</a><br> 
	</form>




</body>
</html>