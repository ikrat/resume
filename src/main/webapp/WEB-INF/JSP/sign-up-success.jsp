<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up-success" align="left">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-thumbs-o-up"></i> Регистрация успешна</h3>
		</div>
		<div class="panel-body">
			После завершения регистрации Ваш профиль будет доступен по ссылке:<a href="/leonard-hofstadter">http://localhost:8080/leonard-hofstadter</a><br>
			Ваш UID:<b>leonard-hofstadter</b>. Используйте данный UID, чтобы войти в Ваш личный кабинет.
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="/sign-up-main" class="btn btn-primary">Завершить регистрацию</a>
			</div>
		</div>
		<br>
	</div>
</div>