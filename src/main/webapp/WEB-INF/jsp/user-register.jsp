<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>


<script>
$( document ).ready(function() {
	$('#registerModal').modal('show');
});
</script>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Welcome to Zaffa</h4>
			</div>
			<!-- Body -->
			<div class="modal-body">
				<form:form commandName="user" class="form-horizontal registrationForm form-register">

				<c:if test="${param.success eq true}">
					<div class="alert alert-success">Registration successful!</div>
				</c:if>
				<div class="form-group">
					<div class="col-sm-10">
						<form:input path="firstName" class="form-control"  placeholder="First Name"/>
						<form:errors path="firstName"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<form:input path="lastName" class="form-control" placeholder="Last Name"/>
						<form:errors path="lastName"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<form:input path="userName" class="form-control" placeholder="Username"/>
						<form:errors path="userName"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<form:input path="contactNumber" class="form-control" placeholder="Contact Number"/>
						<form:errors path="contactNumber"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<form:input path="email" class="form-control" placeholder="Email"/>
						<form:errors path="email"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<form:password path="password" class="form-control" placeholder="Password"/>
						<form:errors path="password"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<input type="password" name="password_again" id="password_again" class="form-control" placeholder="Confirm Password"/>
					</div>
				</div>
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

<script type="text/javascript">
$(document).ready(function() {
	
	$(".registrationForm").validate(
		{
			rules: {
				userName: {
					required: true,
					minlength: 3,
					remote: {
						url: "<spring:url value='/register/available.html' />", 
						type: "get", 
						data: {
							username: function() {
								return $("#userName").val();
							}
						}
					}
				},
				firstName: {
					required: true,
					minlength: 3
				},
				lastName: {
					required: true,
					minlength: 3,
				},
				contactNumber: {
					required: true,
					minlength: 9,
				},
				email: {
					required: true,
					email: true
				},
				password: {
					required: true,
					minlength: 5
				},
				password_again: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				}
			},
			highlight: function(element) {
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
			},
			messages: {
				userName: {
					remote: "Username already exist!"
				}
			}
		});
});
</script>