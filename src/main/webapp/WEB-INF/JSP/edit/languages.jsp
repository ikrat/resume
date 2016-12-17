<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-navbar />
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header">Languages</h4>
		<hr />
		
		<form:form action="/edit/languages" method="post" commandName="languagesForm">
			<div id="ui-block-container">
				<c:forEach var="language" items="${languagesForm.items }" varStatus="status">
					<resume:edit-languages-block index="${status.index }" language="${language }"/>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:void(0);">+ Добавить язык</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Сохранить">
				</div>
			</div>
		</form:form>
	</div>
</div>