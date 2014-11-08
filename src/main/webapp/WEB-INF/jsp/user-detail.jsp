<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<h1>${user.name }</h1>

<br />
<br />

<script type="text/javascript">
$(document).ready(function() {
	$('.nav-tabs a:first').tab('show'); //select first tab
	$(".triggerRemove").click(function(e) {
		e.preventDefault();
		$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
		$("#modalRemove").modal();
		
	});
});
</script>



<!-- Nav tabs -->
<ul class="nav nav-tabs">
	<c:forEach items="${user.properties}" var="property">
		<li><a href="#property_${property.id}" data-toggle="tab">${property.name}</a></li>
	</c:forEach>
</ul>

<!-- Tab panes -->
<div class="tab-content">
	<c:forEach items="${user.properties}" var="property">
		<div class="tab-pane" id="property_${property.id}">
			<h1>${property.name}</h1>
			
			<p>
			
			<a href="<spring:url value="/property/remove/${property.id}.html" />" class="btn btn-danger triggerRemove">remove property</a>
			
			${property.type}

			<table class="table table-bordered table-hover table-striped">
				<thead>
					<tr>
						<th>Description</th>
						<th>Upload Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${property.photos}" var="photo">
						<tr>
							<td>${photo.description}</td>
							<td>${photo.uploadDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:forEach>

</div>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove property</h4>
      </div>
      <div class="modal-body">
        Really remove?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
       </div>
    </div>
  </div>
</div>