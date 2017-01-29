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
			<form:form action="/edit/password" method="post" commandName="changePasswordForm">
				<div class="container-fluid">Input your new password and confirm him.</div>
				<div class="container-fluid">
					<h5>
						<b>New password:</b>
					</h5>
					<input name="newPassword" class="form-control" id="inputNewPassword" value="${changePasswordForm.newPassword }" />
				</div>
				<div class="container-fluid">
					<form:errors path="newPassword" cssClass="alert alert-danger" element="div" />
				</div>
				<div class="container-fluid">
					<h5>
						<b>Confirm password:</b>
					</h5>
					<input name="confirmNewPassword" class="form-control" id="confirmNewPassword" value="${changePasswordForm.confirmNewPassword }" />
				</div>
				<div class="container-fluid">
					<form:errors path="confirmNewPassword" cssClass="alert alert-danger" role="alert" element="div" />
					<form:errors path="" cssClass="alert alert-danger" element="div" />
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
						<input type="submit" class="btn btn-primary" value="Update password">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<resume:password-message message="${message}" />