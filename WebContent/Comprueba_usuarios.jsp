<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>

	<%
	
	String usuario=request.getParameter("usuario");
	String contrasena=request.getParameter("contrasena");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try{
	
	Connection miConexion=DriverManager.getConnection("jdbc:mysql://localhost/proyectojsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
	PreparedStatement c_preparada=miConexion.prepareStatement("SELECT * FROM USUARIOS WHERE USUARIO=? AND CONTRASENA=?");
	c_preparada.setString(1, usuario);
	c_preparada.setString(2, contrasena);
	ResultSet miResultSet=c_preparada.executeQuery();
	
	if(miResultSet.absolute(1)) out.println("Usuario Autorizado");
	else out.println("No hay usuarios con esos datos");
	
	}catch(Exception e){
		out.println("Ha habido un error");
	}
	%>

</body>
</html>