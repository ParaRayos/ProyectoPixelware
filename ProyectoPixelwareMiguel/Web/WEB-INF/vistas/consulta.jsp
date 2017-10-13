<!DOCTYPE html>
<html ng-app="appTiempo">
<head>
<meta charset="UTF-8">
<title>Aplicación de consulta del tiempo</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/estilo.css">

<script type="text/javascript">
	window.history.forward();
	function sinVueltaAtras() {
		window.history.forward();
	}
</script>
<style type="text/css">
</style>
</head>
<body onload="sinVueltaAtras();"
	onpageshow="if (event.persisted) sinVueltaAtras();" onunload=""
	ng-cloak ng-controller="appController">

	<div class="well divconsulta">
		<div class="form-group">
			<label>Ciudad: </label> <input class="form-control" ng-model="ciudad" />
		</div>
		<button class="btn btn-primary btn-block" ng-click="buscatemp()">Busca
			temperatura</button>
		<br />
		<div ng-show="en">
			Ciudad consultada: {{datosTemp.location.name}} <br /> Temperatura
			actual: {{datosTemp.current.temp_c}} ºC <span><img
				src="{{datosTemp.current.condition.icon}}" /></span>
		</div>

		<div>
			<div ng-hide="en">
				<br /> <br /> <br /> <br />
			</div>
			<a href="inicio.html">Cerrar sesión</a>
		</div>
	</div>
	<!-- AngularJS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular.min.js">
		
	</script>

	<script type="text/javascript">
		var servicios = angular.module("appTiempo", []);

		// Creación del controlador principal
		var controlador = servicios
				.controller(
						"appController",
						[
								"$scope",
								"$http",
								function($scope, $http) {

									$scope.datosTemp = {};

									$scope.en = false;

									$scope.buscatemp = function() {
										$http(
												{
													method : 'GET',
													url : 'https://api.apixu.com/v1/current.json?key=675048a6cea14b65bf4102639170610&q='
															+ $scope.ciudad
												})
												.success(
														function(datos, status,
																headers, config) {
															$scope.datosTemp = datos;
															$scope.en = true;
														})
												.error(
														function(datos, status,
																headers, config) {
															alert("Error carga de datos servicio $http\n"
																	+ "Código HTTP error: "
																	+ status);
														});
									}

								} ]);
	</script>
</body>
</html>