<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Info"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">About myself</h4>
		<h5 class="data-body" align="center">
			<b>A few words about myself, who will present to you an advantage over other candidates</b>
		</h5>
		<hr />
		<form:form action="/edit/info?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="profileForm">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<textarea name="profile.info" class="form-control-summary pull-right" style="resize: none;">${profileForm.profile.info }</textarea>
					</div>

				</div>
			</div>
			<br>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<blockquote>Specify the additional information that is really important to the employer. For example:<br>
							The presence of an open visa to a foreign country, marital status, if married and have children, a real experience 
							in the activities, which may be your subject area in the development of software, perhaps the experience of research 
							work at the Research Institute, etc.<br>
							NOT to specify your personal qualities, almost all of the candidates responsible, communicative and decent.
						</blockquote>
					</div>

				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/my-profile" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>