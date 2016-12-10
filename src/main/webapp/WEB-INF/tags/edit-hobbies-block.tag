<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="hobby" required="false" type="net.study.resume.entity.Hobby"%>

<div id="ui-item-${index }" class="row ui-item skill-item">
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[${index }].name" value="${hobby.name }" /> 
		<select name="items[${index }].name" class="form-control">
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
</div>