<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Languages"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Foreign languages</h4>
		<hr />
		<form:form action="/edit/languages?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="languagesForm">
			<div id="ui-block-container">
				<c:forEach var="language" items="${languagesForm.items }" varStatus="status">
					<resume:edit-languages-block index="${status.index }" language="${language }"/>
				</c:forEach>
				<c:if test="${languagesForm.items[0].name == null }">
					<resume:edit-languages-empty-block />
				</c:if>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:void(0);">+ Add language</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/hobby" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>