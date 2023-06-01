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
String name = request.getParameter("name");
String password = request.getParameter("pass");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc", "root", "Nikitha@08");
	PreparedStatement stmt = conn.prepareStatement("select name from user1 where name=? and password=?");
	stmt.setString(1, name);
	stmt.setString(2, password);
	ResultSet rs = stmt.executeQuery();
	if (rs.next()) {
		out.println("Login success");
		out.println("<html><body>");
		out.println("<a href='success.jsp'>Home</a>");
		out.println("</body></html>");
	} else {
		out.println("Login Fail");
		out.println("<html><body>");
		out.println("<a href='error.jsp'>Home</a>");
		out.println("</body></html>");
	}
} catch (ClassNotFoundException ex) {
	ex.printStackTrace();
} catch (SQLException ex) {
	ex.printStackTrace();
}
%>
</body>
</html>