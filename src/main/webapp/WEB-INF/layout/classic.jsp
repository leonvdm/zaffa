<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link href="<spring:url value="/resources/css/Layout.css" />" rel="stylesheet">
	
<%-- <link href="<spring:url value="/resources/js/modernizr-latest.js" />" rel="stylesheet"> --%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><tiles:getAsString name="title"></tiles:getAsString></title>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- Include Google Maps JS AIP -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkLhXSkaXTfPRzUrOPcb0L5iG0ldMIeeM&sensor=false">
	
</script>

<tilesx:useAttribute name="current" />
</head>

<body>
	<div class="MainWrapper" >
    	<div class="Header" id="zaffaHeader">
        	<a href="#">
				<img src="<spring:url value='/resources/images/ToLet-logo.png'/>" class="Logo">
			</a>
				
			<div class="Nav">
			 	<a href='<spring:url value="/find.html"/>' class="HeaderText">Find</a>
			 	<a href='<spring:url value="/upload.html"/>' class="HeaderText">Upload</a>
			 	<a href='<spring:url value="/contact.html"/>' class="HeaderText">Contact</a>
			 	<security:authorize access="! isAuthenticated()">
			 		<a href='<spring:url value="/login.html"/>' class="HeaderText">Login</a>
			 		<a href='<spring:url value="/register.html"/>' class="HeaderText">Register</a>
			 	</security:authorize>
			 	<security:authorize access="isAuthenticated()">
					<a href='<spring:url value="/account.html"/>' class="HeaderText">My account</a>
					<a href='<spring:url value="/logout"/>' class="HeaderText">Logout</a>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<a href='<spring:url value="/users.html"/>' class="HeaderText">Users</a>
				</security:authorize>
			</div>
		</div>
            	
       <div id="map_canvas">
       </div>
	</div>
	
</body>

<div class="container">
	<tiles:insertAttribute name="body" />
	<br> <br>

	<center>
		<tiles:insertAttribute name="footer" />
	</center>

</div>

<script type="text/javascript">
	<!-- Map creation is here -->
	
	//Defining map as a global variable to access from other functions
	var map;
	var geocoder;
	
	//uses the whole screen below the header section to render map relative to current screensize
	function setDimensions() {
		
		var viewPortWidth = $(window).width() - 17;
		var viewPortHeight = $(window).height() - $("#zaffaHeader").height() - 60;
		$("#map_canvas").width(viewPortWidth).height(viewPortHeight);
	}

	function initMap() {
		
		setDimensions();
		
		google.maps.visualRefresh = true;
	
		var mapOptions = {
	               zoom: 14,
	               center: new google.maps.LatLng(-33.876787983965244, 18.556208610534668),
	               mapTypeId: google.maps.MapTypeId.ROADMAP
	           };
		
	  		map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	
	}
	
	google.maps.event.addDomListener(window, 'load', initMap);
</script>




</html>