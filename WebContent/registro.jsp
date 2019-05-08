<html>
<body>
<h1>
Usuarios Registrados
</h1>

Usuario confirmado:
<br>
nombre: <%= request.getParameter("nombre") %> &nbsp; apellido: <%= request.getParameter("apellido") %>
<br>
<jsp:include page="Fecha.jsp"></jsp:include>

</body>
</html>