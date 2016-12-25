<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<h3 class="panel-title">Восстановление доступа</h3>
		</div>
		<div class="panel-body">
			<form:form action="/login" method="post" commandName="loginForm">
				<div class="container-fluid">
					<h5>
						<b>Введите Ваш UID или Email или Phone:</b>
					</h5>
					<input name="loginForm.login" class="form-control" id="inputFirstName" value="${loginForm.login }" placeholder="UID or Email or Phone" />
				</div>
				<br>
				<div class="row">
					<div class="col-md-5">
						<input type="submit" class="btn btn-primary" value="Восстановить">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>