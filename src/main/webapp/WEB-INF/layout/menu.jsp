<%@ include file="../layout/taglib.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>

<div class="zaffaHeader">
<nav id="nav-main" class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
      	<img src="<spring:url value='/resources/images/ToLet-logo.png'/>" class="Logo">
      </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li>
        	<a href='<spring:url value="/home.html"/>'>Home <span class="sr-only">(current)</span></a>
        </li>
        <li>
        	<a href='<spring:url value="/upload.html"/>' class="HeaderText">List your property</a>
        </li>
        <li>
        	<a href='<spring:url value="/contact.html"/>' >Contact</a>
        </li>
        <security:authorize access="! isAuthenticated()">
        	<li>
				<a href='<spring:url value="/login.html"/>' class="HeaderText">Login</a>
			</li>
			<li>
				<a href='<spring:url value="/register.html"/>' class="HeaderText">Register</a>
			</li>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<li>
				<a href='<spring:url value="/account.html"/>' class="HeaderText">My account</a>
			</li>
			<li>
				<a href='<spring:url value="/logout"/>' class="HeaderText">Logout</a>
			</li>
		</security:authorize>
		<security:authorize access="hasRole('ADMIN')">
			<li>
				<a href='<spring:url value="/users.html"/>' class="HeaderText">Users</a>
			</li>
		</security:authorize>
      </ul>
      
    </div>
  </div>
</nav>
</div>