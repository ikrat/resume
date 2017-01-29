<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Skills"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Technical skills in the frameworks and technologies.</h4>
		<h5 class="data-body" align="center">(Ordered by category)</h5>
		<hr>
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-xs-5 col-sm-4 col-md-2 text-center"><strong>Category</strong></div>
			<div class="col-xs-7 col-sm-8 col-md-10 text-center"><strong>*Framework and technology</strong></div>
		</div>
		<form:form action="/edit/skills" method="post" commandName="skillForm">
			<div id="ui-block-container">
				<c:forEach var="skill" items="${skillForm.items }" varStatus="status">
					<resume:edit-skill-block index="${status.index}" skill="${skill }" />
				</c:forEach>
				<c:if test="${skillForm.items[0].category == null }">
					<resume:edit-skills-empty-block />
				</c:if>
			</div>
			<div id="addSkill"></div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:void(0);">+ Add skill</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/practic" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>