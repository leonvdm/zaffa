<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>
<style>


.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>

<script>
$( document ).ready(function() {
	$('#loginModal').modal('show');
});
</script>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Please sign in</h4>
			</div>
			<!-- Body -->
			<div class="modal-body">
			<c:if test="${not empty param.error}">
    			<div class="alert alert-danger" role="alert">
        			Invalid username and password combination
    			</div>
			</c:if>
				
				<form class="form-signin" role="form" action="/j_spring_security_check" method="POST">
					
					<div class="form-group">
						<input type="text" name="j_username" class="form-control" placeholder="User Name" required autofocus>
					</div> 
					<div class="form-group">
						<input type="password" name="j_password" class="form-control" placeholder="Password" required>
					</div>
					<input type="submit" value="Sign in" class="btn btn-lg btn-primary"/>
				</form>
			</div>
		</div>
	</div>
</div>