<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${profile.objective != null || profile.summary != null }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-bullseye"></i> Objective <a class="edit-block" href="/edit/objective"> <i class="fa fa-pencil-square-o"></i>Edit
				</a>
			</h3>
		</div>

		<div class="panel-body">
			<c:if test="${profile.objective != null}">
				<h4>
					<strong>${profile.objective }</strong>
				</h4>
			</c:if>
			<c:if test="${profile.summary != null}">
				<p>
					<strong>Summary of Qualifications: </strong> <br> ${profile.summary }
				</p>
			</c:if>
		</div>
	</div>
</c:if>