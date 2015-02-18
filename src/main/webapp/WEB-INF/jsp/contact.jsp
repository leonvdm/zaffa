<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>




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

<style>
.table {
	margin-top: 10px;
}
</style>



WE ARE SO AWESOME PAGE