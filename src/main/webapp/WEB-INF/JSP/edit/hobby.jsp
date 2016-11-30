<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<div class="panel panel-default">
	<div class="panel-body">
		<h4 class="data-header">Некоторые работодатели уделяют внимание на хобби кандидата</h4>
		<hr />
		
		<form:form action="/edit/hobby" method="post" commandName="hobbiesForm">
			<div id="ui-block-container">
				<c:forEach var="hobby" items="${hobbiesForm.items }" varStatus="status">
					<resume:edit-hobbies-block index="${status.index }" hobby="${hobby }"/>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:void(0);">+ Добавить навык</a>
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