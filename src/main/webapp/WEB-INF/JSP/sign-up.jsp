<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<h3 class="panel-title">Укажите Ваши персональные данные</h3>
		</div>

		<div class="panel-body">
			<form:form action="/sign-up" method="post" commandName="signUpForm">
				<div class="container-fluid">Имейте ввиду, что введенные Вами имя и фамилия не смогут быть изменены
				в будущем! Поэтому предоставляйте реальные имя и фамилию!</div><br>
				<div class="container-fluid">
					<h5><b>Имя:</b></h5>
					<input name="firstName" class="form-control" id="inputFirstName" value="${signUpForm.firstName }" placeholder="Example:Ihor"/>
				</div>
				<br>
				<div class="container-fluid">
					<h5><b>Фамилия:</b></h5>
					<input name="lastName" class="form-control" id="inputLastName" value="${signUpForm.lastName }" placeholder="Example:Krat"/>
				</div>
				<br>
				<div class="container-fluid">
					<h5><b>Новый пароль:</b></h5>
					<input name="password" class="form-control" id="inputPassword" value="${signUpForm.password }"/>
				</div>
				<div class="container-fluid">
					<h5><b>Подтверждение пароля:</b></h5>
					<input name="confirmPassword" class="form-control" id="confirmPassword" value="${signUpForm.confirmPassword }"/>
				</div>
				<br>
				<div class="row">
					<div class="col-md-5">
						<input type="submit" class="btn btn-success" value="Зарегистрироваться">
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<button class="btn btn-primary">Sign up with Facebook</button>
					</div>
				</div>
		</form:form>
		</div>
	</div>
</div>