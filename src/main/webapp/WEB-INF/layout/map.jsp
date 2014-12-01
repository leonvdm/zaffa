<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
  			html { height: 100% }
  			body { height: 300px; margin: 0; padding: 0 }
  
  			.map_container {
    			position: relative;
    			width: 100%;
    			padding-bottom: 56.25%; /* Ratio 16:9 ( 100%/16*9 = 56.25% ) */
  			}
	
			.map_container .map_canvas {
    			position: absolute;
    			top: 0;
    			right: 0;
    			bottom: 0;
    			left: 0;
    			margin: 0;
    			padding: 0;
			}
			
		</style>
<!-- Include Google Maps JS AIP -->
		<script 
			type="text/javascript" 
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkLhXSkaXTfPRzUrOPcb0L5iG0ldMIeeM&sensor=false">
		</script>
		
		<script type="text/javascript">
      function initialize() {
        var mapOptions = {
          center: { lat: -34.397, lng: 150.644},
          zoom: 8
        };
        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>

</head>
<body>

	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
	
	<tilesx:useAttribute name="current"/>

	<div class="container">


		<!-- Static navbar -->
		<div class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Industrial To Let</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="${current == 'index' ? 'active' : ''}"><a href='<spring:url value="/"/>'>Home</a></li>
						<security:authorize access="hasRole('ADMIN')">
							<li class="${current == 'users' ? 'active' : ''}"><a href='<spring:url value="/users.html"/>'>Users</a></li>
						</security:authorize>
						<li class="${current == 'register' ? 'active' : ''}"><a href='<spring:url value="/register.html"/>'>Register</a></li>
						<security:authorize access="! isAuthenticated()">
							<li class="${current == 'login' ? 'active' : ''}"><a href='<spring:url value="/login.html"/>'>Login</a></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li class="${current == 'account' ? 'active' : ''}"><a href='<spring:url value="/account.html"/>'>My account</a></li>
							<li><a href='<spring:url value="/logout"/>'>Logout</a></li>
						</security:authorize>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</div>

		<tiles:insertAttribute name="body" />

		<br> <br>
		<center>
			<tiles:insertAttribute name="footer" />
		</center>

	</div>
</body>
</html>