<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-bullseye"></i> Objective 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit"> <i class="fa fa-pencil-square-o"></i>Edit </a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.objective == null || profile.objective.isEmpty() }">
				<strong>Information about the preferred profession are not filled.</strong><br>
			</c:when>
			<c:otherwise>
				<h4>${profile.objective }</h4>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${profile.summary.isEmpty() || profile.summary == null}">
				<strong>Summary of Qualifications: </strong> Information about the qualification are not filled.
			</c:when>
			<c:otherwise>
				<p><strong>Summary of Qualifications: </strong> <br> ${profile.summary }</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>