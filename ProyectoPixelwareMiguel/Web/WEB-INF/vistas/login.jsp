<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%-- Librería de etiquetas form de Srping --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- Librería de etiquetas core de JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login app consulta del tiempo Miguel</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>

	<%-- Guardar en variable la URl de una nueva pagina --%>
	<c:url var="peticion" value="consultaTiempo.html" />

	<%-- Crear formulario de Spring asociado al atributo
	     del modelo usuario. En el atributo action especikficamos
	     el metodo de negocio del controlador que se va a
	     ejecutar y que recibe el objeto UserForm asociado
	     al formulario --%>
	<div class="well divlogin form-group">
		<form:form id="login" modelAttribute="usuario" method="post"
			action="${peticion}">

			<table width="350px" height="120px">
				<tr>
					<td><form:label path="email">Email</form:label></td>
					<td>
						<%-- Enlazar caja a la propiedad email del objeto
						 asociado al formulario --%> <form:input path="email"  class="form-control"/>
					</td>
				</tr>

				<tr>
					<td><form:label path="pass">Contraseña</form:label></td>
					<td>
						<%-- Enlazar caja a la propiedad pass del objeto
						 asociado al formulario --%> <form:password path="pass"  class="form-control" />
					</td>
				</tr>

			</table>
			<input type="submit" class = "btn btn-primary btn-block" value="   Login   " />
			
		</form:form>
		<%-- Mostrar valor de atributo de peticion mensaje si es
		distinto a ok --%>
		<c:if test="${mensaje != 'ok'}">
			<h5>${mensaje}</h5>
		</c:if>
		<br/>
		<h5>
			<a href="nuevoUsuario.html">Registrar un nuevo usuario</a>
		</h5>
	</div>
</body>
</html>