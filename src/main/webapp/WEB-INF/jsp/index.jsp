<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
		<!-- Include Google Maps JS AIP -->
		<script 
			type="text/javascript" 
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDkLhXSkaXTfPRzUrOPcb0L5iG0ldMIeeM&sensor=false">
		</script>
		<style type="text/css">
			#mapDiv { width: 800px; height: 500px; }
		</style>
		<script type="text/javascript">
			<!-- Map creation is here -->
		
			//Defining map as a global variable to access from other functions
			var map;
		
			function initMap() {
				//Enable new cartography and themes
				google.maps.visualRefresh = true;
			
				//Setting starting options of map
				var mapOptions = {
					center: new google.maps.LatLng(39.9078, 32.8252), 
					zoom: 10,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
			
				//Getting map DOM element
				var mapElement = document.getElementById('mapDiv');
			
				//Creating a map with DOM element which is just obtained
				map = new google.maps.Map(mapElement, mapOptions);
			}
		
			google.maps.event.addDomListener(window, 'load', initMap);
		</script>
		
	</head>
	<body>
		<b>2let awesome map </b>
		<div id="mapDiv"></div>
	</body>
</html>