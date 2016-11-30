<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="certificate" required="false" type="net.study.resume.entity.Certificate"%>


<div id="ui-item-${index }" class="row ui-item skill-item">
	<div class="panel panel-primary certificates">
		<div class="panel-body">
			<c:forEach items="${certificateCategories }" var="certificate">
				<a data-title="Certificate" href="${certificate.largeUrl }" class="thumbnail certificate-link"> <img alt="Certificate"
					src="${certificate.smallUrl }" class="img-responsive"> <span>${certificate.name }</span>
				</a>
			</c:forEach>
		</div>
	</div>

	<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
		<span aria-hidden="true">&times;</span>
	</button>
</div>