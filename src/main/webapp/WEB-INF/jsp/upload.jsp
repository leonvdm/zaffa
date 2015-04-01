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
      	<div class="row">
			<div class="col-md-2">
      		
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
	
			</div> <!--  end of col -->
			<div class="col-md-8">
				<h3>Upload Property fotos</h3>
	    		<br>
    			<!-- The file upload form used as target for the file upload widget -->
    			<form id="fileupload" action='<spring:url value="/upload"/>' method="POST" enctype="multipart/form-data">
        			<!-- Redirect browsers with JavaScript disabled to the origin page -->
        			<noscript><input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/"></noscript>
        			<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        			<div class="row fileupload-buttonbar">
            			<div class="col-lg-7">
                			<!-- The fileinput-button span is used to style the file input field as button -->
                			<span class="btn btn-success fileinput-button">
                    			<i class="glyphicon glyphicon-plus"></i>
                    			<span>Add files...</span>
                    			<input type="file" name="files[]" multiple>
                			</span>
                			<button type="submit" class="btn btn-primary start">
                    			<i class="glyphicon glyphicon-upload"></i>
                    			<span>Start upload</span>
                			</button>
                			<button type="reset" class="btn btn-warning cancel">
                    			<i class="glyphicon glyphicon-ban-circle"></i>
                    			<span>Cancel upload</span>
                			</button>
                			<button type="button" class="btn btn-danger delete">
                    			<i class="glyphicon glyphicon-trash"></i>
                    			<span>Delete</span>
                			</button>
                			<input type="checkbox" class="toggle">
                				<!-- The global file processing state -->
                				<span class="fileupload-process"></span>
            			</div> <!-- end of column -->
            			<!-- The global progress state -->
            			<div class="col-lg-5 fileupload-progress fade">
                			<!-- The global progress bar -->
                			<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    			<div class="progress-bar progress-bar-success" style="width:0%;"></div>
                			</div>
                			<!-- The extended global progress state -->
                			<div class="progress-extended">&nbsp;</div>
                		</div> <!-- end of column -->
            		</div> <!-- end of button bar -->
        	
       				<!-- The table listing the files available for upload/download -->
        			<table role="presentation" class="table table-striped">
        				<tbody class="files"></tbody>
        			</table>
        		</form>
        	
		    	<br>
    			<div class="panel panel-default">
        			<div class="panel-heading">
            			<h3 class="panel-title">Upload Notes</h3>
        			</div>
        				
        			<div class="panel-body">
            			<ul>
                			<li>The maximum file size for uploads is <strong>5 MB</strong></li>
                			<li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed</li>
            			</ul>
        			</div>
        		</div> <!-- end of panel -->
		
				<!-- The blueimp Gallery widget -->
				<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    				<div class="slides"></div>
    					<h3 class="title"></h3>
    					<a class="prev">‹</a>
    					<a class="next">›</a>
    					<a class="close">×</a>
    					<a class="play-pause"></a>
    					<ol class="indicator"></ol>
					</div><!-- end of slides -->
				</div> <!-- end of gallery -->
			</div><!--  end of col-8 -->
		</div> <!-- end of row -->
				
			
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
    
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
