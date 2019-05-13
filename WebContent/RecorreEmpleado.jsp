<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*, java.sql.*, pildorasInformaticas.empleado"%>


<%
	ArrayList<empleado> datos = new ArrayList<empleado>();
	Class.forName("com.mysql.cj.jdbc.Driver");
	try {
		Connection miConexion = DriverManager.getConnection(
				"jdbc:mysql://localhost/proyectojsp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "");
		Statement miStatement = miConexion.createStatement();
		String instruccionSql = "SELECT * FROM EMPLEADOS";
		ResultSet rs = miStatement.executeQuery(instruccionSql);
		while (rs.next()) {
			datos.add(new empleado(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4)));

		}
		rs.close();
		miConexion.close();

	} catch (Exception e) {
		out.println("Ha habido un error");
	}

	pageContext.setAttribute("losEmpleados", datos);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.cabezera {
	font-weight: bold;
}
</style>
</head>
<body>
	<table border="1">

		<tr class="cabezera">
			<td>Nombre</td>
			<td>Apellido</td>
			<td>Puesto</td>
			<td>Salario</td>
		</tr>


		<tr>
			<c:forEach var="EmpTemp" items="${ losEmpleados}">
				<td>${EmpTemp.nombre }</td>
				<td>${ EmpTemp.apellido}</td>
				<td>${ EmpTemp.puesto}</td>
				<td><c:choose>
						<c:when test="${ EmpTemp.salario<18}">
					${ EmpTemp.salario+5000}
					</c:when>

						<c:when test="${ EmpTemp.salario>18 && EmpTemp.salario<=30}">
					${ EmpTemp.salario+2000}
					</c:when>
						<c:otherwise>
					${ EmpTemp.salario}
					</c:otherwise>

					</c:choose></td>

				<br>
		</tr>

		</c:forEach>
	</table>


</body>
</html>