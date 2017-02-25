<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>


<div id="ui-item-0" class="row ui-item course-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[0].id" value="${course.id }" />
			<div class="col-md-4">
				<b>*Course name:</b>
				<textarea name="items[0].name" class="form-control" style="resize: none;" required="required"></textarea>
			</div>
			<div class="col-md-4">
				<b>*School name:</b>
				<textarea name="items[0].school" class="form-control" style="resize: none;" required="required"></textarea>
			</div>
			<div class="col-md-3">
				<b>*Finish date:</b>
				<input name="items[0].finishDate" class="datepicker-here form-control"  value="${course.finishDate }" required="required"/>
			</div>
		</div>
	</div>
</div>