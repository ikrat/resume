<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<h3 class="panel-title">Enter your personal information.</h3>
		</div>

		<div class="panel-body">
			<form:form action="/sign-up" method="post" commandName="signUpForm">
				<div class="container-fluid">Keep in mind that the name you entered can not be changed in the future! So enter the real name!</div>
				<hr>
				<div class="container-fluid">
					<h5>
						<b>First name:</b>
					</h5>
					<input name="firstName" class="form-control" id="inputFirstName" value="${signUpForm.firstName }" placeholder="Example:Richard" />
				</div>
				<div class="container-fluid">
					<form:errors path="firstName" cssClass="alert alert-danger" element="div" />
				</div>
				<div class="container-fluid">
					<h5>
						<b>Last name:</b>
					</h5>
					<input name="lastName" class="form-control" id="inputLastName" value="${signUpForm.lastName }" placeholder="Example:Hendricks" />
				</div>
				<div class="container-fluid">
					<form:errors path="lastName" cssClass="alert alert-danger" element="div" />
				</div>
				<div class="container-fluid">
					<h5>
						<b>Password:</b>
					</h5>
					<input name="password" class="form-control" id="inputPassword" value="${signUpForm.password }" />
				</div>
				<div class="container-fluid">
					<form:errors path="password" cssClass="alert alert-danger" element="div" />
				</div>
				<div class="container-fluid">
					<h5>
						<b>Confirm password:</b>
					</h5>
					<input name="confirmPassword" class="form-control" id="confirmPassword" value="${signUpForm.confirmPassword }" />
				</div>
				<div class="container-fluid">
					<form:errors path="confirmPassword" cssClass="alert alert-danger" role="alert" element="div" />
					<form:errors path="" cssClass="alert alert-danger" element="div" />
				</div>
				<br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<hr>
				<div class="row">
					<div class="col-md-6">
						<input type="submit" class="btn btn-success" value="Register your profile">
					</div>

					<div class="col-md-6" align="right">
						<a href="/fbLogin" class="btn btn-primary">Sign up with Facebook</a>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>