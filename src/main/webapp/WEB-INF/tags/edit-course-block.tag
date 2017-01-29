<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="course" required="false" type="net.study.resume.entity.Course"%>



<div id="ui-item-${index }" class="row ui-item skill-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${course.id }" />
			<div class="col-md-4">
				<b>*Course name:</b>
				<textarea name="items[${index }].name" class="form-control" style="resize: none;" required="required">${course.name }</textarea>
			</div>
			<div class="col-md-4">
				<b>*School name:</b>
				<textarea name="items[${index }].school" class="form-control" style="resize: none;" required="required">${course.school }</textarea>
			</div>
			<div class="col-md-3">
				<b>*Finish date:</b>
				<input name="items[${index }].finishDate" class="datepicker-here form-control"  value="${course.finishDate }" required="required"/>
			</div>
		</div>
			
	</div>
</div>