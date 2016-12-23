<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-bullseye"></i> Objective <a class="edit-block" href="/edit"> <i class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>

	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.objective == null }">
				<strong>Profession:</strong> I don't know who I want to be =(<br>
			</c:when>
			<c:otherwise>
					<h4>${profile.objective }</h4>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${profile.summary == null }">
				<strong>Summary of Qualifications: </strong> No any data.
				</c:when>
			<c:otherwise>
				<p>
					<strong>Summary of Qualifications: </strong> <br> ${profile.summary }
				</p>
			</c:otherwise>
		</c:choose>
	</div>
</div>