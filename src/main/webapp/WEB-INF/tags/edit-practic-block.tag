<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="practic" required="false" type="net.study.resume.entity.Practic"%>


<div id="ui-item-${index }" class="row ui-item course-item" id="myPractic">
	<div class="panel panel-primary">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${practic.id }" />
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<br>
				<b>*Position:</b>
				<textarea name="items[${index }].position" class="form-control" style="resize: none;" required="required">${practic.position }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Company or organization:</b><br>
				<textarea name="items[${index }].company" class="form-control" style="resize: none;" required="required">${practic.company }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Begin date:</b>
				<br>
				<input name="items[${index }].beginDate" class="datepicker-here form-control"  value="${practic.beginDate }" required="required"/>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Finish date:</b>
				<br>
				<input name="items[${index }].finishDate" class="datepicker-here form-control"  value="${practic.finishDate }" required="required"/>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-12 form-group">
				<b>*Responsibilities / Achievements</b><br>
				<textarea name="items[${index }].responsibilities" class="form-control-summary pull-right" required="required" rows="2">${practic.responsibilities }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Link to the demo:</b>
				<br>
				<textarea name="items[${index }].demo" class="form-control" style="resize: none;">${practic.demo }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Source:</b>
				<br>
				<textarea name="items[${index }].src" class="form-control" style="resize: none;">${practic.src }</textarea>
			</div>
		</div>
	</div>
</div>