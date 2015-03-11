<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  taglibs -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!--  css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<link href="<spring:url value="/resources/css/custom.css" />" rel="stylesheet">
	
	<link href="<spring:url value="/resources/css/Layout.css" />" rel="stylesheet">
	
	<!--  javascript -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<%-- <link href="<spring:url value="/resources/js/modernizr-latest.js" />" rel="stylesheet"> --%>
	
	<title><tiles:getAsString name="title"></tiles:getAsString></title>
	<tilesx:useAttribute name="current" />
	
	<!-- Include Google Maps JS AIP -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkLhXSkaXTfPRzUrOPcb0L5iG0ldMIeeM&libraries=places&sensor=false"></script>
<!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=panoramio"></script> -->
<script type="text/javascript">
	<!-- Map creation is here -->
	
	//Defining map as a global variable to access from other functions
	var map;
	var panoramioLayer;
	
	//define a global markers array variable, to push and pop the marker overlays
	var markers;
	
	//define global marker popup variable
	var popup;
	
	//uses the whole screen below the header section to render map relative to current screensize
	function setDimensions() {
		
		var viewPortWidth = $(window).width() - 17;
		var viewPortHeight = $(window).height() - $("#zaffaHeader").height() - 60;
		$("#map_canvas").width(viewPortWidth).height(viewPortHeight);
	}

	function initMap() {
		setDimensions();
		
		//initialize markers array
		markers = new Array();
		
		//initialize info popup window
		popup = new google.maps.InfoWindow();
		
		//Enabling new cartography and themes
        google.maps.visualRefresh = true;
		
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(displayLocation);
		} else {
			alert('Oops, no geolocation support');
			google.maps.visualRefresh = true;
			
			displayLocation(new google.maps.LatLng(-33.876787983965244, 18.556208610534668));
// 			var mapOptions = {
// 		               zoom: 18,
// 		               center: new google.maps.LatLng(-33.876787983965244, 18.556208610534668),
// 		               mapTypeId: google.maps.MapTypeId.ROADMAP
// 		           };
			
		  		
		  		//panoramioLayer = new google.maps.panoramio.PanoramioLayer();
		  		//panoramioLayer.setMap(map);
		}
	
	}
	
	function displayLocation(position) {
		//The latitude and longitude values obtained from HTML 5 API.
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		
		//Creating a new object for using latitude and longitude values with Google map.
		var latLng = new google.maps.LatLng(latitude, longitude);
		showMap(latLng);
		createMarker(latLng);
	}
	
	function showMap(latLng) {
		  //Setting up the map options like zoom level, map type.
		  var mapOptions = {
		    center: latLng,
		    zoom: 15,
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  };

		  //Creating the Map instance and assigning the HTML div element to render it in.
		  map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		  map.controls[google.maps.ControlPosition.TOP_LEFT].push(leon);
	  	  //panoramioLayer = new google.maps.panoramio.PanoramioLayer();
	  	  //panoramioLayer.setMap(map);
	  	  
		//handle for input element
			var searchField = document.getElementById('pac-input');
			
			//autocomplete search options
			var searchOptions = {
				bounds: new google.maps.LatLngBounds(
					new google.maps.LatLng(-8.54, 17.33),
					new google.maps.LatLng(39.67, 43.77)
				),
				types: new Array()
			};

			//Autocomplete search request with supplying input html element and options
			var autocompleteSearch = new google.maps.places.Autocomplete(searchField, searchOptions);
			
			google.maps.event.addListener(autocompleteSearch, 'place_changed', function() {
				
				//clear all previously drawn markers
				while(markers[0])
				{
					markers.pop().setMap(null);
				}
				
				//get the PlaceResult object
				var place = autocompleteSearch.getPlace();
				if (place) {
					if (place.geometry) {
						pinpointResult(place);
					}
				}
			});
			
			getProvinces();
		}
	
	//put a marker in the map and attach a infowindow to display its details
	function pinpointResult(result) {
		//marker stuff
		var placeIcon = {
			url: result.icon,
			scaledSize: new google.maps.Size(30, 30)
		};
		
		var marker = new google.maps.Marker({
			map: map,
			position: result.geometry.location,
			icon: placeIcon
		});
		
		map.setCenter(result.geometry.location);
		map.setZoom(16);

		//infowindow stuff
		google.maps.event.addListener(marker, 'click', function() {
			//debugger;
			var popupContent = '<b>Name: </b> ' + result.name + '<br/>' + '<b>Vicinity: </b>' + result.vicinity;
			popup.setContent(popupContent);
			popup.open(map, this);
		});
	
		//add the latest drawn marker to the markers array
		markers.push(marker);
	}
	
	function createMarker(latLng) {
		  //Setting up the marker object to mark the location on the map canvas.
		  var markerOptions = {
		    position: latLng,
		    map: map,
		    animation: google.maps.Animation.DROP,
		    clickable: true
		  }
		  var marker = new google.maps.Marker(markerOptions);

		  var content = 'You are here: ' + latLng.lat() + ', ' + latLng.lng();
		  addInfoWindow(marker, latLng, content);

		}
	
	
	function addInfoWindow(marker, latLng, content) {
		var infoWindowOptions = {
			content : content,
			position : latLng
		};

		var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

		google.maps.event.addListener(marker, 'click', function() {
			infoWindow.open(map);
		});
	}
	
	function getProvinces() {
// 		var options = {
// 				input: ['town'],
// 				  types: ['(cities)'],
// 				  componentRestrictions: {country: 'za'}
// 				 };
		
// 		var service = new google.maps.places.AutocompleteService();


	var request = {
			address : address,
			componentRestrictions : {
				country : 'UK'
			}
		}
		geocoder.geocode(request, function(results, status) {
			//...
		});

		//perform request. limit results to Australia
		// 		var request = {
		// 		    input: 'Brisbane',
		// 		    componentRestrictions: {country: 'au'},
		// 		};

		service.getPlacePredictions(options, callbackPlaces);
	}

	function callbackPlaces(predictions, status) {
		if (status != google.maps.places.PlacesServiceStatus.OK) {
			alert(status);
			return;
		}

		for (var i = 0, prediction; prediction = predictions[i]; i++) {
			alert(prediction.description);
		}

		// 		for (var i = 0; i < predictions.length; i++) {
		//             googlePlacesService = new google.maps.places.PlacesService(document.getElementById("q"));
		//             googlePlacesService.getDetails({
		//                 reference: predictions[i].reference
		//             }, function(details, status){
		//                 if(details){
		//                     console.log(details.geometry.location.toString());
		//                 }
		//             });
		//             console.log(predictions[i].description);
		//         }

	}

	google.maps.event.addDomListener(window, 'load', initMap);
</script>
</head>

<body>
	<div class="MainWrapper" >
    	<div class="Header" id="zaffaHeader">
        	<a href="#">
				<img src="<spring:url value='/resources/images/ToLet-logo.png'/>" class="Logo">
			</a>
				
			<div class="Nav">
			 	<a href='<spring:url value="/find.html"/>' class="HeaderText">Find</a>
			 	<a href='<spring:url value="/upload.html"/>' class="HeaderText">List your property</a>
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
		</div> <!--  End of Zaffa Header -->
	</div>
	
	<div class="container">
		<div id="leon"> 
			<div class="form-group">
				<div class="col-sm-10">
					<div id="searchDiv">
						<input id="pac-input" type="text" size="40"  placeholder="Search for Places"></input>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="map_canvas"></div>
	<div class="container">
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>



</html>