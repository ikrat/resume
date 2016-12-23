<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="education" required="false" type="net.study.resume.entity.Education"%>


<div id="ui-item-${index }" class="row ui-item skill-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<input type="hidden" name="items[${index }].id" value="${education.id }" />
				<div class="col-xs-4 col-sm-8 col-md-12">
					<p><b>Развернутая специализация</b></p>
					<textarea name="items[${index }].summary" class="form-control-skills" style="resize: none;">${education.summary }</textarea>
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<br>
					<p><b>Год поступления</b></p>
					<input name="items[${index }].beginYear" type="text" class="form-control" placeholder="${education.beginYear }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<br>
					<p><b>Год окончания</b></p>
					<input name="items[${index }].finishYear" type="text" class="form-control" placeholder="${education.finishYear }">
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<br>
					<p><b>Университет</b></p>
					<textarea name="items[${index }].university" class="form-control" style="resize: none;">${education.university }</textarea>
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-6">
					<br>
					<p><b>Факультет</b></p>
					<textarea name="items[${index }].faculty" class="form-control" style="resize: none;">${education.faculty }</textarea>
				</div>
			
		</div>
	</div>
</div>