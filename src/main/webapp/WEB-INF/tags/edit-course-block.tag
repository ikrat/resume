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
			<div class="col-xs-5 col-sm-4 col-md-4 form-group">
				<b>Название курса*</b>
				<textarea name="items[${index }].name" class="form-control" style="resize: none;">${course.name }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-4 form-group">
				<b>Название школы/площадки*</b>
				<textarea name="items[${index }].school" class="form-control pull-right" style="resize: none;">${course.school }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-2 form-group" align="center">
				<b>Дата окончания</b>
				<input type='text' class='datepicker-here' value="${course.finishDate }"/>
			</div>
		</div>
			
	</div>
</div>