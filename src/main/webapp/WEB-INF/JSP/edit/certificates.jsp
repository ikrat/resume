<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="panel panel-default">
	<div class="panel-body">
		<h4 class="data-header" align="center">Сертификаты</h4>
		<hr />
		<form:form action="/edit/certificates" method="post" commandName="certificateForm">
			<div id="ui-block-container">
				<c:forEach var="certificate" items="${certificateForm.certificates }" varStatus="status">
					<resume:edit-certificate-block index="${status.index }" />
				</c:forEach>
				<div class="row" align="center">
					<div class="col-xs-12">
						<a href="javascript:void(0);">+ Добавить сертификат</a>
					</div>
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