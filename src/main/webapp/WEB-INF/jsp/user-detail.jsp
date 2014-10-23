<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>

<h1>${user.name }</h1>

<c:forEach items="${user.properties}" var="property">
	
	<h1>${property.name}</h1>
	<h1>${property.type}</h1>
	
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

</c:forEach>