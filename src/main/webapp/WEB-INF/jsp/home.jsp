<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<%@ include file="../layout/taglib.jsp" %>

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
	</div>
    
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