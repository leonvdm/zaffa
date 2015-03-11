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

<%-- 	<link href="<spring:url value="/resources/css/custom.css" />" rel="stylesheet"> --%>
	
<%-- 	<link href="<spring:url value="/resources/css/bootstrap.css" />" rel="stylesheet"> --%>
	<link href="<spring:url value="/resources/css/Layout.css" />" rel="stylesheet">
	<link href="<spring:url value='/resources/css/Styles.css' />" rel="stylesheet">
	
	<title><tiles:getAsString name="title"></tiles:getAsString></title>
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
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
      
          		<h3>Property Address</h3>
            	<form>
            		<fieldset class="details">
            			<div class="input-group">
            				<span class="input-group-addon" id="sizing-addon">Find</span>             
              				<input class="form-control" data-toggle="popover" data-placement="right" data-content="Continue typing until you see your location in the list. Click your location and the form will be filled in for you." data-original-title="Let's find your location!" id="formmapper" type="text" placeholder="Just start typing here..." aria-describedby="sizing-addon"/>
<!--               		<span class="input-group-btn"> -->
<!--               			<button id="find" class="btn btn-success" type="button"><i class="icon-map-marker icon-white"></i> Find!</button> -->
<!--               		</span> -->
              		
              			</div>
              		</fieldset>
<!--               	<span id="helpBlock" class="help-block">It could be just about anything: a full address, a city, just the zip/postal code, or even the name of a place.</span> -->
              	
            	</form>
     
          
           		<div>
            		<form>
            			<fieldset class="details">
                			<h3>Address Details</h3>
                			<div class="input-group">
                  				<span class="input-group-addon" id="sizing-addon1">Number</span>
                  				<input type="text" class="form-control" placeholder="Street number" name="street_number" aria-describedby="sizing-addon1">
                			</div>
                			<div class="input-group">
                  				<span class="input-group-addon" id="basic-addon2">Street</span>
                  				<input type="text" class="form-control" placeholder="Street" name="route" aria-describedby="basic-addon2">
                			</div>
                			<div class="input-group">
                  				<span class="input-group-addon" id="basic-addon3">City</span>
                  				<input type="text" class="form-control" placeholder="City" name="locality" aria-describedby="basic-addon3">
                			</div>
			                <div class="input-group">
			                  <span class="input-group-addon" id="basic-addon4">State</span>
			                  <input type="text" class="form-control" placeholder="State" name="administrative_area_level_1" aria-describedby="basic-addon4">
			                </div>
			                <div class="input-group">
			                  <span class="input-group-addon" id="basic-addon5">Postal Code</span>
			                  <input type="text" class="form-control" placeholder="Postal Code" name="postal_code" aria-describedby="basic-addon5">
			                </div>
			                <div class="input-group">
			                  <span class="input-group-addon" id="basic-addon6">Country</span>
			                  <input type="text" class="form-control" placeholder="Country" name="country" aria-describedby="basic-addon6">
			                </div>
			                <div class="input-group">
			                  <span class="input-group-addon" id="basic-addon7">Latitude</span>
			                  <input type="text" class="form-control" placeholder="Latitude" name="lat" aria-describedby="basic-addon7">
			                </div>
			                <div class="input-group">
			                   <span class="input-group-addon" id="basic-addon8">Longitude</span>
			                   <input type="text" class="form-control" placeholder="Longitude" name="lng" aria-describedby="basic-addon8">
			                </div>
			              </fieldset>
            		</form>  
          		</div>
        	</div> <!-- col-md-4  -->
        
        	<div class="col-md-10">
          		<h3>Google Map Display</h3>
          		<div class="map_canvas"></div>
       		</div>
      	</div> <!--  end of row -->
      	<div class="row-fluid">
      		
      		<h3>Property Description and Price</h3>
			<form>
				<fieldset class="details">
					<div class="input-group">
            			<span class="input-group-addon" id="sizing-addon10">Name</span>
                		<input type="text" class="form-control" placeholder="Property Name" name="propety_name" aria-describedby="sizing-addon1">
           			</div>
           			<div class="input-group">
            			<span class="input-group-addon" id="sizing-addon11">Price(R)</span>
                		<input type="text" class="form-control" placeholder="Price per square meter" name="propety_price" aria-describedby="sizing-addon11">
           			</div>
					<div class="input-group">
            			<span class="input-group-addon" id="sizing-addon13">Description</span>
                		<textarea class="form-control" placeholder="Description" name="propety_description" aria-describedby="sizing-addon13"></textarea>
           			</div>
			
				</fieldset>
			</form>
      
       		<h3>Property Details</h3>
       		<form>
         		Land size in square meter
         		Building size in sqaure meter
         		Year built
         
       		</form>

	
		</div> <!--  end of row -->
	</div>
	
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script src="<spring:url value="/resources/js/formmapper.js" />"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <script>
	
      $(function(){
        $("#formmapper").formmapper({
          map: ".map_canvas",
          findme: true,
          country: 'za',
          details: "form",
          markerOptions: {
            draggable: true
          }
        });
        
        $("#formmapper").bind("geocode:dragged", function(event, latLng){
		  $("#formmapper").formmapper("find",latLng.lat()+","+latLng.lng());
        });
        
        
        $("#find").click(function(){
          $("#formmapper").trigger("geocode");
        }).click();
		
		$('#formmapper').popover({'trigger': 'focus'});
		
		$('input:disabled').val('Add location above');

      });
    </script>
</body>
</html>