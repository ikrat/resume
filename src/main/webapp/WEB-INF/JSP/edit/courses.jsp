<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Courses" />
<div class="panel panel-primary">
	<div class="panel-body">
		<div class="col-md-12">
			<h4 class="data-header" align="center">Training courses</h4>
			<h5 class="data-body" align="center">(Ordered descending)</h5>
			<hr />
			<form:form action="/edit/courses?${_csrf.parameterName}=${_csrf.token}" method="post" commandName="courseForm">
				<div id="ui-block-container">
					<c:forEach var="course" items="${courseForm.items }" varStatus="status">
						<resume:edit-course-block index="${status.index }" course="${course }" />
					</c:forEach>
					<c:if test="${courseForm.items[0].name == null}">
						<resume:edit-course-empty-block />
					</c:if>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<a href="javascript:void(0);">+ Add course</a>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-xs-12 text-center">
						<input type="submit" class="btn btn-primary" value="Save">
						<a href="/edit/education" class="btn btn-primary">Skip</a>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>