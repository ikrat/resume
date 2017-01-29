<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-graduation-cap"></i> Education 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/education"> <i class="fa fa-pencil-square-o"></i>Edit </a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.educations.isEmpty() || profile.educations == null}">
				<div align="center">
					<strong>Information about education are not filled.</strong>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.educations }" var="education">
					<ul class="timeline">
						<li>
							<div class="timeline-badge warning">
								<i class="fa fa-graduation-cap"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">${education.summary }</h4>
									<p>
										<small class="dates"><i class="fa fa-calendar"></i> ${education.beginYear }</small>
										<c:choose>
											<c:when test="${education.finishYear == null }">
												<small> - </small>
												<small class="label label-danger">Not finish yet</small>
											</c:when>
											<c:otherwise>
												<small class="dates"> - ${education.finishYear } </small>
											</c:otherwise>
										</c:choose>
									</p>
									<div class="timeline-body">
										<p>${education.faculty },${education.university }</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>