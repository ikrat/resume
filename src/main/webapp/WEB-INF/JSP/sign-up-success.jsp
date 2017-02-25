<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up-success" align="left">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-thumbs-o-up"></i> Sign up success!</h3>
		</div>
		<div class="panel-body">
			After the registration your profile will be available at the following link:<a href="http://localhost:8080/${profile.uid }">http://localhost:8080/${profile.uid }.</a><br>
			Your UID:<b>${profile.uid }</b>. Use the UID, to enter in your personal account.
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="/sign-up-main" class="btn btn-primary">Complete registration</a>
			</div>
		</div>
		<br>
	</div>
</div>