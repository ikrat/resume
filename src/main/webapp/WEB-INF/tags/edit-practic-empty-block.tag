<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>


<div id="ui-item-0" class="row ui-item skill-item">
	<div class="panel panel-primary">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-0').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[0].id" value="${course.id }" />
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<br>
				<b>*Position:</b>
				<textarea name="items[0].position" class="form-control" style="resize: none;" required="required">${practic.position }</textarea>
			<div class="col-xs-5 col-sm-4 col-md-6">
				<form:errors path="items[0].position" cssClass="alert alert-danger" element="div" />
			</div>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Company or organization:</b><br>
				<textarea name="items[0].company" class="form-control" style="resize: none;" required="required">${practic.company }</textarea>
			<div class="col-xs-5 col-sm-4 col-md-6">
				<form:errors path="items[0].company" cssClass="alert alert-danger" element="div" />
			</div>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Begin date:</b>
				<br>
				<input name="items[0].beginDate" class="datepicker-here form-control"  value="${practic.beginDate }" required="required"/>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>*Finish date:</b>
				<br>
				<input name="items[0].finishDate" class="datepicker-here form-control"  value="${practic.finishDate }" required="required"/>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-12 form-group">
				<b>*Responsibilities / Achievements</b><br>
				<textarea name="items[0].responsibilities" class="form-control-summary" required="required" rows="2">${practic.responsibilities }</textarea>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<form:errors path="items[0].responsibilities" cssClass="alert alert-danger" element="div" />
			</div>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Link to the demo:</b>
				<br>
				<textarea name="items[0].demo" class="form-control" style="resize: none;">${practic.demo }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Source:</b>
				<br>
				<textarea name="items[0].src" class="form-control" style="resize: none;">${practic.src }</textarea>
			</div>
		</div>
	</div>
</div>