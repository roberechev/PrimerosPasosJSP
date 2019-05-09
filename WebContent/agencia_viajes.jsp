<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1 style="text-align:center">Agencia de viajes</h1>

	<%
		//Valor por defecto
		String ciudad_favorita="Madrid";
	
		//lee la cookie del navegador
		Cookie[]lasCookies=request.getCookies();
		
		//Buscar las preferencias(CIUDAD FAVORITA)
		if(lasCookies!=null){
			for(Cookie cookie_temporal:lasCookies){
				if("agencia_viajes.ciudad_favorita".equals(cookie_temporal.getName())){
					ciudad_favorita=cookie_temporal.getValue();
				}
			}
		}	
		
	%>

<h3>Vuelos a <%=ciudad_favorita%></h3>

<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>

<h3>Hoteles en <%=ciudad_favorita%></h3>

<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>

<h3>Descuentos en restaurantes de <%=ciudad_favorita%></h3>

<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>
<p>Texto de Ejemplo</p>


</body>
</html>