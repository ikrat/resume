<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/my-profile">My Resume</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<sec:authorize access="!hasAuthority('USER')">
				<div class="navbar-form navbar-right">
					<a href="/sign-in" id="nb" class="btn btn-primary pull-right">Sign in </a> 
					<a href="/sign-up" class="btn btn-primary pull-right"> Sign up</a>
				</div>
			</sec:authorize>
			<sec:authorize access="hasAuthority('USER')">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				<sec:authentication property="principal.fullName"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/my-profile"><i class="fa fa-eye" aria-hidden="true"></i> My profile</a></li>
						<li><a href="/edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit profile</a></li>
						<li><a href="/edit/password"><i class="fa fa-lock" aria-hidden="true"></i> Password</a></li>
						<li><a href="/remove"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a></li>
						<li role="separator" class="divider"></li>
						<li>
							<form:form action="/sign-out" method="post" id="signoutForm">
								<a href="#" class="dropdown-menu-aitem" onclick="document.getElementById('signoutForm').submit()"> 
									<i class="fa fa-sign-out" aria-hidden="true"></i> Exit
								</a>
							</form:form>
						</li>
					</ul>
				</li>
			</ul>
			</sec:authorize>
			<div class="hidden-lg hidden-md hidden-sm">
				<br>
			</div>
			<div class="navbar-form navbar-right">
				<form:form action="/search" method="post" commandName="query">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="submit" class="btn btn-primary">Search</button>
				</form:form>
			</div>
		</div>
	</div>
</nav>