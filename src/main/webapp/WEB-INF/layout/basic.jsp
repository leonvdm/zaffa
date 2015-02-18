<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link href="<spring:url value="/resources/css/Layout.css" />" rel="stylesheet">
	
<%-- <link href="<spring:url value="/resources/js/modernizr-latest.js" />" rel="stylesheet"> --%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><tiles:getAsString name="title"></tiles:getAsString></title>

<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<tilesx:useAttribute name="current" />
</head>

<style>
.table-bordered {
	border: 1px solid #ddd;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
}

table {
	background-color: transparent;
	border-spacing: 0;
	border-collapse: collapse;
	display: table;
	border-collapse: separate;
	border-spacing: 2px;
	border-color: gray;
}

body {
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	font-size: 12px;
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}

</style>

<body>
	<div class="MainWrapper" >
    	<div class="Header" id="zaffaHeader">
        	<a href='<spring:url value="/index.html"/>'>
				<img src="<spring:url value='/resources/images/ToLet-logo.png'/>" class="Logo">
			</a>
				
			<div class="Nav">
			 	<a href='<spring:url value="/find.html"/>' class="HeaderText">Find</a>
			 	<a href='<spring:url value="/upload.html"/>' class="HeaderText">Upload</a>
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
		</div>
	</div>
	
</body>

<div class="container">
	<tiles:insertAttribute name="body" />
	<br> <br>

	<center>
		<tiles:insertAttribute name="footer" />
	</center>

</div>

</html>