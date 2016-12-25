<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-briefcase" aria-hidden="true"> </i> Practic Experience <a class="edit-block" href="/edit/practic"> <i
				class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.practics.size() == 0 }">
				<strong>No any data.</strong>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.practics }" var="practic">
					<ul class="timeline">
						<li>
							<div class="timeline-badge danger">
								<i class="fa fa-briefcase"></i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4 class="timeline-title">${practic.position } at ${practic.company }</h4>
									<p>
										<small class="dates"> <i class="fa fa-calendar">${practic.beginDate }</i> <c:if test="${practic.finishDate != null }">- ${practic.finishDate }</c:if>
											<c:if test="${practic.finishDate == null}">
												<strong class="label label-danger">Not finish yet</strong>
											</c:if>

										</small>
									</p>
								</div>
								<div class="timeline-body">
									<p>
										<strong>Responsibilities included:</strong>${practic.responsibilities }
									</p>
									<c:if test="${practic.demo != null }">
										<p>
											<strong>Demo: </strong><a href="${practic.demo }">${practic.demo }</a>
										</p>
									</c:if>
									<c:if test="${practic.src != null }">
										<p>
											<strong>Source code: </strong><a href="${practic.src }">${practic.src }</a>
										</p>
									</c:if>
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
