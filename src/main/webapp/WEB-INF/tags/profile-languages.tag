<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-language" aria-hidden="true"></i> Foreign languages 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/languages"> <i class="fa fa-pencil-square-o"></i>Edit </a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.languages.isEmpty() || profile.languages == null}">
				<div align="center">
					<h6>
						<b>Information about the foreign languages are not filled.</b>
					</h6>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.languages }" var="language">
					<strong>${language.name }:</strong> ${language.level.getPageValue() } (<em>${language.type.getPageValue() }</em>)<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
