<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="course" required="false" type="net.study.resume.entity.Course"%>


<div id="ui-item-${index }" class="row ui-item course-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${course.id }" />
			<c:forEach var="course" items="${courseCategories }">
				<div class="col-xs-4 col-sm-4 col-md-4">
					<p>Название курсов*</p>
					<input type="text" class="form-control" placeholder="${course.name }">
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4">
					<p>Название школы/площадки*</p>
					<input type="text" class="form-control" placeholder="Name of school">
				</div>

				<div class="col-xs-2 col-sm-2 col-md-2">
					<p>Дата окончания</p>
					<input type="text" class="form-control" placeholder="Ends date">
				</div>
			</c:forEach>
		</div>
	</div>
</div>