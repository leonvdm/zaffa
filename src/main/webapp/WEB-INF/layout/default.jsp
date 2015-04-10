<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- <link href="<spring:url value="/resources/css/bootstrap.css" />" rel="stylesheet"> --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link href="<spring:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<spring:url value="/resources/css/dropzone.css" />" rel="stylesheet">


<title><tiles:getAsString name="title"></tiles:getAsString></title>

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<script src="<spring:url value="/resources/js/formmapper.js" />"></script>
	<script src="<spring:url value="/resources/js/dropzone.js" />"></script>

	<!-- Menu Page -->
	<tiles:insertAttribute name="menu" />

	<!-- Body Page -->
	<tiles:insertAttribute name="body" />

	<!-- Footer Page -->
	<tiles:insertAttribute name="footer" />

</body>
</html>