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
	<link href="<spring:url value="/resources/css/custom.css" />" rel="stylesheet">
	
	<link href="<spring:url value="/resources/css/Layout.css" />" rel="stylesheet">
	
	<!--  javascript -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<%-- <link href="<spring:url value="/resources/js/modernizr-latest.js" />" rel="stylesheet"> --%>
	
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
	
	<div class="container">
		<div id="leon"> 
			<div class="form-group">
				<div class="col-sm-10">
					<div id="searchDiv">
						<input id="pac-input" type="text" size="40"  placeholder="Search for Places"></input>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="map_canvas"></div>
	<div class="container">
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
</body>



</html>