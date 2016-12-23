<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-language" aria-hidden="true"></i> Foreign languages <a class="edit-block" href="/edit/languages"> <i
				class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.languages.size() == 0 }">
				<strong>No any data.</strong>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.languages }" var="language">
					<strong>${language.name }:</strong> ${language.level } (<em>${language.type }</em>)<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
