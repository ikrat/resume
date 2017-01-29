<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Practics"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Practical experience</h4>
		<h5 class="data-body" align="center">(Ordered descending)</h5>
		<hr />
		<form:form action="/edit/practic" method="post" commandName="practicsForm">
			<div id="ui-block-container">
				<c:forEach var="practic" items="${practicsForm.items }" varStatus="status">
					<resume:edit-practic-block index="${status.index }" practic="${practic }"/> 
				</c:forEach>
				<c:if test="${practicsForm.items[0].position == null}">
					<resume:edit-practic-empty-block />
				</c:if>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a data-target="#myPractic" data-toggle="practic">+ Add</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/certificates" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>