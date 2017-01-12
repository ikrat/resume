<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-book"></i> Courses <a class="edit-block" href="/edit/courses"> <i class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.courses.size() == 0 }">
				<div align="center">
					<strong>Information about the courses are not filled.</strong>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.courses }" var="course">
					<ul class="timeline">
						<li>
							<div class="timeline-badge warning">
								<i class="fa fa-graduation-cap"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">${course.name } at ${course.school }</h4>
									<p>
										<c:if test="${course.finishDate != null }">
											<i class="fa fa-calendar"><b> Finish Date:</b></i>
											<small class="dates"> ${course.finishDate } </small>
										</c:if>
										<c:if test="${course.finishDate == null }">
											<i class="fa fa-calendar"><b> Finish Date:</b></i>
											<strong class="label label-danger">Not finish yet</strong>
										</c:if>
									</p>
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>