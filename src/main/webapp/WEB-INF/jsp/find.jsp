<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>


<script>
$( document ).ready(function() {
	$('#findModal').modal('show');
});
</script>

<div class="modal fade" id="findModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Find a property</h4>
			</div>
			<!-- Body -->
			<div class="modal-body">
				<form:form commandName="user" class="form-horizontal">


				<div class="form-group">
					<div class="col-sm-2">
						<input type="submit" value="Save" class="btn btn-lg btn-primary"/>
					</div>
				</div>
			</form:form>

			</div>
		</div>
	</div>
</div>