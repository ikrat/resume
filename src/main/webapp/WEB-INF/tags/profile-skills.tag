<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-code"></i> Technical Skills 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/skills"><i class="fa fa-pencil-square-o"></i>Edit</a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.skills.isEmpty() || profile.skills == null}">
				<div align="center">
					<strong>Information about the skills are not filled.</strong>
				</div>
			</c:when>
			<c:otherwise>
				<table class="table table-striped table-bordered">
					<tbody>
						<tr>
							<th style="width: 140px;">Category</th>
							<th>Frameworks and technologies</th>
						</tr>
						<c:forEach items="${profile.skills }" var="skill">
							<tr>
								<td>${skill.category }</td>
								<td>${skill.value }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</div>