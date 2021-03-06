<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Education"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Education</h4>
		<h5 class="data-body" align="center">(Ordered descending)</h5>
		<hr />
		<form:form action="/edit/education?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="educationForm">
			<div id="ui-block-container">
				<c:forEach var="education" items="${educationForm.items }" varStatus="status">
					<resume:edit-education-block index="${status.index }" education="${education }"/>
				</c:forEach>
				<c:if test="${educationForm.items[0].summary == null }">
					<resume:edit-education-empty-block />
				</c:if>
				<div class="row" align="center">
					<div class="col-xs-12">
						<a href="javascript:void(0);">+ Add institution</a>
					</div>
				</div>
			</div>

			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/languages" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>