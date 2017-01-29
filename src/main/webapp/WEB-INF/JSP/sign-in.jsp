<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<i class="fa fa-sign-in"></i> Log in to your personal account
		</div>
		<div class="panel-body">
			<form action="/sign-in-handler" method="post">
				<c:if test="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION != null}">
					<div class="alert alert-danger" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
					</div>
				</c:if>
				<div class="help-block">You can use your UID or Email or Phone as the login</div>
				<div class="form-group">
					<label for="uid">Login</label> <input id="uid" name="uid" class="form-control" placeholder="UID или Email или Phone" required autofocus>
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input id="password" type="password" name="password" class="form-control" placeholder="Password" required>
				</div>
				<div class="form-group">
					<label><input type="checkbox" name="remember-me" value="true"> Remember me</label>
				</div>
				<div class="form-group">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="submit" class="btn btn-primary pull-left">Sign in</button>
					<a href="/restore" class="pull-right">Restore access</a>
				</div>
			</form>
		</div>
	</div>
</div>