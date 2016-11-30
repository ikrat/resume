<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${profile.educations != null}">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-graduation-cap"></i> Education <a class="edit-block" href="/edit/education"> <i class="fa fa-pencil-square-o"></i>Edit
				</a>
			</h3>
		</div>
		<div class="panel-body">
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
									<c:if test="${education.finishYear != null }">
										<small class="dates"> - ${education.finishYear } </small>
									</c:if>
								</p>
								<div class="timeline-body">
									<p>${education.faculty },${education.university }</p>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
</c:if>