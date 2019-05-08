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
	String nombre=request.getParameter("nombre");
	String apellido=request.getParameter("apellido");
	String usuario=request.getParameter("usuario");
	String contrasena=request.getParameter("contra");
	String pais=request.getParameter("pais");
	String tecnologias=request.getParameter("tecnologias");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try{
	
	Connection miConexion=DriverManager.getConnection("jdbc:mysql://localhost/proyectojsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	Statement miStatement=miConexion.createStatement();
	
	String instruccionSql="INSERT INTO USUARIOS (nombre, apellido, usuario, contrasena, pais, tecnologias) VALUES ('"+nombre+"','"+apellido+"','"+usuario+"','"+contrasena+"','"+pais+"','"+tecnologias+"')";
	miStatement.executeUpdate(instruccionSql);
	
	out.println("Registro con exito");
	}catch(Exception e){
		out.println("Ha habido un error");
	}
	%>
	
	

</body>
</html>