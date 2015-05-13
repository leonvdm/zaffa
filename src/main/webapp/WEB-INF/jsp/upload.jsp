<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>

<%@ include file="../layout/taglib.jsp"%>



<div class="container-fluid">

	<div class="row">
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading">Type property address here(autocompletes)</div>
				<div class="panel-body">
					<fieldset class="details">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon">Find</span> 
							<input class="form-control" 
								data-toggle="popover"
								data-placement="right"
								data-content="Continue typing until you see your location in the list. Click your location and the form will be filled in for you."
								data-original-title="Let's find your location!" 
								id="formmapper"
								type="text" 
								placeholder="Just start typing here..."
								aria-describedby="sizing-addon" />
<!-- 							<span class="input-group-btn"> -->
<!-- 								<button id="find" class="btn btn-success" type="button"><i class="icon-map-marker icon-white"></i> Find!</button> -->
<!-- 							</span> -->
								
						</div> <!-- end of input group -->
					</fieldset>
				</div><!-- end of panel body -->
			</div><!-- end of panel -->
		</div> <!-- end of column -->
		<div class="col-md-8">
			<div class="panel panel-info">
				<div class="panel-heading">Property Features</div>
				<div class="panel-body">
				</div> <!-- end of panel body -->
			</div> <!--  end of panel -->
		</div> <!-- end of column -->
	</div> <!-- end of row -->
	
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">Address Details(autocompletes)</div>
				<div class="panel-body">
					<form action="/upload.html">
					<fieldset class="details">

							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1">Number</span>
								<input type="text" class="form-control"
									placeholder="Street number" 
									name="street_number"
									id="streetNumber"
									aria-describedby="sizing-addon1"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon2">Street</span>
								<input type="text" class="form-control" 
									placeholder="Street"
									name="route" 
									id="streetName"
									aria-describedby="basic-addon2"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon3">City</span> 
								<input
									type="text" class="form-control" 
									placeholder="City"
									name="locality"
									id="city"
									aria-describedby="basic-addon3"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon4">Province</span>
								<input type="text" class="form-control" 
									placeholder="State"
									name="administrative_area_level_1"
									id="province"
									aria-describedby="basic-addon4"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon5">Postal Code</span>
								<input type="text" class="form-control"
									placeholder="Postal Code" 
									name="postal_code"
									id="postalCode"
									aria-describedby="basic-addon5"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon6">Country</span>
								<input type="text" class="form-control" 
									placeholder="Country"
									name="country"
									id="country" 
									aria-describedby="basic-addon6"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon7">Latitude</span>
								<input type="text" class="form-control" 
									placeholder="Latitude"
									name="lat"
									id="lattitude"
									aria-describedby="basic-addon7"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon8">Longitude</span>
								<input type="text" class="form-control" 
									placeholder="Longitude"
									name="lng"
									id="longitude"
									aria-describedby="basic-addon8"/>
							</div>
						</fieldset>
						</form>
					</div><!-- end of panel body -->
				</div><!-- end of panel -->

			<div class="panel panel-info">
				<div class="panel-heading">Property Details</div>
				<div class="panel-body">
					<fieldset class="details">
	
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon10">Name</span>
							<input id="propertyName" class="form-control" placeholder="Property Name" aria-describedby="sizing-addon10"/>
	<%-- 								<form:errors path="propertyName"/> --%>
						</div>	
	
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon11">Price(R/m<sup>2</sup>)</span> 
							<input type="text" class="form-control"
								placeholder="Rand per square meter" 
								name="pricePerSqm"
								id="pricePerSqm"
								aria-describedby="sizing-addon11"/>
						</div>
	
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon12">Description</span>
							<textarea class="form-control" 
								placeholder="Description"
								name="propety_description"
								id="description" 
								aria-describedby="sizing-addon12">
							</textarea>
						</div>
	
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon13">Land size</span> 
							<input type="text" class="form-control" 
								placeholder="per square meter"
								name="plotSize"
								id="plotSize"
								aria-describedby="sizing-addon13"/>
						</div>
	
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon14">Building size</span> 
							<input type="text" class="form-control"
								placeholder="per square meter" 
								name="buildingSize"
								id="buildingSize"
								aria-describedby="sizing-addon14"/>
						</div>
					
						<div class="input-group date">
							<span class="input-group-addon" id="sizing-addon15">Date built</span> 
							<input type="text" class="form-control"
								placeholder="Date building was built" 
								name="dateConstructed"
								id="dateConstructed"
								aria-describedby="sizing-addon15">
						</div>
					
					</fieldset>
				</div> <!-- end of panel body -->
			</div> <!-- end of panel -->
		</div> <!-- end of col md-2 -->
		
		<div class="col-md-10">
			<div class="panel panel-info">
				<div class="panel-heading">Google Map Display</div>
				<div class="panel-body">
					<div class="map_canvas"></div>
				</div><!-- end of panel body -->
			</div><!-- end of panel -->
			
				<div class="panel panel-info">
				<div class="panel-heading">Upload Property Images</div>
				<div class="panel-body">
					<!-- The file upload form used as target for the file upload widget  -->
					<form method="POST" action="/upload.html" enctype="multipart/form-data" class="dropzone" id="filedropzone">
	
	  					<div class="fallback">
    						<input name="file" type="file" multiple />
  						</div>
					</form>
					
					<script>
                 		Dropzone.options.filedropzone = {
							// url does not has to be written if we have wrote action in the form tag but i have mentioned here just for convenience sake 
          					url: 'upload.html', 
          					addRemoveLinks: true,
          					autoProcessQueue: false, // this is important as you dont want form to be submitted unless you have clicked the submit button
          					autoDiscover: false,
          					paramName: 'pic', // this is optional Like this one will get accessed in php by writing $_FILE['pic'] // if you dont specify it then bydefault it taked 'file' as paramName eg: $_FILE['file'] 
          					clickable: true, // this tells that the dropzone will not be clickable . we have to do it because v dont want the whole form to be clickable 
          					accept: function(file, done) {
            					console.log("uploaded");
            					done();
          					},
         					error: function(file, msg){
            					alert(msg);
          					},
          					init: function() {

              					var fileDropzone = this;
              			
              					this.on("sending", function (file, xhr, formData) {
              	            		formData.append("streetNumber", $("#streetNumber").val());
              	          			formData.append("streetName", $("#streetName").val());
              	          			formData.append("city", $("#city").val());
              	          			formData.append("province", $("#province").val());
              	          			formData.append("postalCode", $("#postalCode").val());
              	          			formData.append("country", $("#country").val());
              	          			formData.append("lattitude", $("#lattitude").val());
              	          			formData.append("longitude", $("#longitude").val());
              	          	
              	          			formData.append("propertyName", $("#propertyName").val());
              	          			formData.append("pricePerSqm", $("#pricePerSqm").val());
              	          			formData.append("description", $("#description").val());
              	          			formData.append("plotSize", $('#plotSize').val());
              	          			formData.append("buildingSize", $('#buildingSize').val());
              	          			formData.append("dateConstructed", $('#dateConstructed').datepicker({ dateFormat: 'dd-mm-yy' }).val());

              	        		});
              			
	            				//now we will submit the form when the button is clicked
            					$("#sbmtbtn").on('click',function(e) {
            						
               						e.preventDefault();
               			 			e.stopPropagation();
	               			 	
               			 			if (!$("#propertyName").val()) {
               			 				//insert warning message
               			 				alert("Please enter a property name!");
               			 				return;
               			 			}	
               			 			
               						if (fileDropzone.getQueuedFiles().length > 0) {                        
               							fileDropzone.processQueue();  
               						} else {
               							//submit values without images
               							alert("DATE: " + $("#dateConstructed").datepicker({ dateFormat: 'dd-mm-yy' }).val());
               				   			$.post( "uploadNoImages.html", { 

               				   					streetNumber: $("#streetNumber").val(),
               				   					streetName: $("#streetName").val(),
               				   					city: $("#city").val(),
               				   					province: $("#province").val(),
               				   					postalCode: $("#postalCode").val(),
               				   					country: $("#country").val(),
               				   					lattitude: $("#lattitude").val(),
               				   					longitude: $("#longitude").val(),
               				   					
               				 					propertyName: $("#propertyName").val(),
               									pricePerSqm: $("#pricePerSqm").val(),
               									description: $("#description").val(),
               									plotSize: $("#plotSize").val(),
               									buildingSize: $("#buildingSize").val(),
               									dateConstructed: $("#dateConstructed").datepicker({ dateFormat: 'dd-mm-yy' }).val()
               				   			
               				   				}
               				   			);
               							//fileDropzone.uploadFiles([]);
               					
               						}
            					});

          					} // init end

        				};

        		</script>
				
				</div> <!--end of panel body  -->
			</div> <!-- end of panel  -->
			
		</div><!-- end of column -->
	</div> <!--  end of row -->

	<button id="sbmtbtn" type="button" class="btn btn-primary">Submit</button>
</div> <!--  end of container fluid -->

<script>
	$(function() {
		$("#formmapper").formmapper({
			map : ".map_canvas",
			findme : true,
			country : 'za',
			details : "form",
			markerOptions : {
				draggable : true
			}
		});

		$("#formmapper").bind(
				"geocode:dragged",
				function(event, latLng) {
					$("#formmapper").formmapper("find",
							latLng.lat() + "," + latLng.lng());
				});

		$("#find").click(function() {
			$("#formmapper").trigger("geocode");
		}).click();

		$('#formmapper').popover({
			'trigger' : 'focus'
		});
		
		$( "#saveButton" ).click(function() {
			  uploadProperty();
			});

		$('input:disabled').val('Add location above');
		
		$('#dateConstructed').datepicker({
			 changeMonth: true,
		      changeYear: true,
		      dateFormat: "dd/mm/yy",
		      yearRange: "-100:+0" //last 100 years
		});
	});
</script>
