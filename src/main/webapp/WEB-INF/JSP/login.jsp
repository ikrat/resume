<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<h3 class="panel-title">Вход в ваш личный кабинет</h3>
		</div>

		<div class="panel-body">
			<form:form action="/login" method="post" commandName="loginForm">
				<div class="container-fluid">Вы можете использовать Ваши UID или Email или Phone в качестве логина.</div>
				<div class="container-fluid">
					<h5>
						<b>Логин:</b>
					</h5>
					<input name="loginForm.login" class="form-control" id="inputFirstName" value="${loginForm.login }" placeholder="UID or Email or Phone" />
				</div>
				<br>
				<div class="container-fluid">
					<h5>
						<b>Пароль:</b>
					</h5>
					<input name="loginForm.password" class="form-control" id="inputPassword" value="${loginForm.password }" />
				</div>
				<div class="container-fluid checkbox">
					<label> <input type="checkbox"><b>Запомнить меня</b></label>
				</div>
				<br>
				<hr />
				<div class="row">
					<div class="col-md-5">
						<input type="submit" class="btn btn-success" value="Войти">
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<button class="btn btn-primary">Sign up with Facebook</button>
					</div>
				</div>
				<hr />
				<br>
				<div class="container-fluid" align="center">
					<a href="#">Восстановить доступ</a>
				</div>
			</form:form>
		</div>
	</div>
</div>