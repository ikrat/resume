<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Certificates"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Certificates:</h4>
		<hr />
		<form:form action="/edit/certificates" method="post" commandName="certificateForm">
			<div id="ui-block-container">
				<c:forEach var="certificate" items="${certificateForm.items }" varStatus="status">
					<resume:edit-certificate-block index="${status.index }" certificate="${certificate }"/>
				</c:forEach>
				<div class="row" align="center">
					<div class="col-xs-12">
						<a class="btn btn-primary" data-target="#myModal" data-toggle="modal"> + Add certificate</a>
					</div>
				</div>
			</div>

			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/courses" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>

<resume:modal-loader />