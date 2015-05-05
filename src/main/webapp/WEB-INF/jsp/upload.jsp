<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>

<%@ include file="../layout/taglib.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">Type property address here</div>
				<div class="panel-body">
					<form>
						<fieldset class="details">
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon">Find</span> 
								<input
									class="form-control" data-toggle="popover"
									data-placement="right"
									data-content="Continue typing until you see your location in the list. Click your location and the form will be filled in for you."
									data-original-title="Let's find your location!" id="formmapper"
									type="text" 
									placeholder="Just start typing here..."
									aria-describedby="sizing-addon" />
									<!--               		<span class="input-group-btn"> -->
									<!--               			<button id="find" class="btn btn-success" type="button"><i class="icon-map-marker icon-white"></i> Find!</button> -->
									<!--               		</span> -->
								
							</div>
						</fieldset>
					</form>
				</div>
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->


			<div class="panel panel-info">
				<div class="panel-heading">Address Details(autocompletes)</div>
				<div class="panel-body">
					<div>
						<form>
							<fieldset class="details">

								<div class="input-group">
									<span class="input-group-addon" id="sizing-addon1">Number</span>
									<input type="text" class="form-control"
										placeholder="Street number" 
										name="street_number"
										id="street_number"
										aria-describedby="sizing-addon1">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon2">Street</span>
									<input type="text" class="form-control" 
										placeholder="Street"
										name="route" 
										id="street_name"
										aria-describedby="basic-addon2">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon3">City</span> <input
										type="text" class="form-control" 
										placeholder="City"
										name="locality"
										id="city"
										aria-describedby="basic-addon3">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon4">Province</span>
									<input type="text" class="form-control" 
										placeholder="State"
										name="administrative_area_level_1"
										id="province"
										aria-describedby="basic-addon4">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon5">Postal Code</span>
									<input type="text" class="form-control"
										placeholder="Postal Code" 
										name="postal_code"
										id="postal_code"
										aria-describedby="basic-addon5">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon6">Country</span>
									<input type="text" class="form-control" 
										placeholder="Country"
										name="country"
										id="country" 
										aria-describedby="basic-addon6">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon7">Latitude</span>
									<input type="text" class="form-control" 
										placeholder="Latitude"
										name="lat"
										id="lat"
										aria-describedby="basic-addon7">
								</div>
								<div class="input-group">
									<span class="input-group-addon" id="basic-addon8">Longitude</span>
									<input type="text" class="form-control" 
										placeholder="Longitude"
										name="lng"
										id="lng"
										aria-describedby="basic-addon8">
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- end of panel body -->
			</div>
			<!-- end of panel -->
		</div>
		<!-- col-md-2  -->

		<div class="col-md-10">
			<div class="panel panel-info">
				<div class="panel-heading">Google Map Display</div>
				<div class="panel-body">
					<div class="map_canvas"></div>
				</div>
			</div>
			<!-- end of panel -->
		</div>
		<!-- end of column -->
	</div>
	<!--  end of row -->
	<div class="row">
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">Property Details</div>
				<div class="panel-body">
					<form>
						<fieldset class="details">
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon10">Name</span>
								<input type="text" class="form-control" 
									placeholder="Property Name" 
									name="propety_name"
									id="property_name"
									aria-describedby="sizing-addon10"/>
							</div>
							
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon11">Price(R/m<sup>2</sup>)</span> 
								<input type="text" class="form-control"
									placeholder="Rand per square meter" 
									name="propety_price"
									id="property_price"
									aria-describedby="sizing-addon11"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon12">Description</span>
								<textarea class="form-control" 
									placeholder="Description"
									name="propety_description"
									id="property_description" 
									aria-describedby="sizing-addon12">
								</textarea>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon13">Plot size(m<sup>2</sup>)</span> 
								<input type="text" class="form-control" 
									placeholder="Plot size"
									name="plot_size"
									id="plot_size"
									aria-describedby="sizing-addon13"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon14">Building size(m<sup>2</sup>)</span> 
								<input type="text" class="form-control"
									placeholder="Building size" 
									name="building_size"
									id="building_size"
									aria-describedby="sizing-addon14"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon15">Year built(yyyy-mm-dd)</span> 
								<input type="text" class="form-control"
									placeholder="Year building was built" 
									name="building_date"
									id="building_date"
									aria-describedby="sizing-addon15">
							</div>
						</fieldset>
					</form>
				</div> <!-- end of panel body -->
			</div> <!-- end of panel -->
						<div class="panel panel-info">
				<div class="panel-heading">Property Features</div>
				<div class="panel-body">
				</div> <!-- end of panel body -->
			</div> <!--  end of panel -->

		</div> <!--  end of col -->

		<div class="col-md-10">
			<div class="panel panel-info">
				<div class="panel-heading">Upload Property Images</div>
				<div class="panel-body">
					<!-- The file upload form used as target for the file upload widget  -->
					<form id="filedropzone" action='<spring:url value="/upload.html"/>' method="POST" enctype="multipart/form-data" class="dropzone">
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
              	            formData.append("street_number", $("#street_number").val());
              	          	formData.append("street_name", $("#street_name").val());
              	          	formData.append("city", $("#city").val());
              	          	formData.append("province", $("#province").val());
              	          	formData.append("postal_code", $("#postal_code").val());
              	          	formData.append("country", $("#country").val());
              	          	formData.append("lat", $("#lat").val());
              	          	formData.append("lng", $("#lng").val());
              	          	
              	          	formData.append("property_name", $("#property_name").val());
              	          	formData.append("property_price", $("#property_price").val());
              	          	formData.append("property_description", $("#property_description").val());
              	          	formData.append("plot_size", $('#plot_size').val());
              	          	formData.append("building_size", $('#building_size').val());
              	          	formData.append("building_date", $('#building_date').val());
              	          	
              	          	

              	        });
              			
            			//now we will submit the form when the button is clicked
            			$("#sbmtbtn").on('click',function(e) {
               				e.preventDefault();
               			 	e.stopPropagation();
               			 	
               				if (fileDropzone.getQueuedFiles().length > 0) {                        
               					fileDropzone.processQueue();  
               				} else {
               					//submit values without images
               					
               				   $.post("uploadME.html", {street_number: $("#street_number").val()} );
               					//fileDropzone.uploadFiles([]);
               					
               				}
               				
               				 // this will submit your form to the specified action path
              				// after this, your whole form will get submitted with all the inputs + your files and the php code will remain as usual 
        					//REMEMBER you DON'T have to call ajax or anything by yourself, dropzone will take care of that
            			});

          			} // init end

        		};

        			</script>
				

				</div> <!--end of panel body  -->
			</div> <!-- end of panel  -->
		</div>  <!-- end of col-10  -->
	</div> <!-- end of row -->

	<input type="button" id="sbmtbtn" value="submit"/>
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
	});
</script>
