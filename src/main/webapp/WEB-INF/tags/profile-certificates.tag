<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary certificates">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-certificate"></i> Certificates 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/certificates"> <i class="fa fa-pencil-square-o"></i>Edit </a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.certificates.size() == 0 }">
				<div align="center">
					<strong>No certificates were not uploaded.</strong>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${profile.certificates }" var="certificate">
					<a data-title="Certificate" href="${certificate.largeUrl }" class="thumbnail certificate-link"> <img alt="Certificate"
						src="${certificate.smallUrl }" class="img-responsive"> <span>${certificate.name }</span>
					</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>