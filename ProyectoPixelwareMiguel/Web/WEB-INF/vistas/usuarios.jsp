<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%-- Librería de etiquetas form de Spring --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%-- Librería de etiquetas core de JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Formulario de registro de usuarios</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>
<body>

	<%-- Guardar en variable la URl de una nueva pagina --%>
	<c:url var="peticion" value="registrar.html" />

	<%-- Crear formulario de Spring asociado al atributo
	     del modelo usuario. En el atributo action especikficamos
	     el metodo de negocio del controlador que se va a
	     ejecutar y que recibe el objeto UsuarioForm asociado
	     al formulario --%>
	<div class="well divregistro form-group">
		<form:form id="list" modelAttribute="usuarioForm" method="post"
			action="${peticion}">

			<table width="350px" height="120px">
				<tr>
					<td><h5><form:label path="email">Introduzca su email:</form:label></h5>
					</td>
					<td>
						<%-- Enlazar caja a la propiedad email del objeto UsuarioForm
						 asociado al formulario --%> <form:input type="email" path="email"
							pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}"
							required="required" title="RFC" class="form-control" />
					</td>
				</tr>

				<tr>
					<td><h5><form:label path="pass">Introduzca su contraseña:</form:label></h5>
					</td>
					<td>
						<%-- Enlazar caja a la propiedad email del objeto AlumnoForm
						 asociado al formulario --%> <form:input type="password"
							path="pass" required="required" class="form-control" />
					</td>
				</tr>

				<tr>
					<td><h5><form:label path="confirmPass">Repita su contraseña:</form:label></h5>
					</td>
					<td>
						<%-- Enlazar caja a la propiedad confirmPass del objeto UsuarioForm
						 asociado al formulario --%> <form:input type="password"
							path="confirmPass" required="required" class="form-control" />
					</td>
				</tr>

				<tr>
					<td><h5><form:label path="pais">Seleccione su país de origen:</form:label></h5>
					</td>
					<td>
						<%-- Enlazar lista a la propiedad pais del objeto UsuarioForm
						 asociado al formulario --%> <form:select path="pais"
							items="${paises}" required="required" class="form-control">
						</form:select>
					</td>
				</tr>

				<tr>
					<td><h5><form:label path="fecha">Seleccione su fecha de nacimiento:</form:label></h5>
					</td>
					<td>
						<%-- Enlazar datapicker a la propiedad fecha del objeto UsuarioForm
						 asociado al formulario --%> <form:input type="date" step="1"
							path="fecha" required="required" class="form-control" />
					</td>
				</tr>
			</table>
			<br/>
			
			<input type="submit" class="btn btn-primary btn-block"
				value="   Registrar nuevo usuario   " class="form-control" />

		</form:form>
		<c:if test="${mensaje != 'ok'}">
			<h5>${mensaje}</h5>
		</c:if>
	</div>
</body>
</html>