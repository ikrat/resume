<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume"	tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="language" required="false" type="net.study.resume.entity.Language"%>

<div id="ui-item-${index }" class="row ui-item skill-item">
	<div class="col-xs-5 col-sm-4 col-md-2 form-group">
		<input type="hidden" name="items[${index }].id" value="${language.id }" /> 
		
			<c:forEach var="language" items="${languageCategories }">
				${language.name }
			</c:forEach>
			
		
	</div>
	<div class="col-xs-7 col-sm-8 col-md-10 value-container">
		<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
			<span aria-hidden="true">&times;</span>
		</button>
		</div>
</div>