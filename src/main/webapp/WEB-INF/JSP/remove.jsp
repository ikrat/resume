<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<i class="fa fa-exclamation-circle" aria-hidden="true"></i> Remove profile
		</div>
		<div class="panel-body">
			<form:form action="/remove" method="post">
				<div class="container-fluid">Deleting your account <strong> !can not be undone!</strong> Please confirm deletion <b>${profile.uid }</b>:</div>
				<hr/>
				<div class="container-fluid" align="center">
					<input type="submit" class="btn btn-danger" value="Delete profile">
				</div>
			</form:form>
		</div>
	</div>
</div>