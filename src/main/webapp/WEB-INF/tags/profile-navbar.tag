<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/${uid }">My Resume</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

			<div class="navbar-form navbar-right">
				<a href="/sign-in" id="nb" class="btn btn-primary pull-right">Войти</a> <a href="/sign-up" class="btn btn-primary pull-right">Зарегистрироваться</a>
			</div>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${profile.fullName }${profileForm.profile.fullName }<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/${profile.uid}${profileForm.profile.uid}"><i class="fa fa-eye" aria-hidden="true"></i> My profile</a></li>
						<li><a href="/edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit profile</a></li>
						<li><a href="/edit/password"><i class="fa fa-lock" aria-hidden="true"></i> Password</a></li>
						<li><a href="/remove"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/sign-out"><i class="fa fa-sign-out" aria-hidden="true"></i> Exit</a></li>
					</ul></li>
			</ul>

			<div class="hidden-lg hidden-md hidden-sm">
				<br>
			</div>
			<div class="navbar-form navbar-right">
				<form:form action="/search" method="post" commandName="query">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-primary">Поиск</button>
				</form:form>
			</div>
		</div>
	</div>
</nav>