<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-navbar />
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Некоторые работодатели уделяют внимание на хобби кандидата</h4>
		<hr />
		
		<form:form action="/edit/hobby" method="post" commandName="hobbiesForm">
			<div id="ui-block-container">
				<c:forEach var="hobby" items="${hobbiesForm.items }" varStatus="status">
					<resume:edit-hobbies-block index="${status.index }" hobby="${hobby }"/>
				</c:forEach>
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