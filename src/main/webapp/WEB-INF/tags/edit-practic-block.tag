<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="practic" required="false" type="net.study.resume.entity.Practic"%>


<div id="ui-item-${index }" class="row ui-item course-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${practic.id }" />
			<c:forEach var="practic" items="${practicsCategories }">
				${practic.company }
			</c:forEach>
		</div>
	</div>
</div>