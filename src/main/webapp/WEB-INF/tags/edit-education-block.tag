<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="education" required="false" type="net.study.resume.entity.Education"%>


<div id="ui-item-${index }" class="row ui-item education-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${education.id }" />
			<c:forEach var="education" items="${educationCategories }">
				<div class="col-xs-4 col-sm-8 col-md-12">
					<p><b>Развернутая специализация</b></p>
					<input type="text" class="form-control" placeholder="${education.summary }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<p>Год поступления</p>
					<input type="text" class="form-control" placeholder="${education.beginYear }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<p>Год окончания</p>
					<input type="text" class="form-control" placeholder="${education.finishYear }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<p><b>Университет</b></p>
					<input type="text" class="form-control" placeholder="${education.university }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<p><b>Факультет<b></b></p>
					<input type="text" class="form-control" placeholder="${education.faculty }">
				</div>
			</c:forEach>
		</div>
	</div>
</div>