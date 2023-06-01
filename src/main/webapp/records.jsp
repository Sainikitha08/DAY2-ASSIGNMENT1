<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int amount = Integer.parseInt(request.getParameter("amount"));
int accno = Integer.parseInt(request.getParameter("accno"));
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc","root","Nikitha@08");
	PreparedStatement stmt = conn.prepareStatement("insert into details values(?,?)");
	stmt.setInt(1, amount);
	stmt.setInt(2, accno);
	int i = stmt.executeUpdate();
	if(i>0){
		out.println("details entered successfully");
		out.println("<html><body>");
		out.println("<a href='showdetails.jsp'>Show Records</a>");
		out.println("</body></html>");
	}
	else{
		out.println("Login Fail");
		out.println("<html><body>");
		out.println("<a href='Home.html'>Home</a>");
		out.println("</body></html>");
	}
	
}catch(ClassNotFoundException ex) {
	ex.printStackTrace();
}catch(SQLException ex) {
	ex.printStackTrace();
}
%>
</body>
</html>