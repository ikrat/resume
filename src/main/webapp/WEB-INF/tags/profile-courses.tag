<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-book"></i> Courses <a class="edit-block" href="#"> <i class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<ul class="timeline">
			<li>
			<c:forEach items="${profile.courses }" var="course">
				<div class="timeline-badge success">
					<i class="fa fa-book"></i>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<h4 class="timeline-title">
							<c:forEach items="${profile.courses }" var="course">
								<option value="${course.name }">${course.name } at ${course.school }</option>
							</c:forEach>
						</h4>
						<p>
							<small class="dates"><i class="fa fa-calendar"></i> <strong> Finish Date:</strong> <strong class="label label-danger">Not
									finished yet</strong> </small>
						</p>
					</div>
				</div>
				</c:forEach>
			</li>
		</ul>
	</div>
</div>