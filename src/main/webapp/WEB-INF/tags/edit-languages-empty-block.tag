<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div id="ui-item-0" class="row ui-item skill-item">
	<div class="panel panel-default">
		<div class="panel-body">
			<button type="button" class="close" onclick="$('#ui-item-0').remove();">
				<span aria-hidden="true">&times;</span>
			</button>
			<br>
			<div class="row">
				<div class="col-lg-3 col-sm-2 ">
					<input type="hidden" name="items[0].id" value="${language.id }" />
					<div class="input-practic">
						<label for="begin-month">*Type:</label> 
						<select class="form-control" name="items[0].type" required="required">
							<option value="ALL">Writing and spoken</option>
							<option ${language.type == 'WRITING' ? ' selected="selected"' : ''} value="WRITING">Writing</option>
							<option ${language.type == 'SPOKEN' ? ' selected="selected"' : ''} value="SPOKEN">Spoken</option>
						</select>
					</div>
				</div>
				<div class="col-lg-3 col-sm-2 ">
					<div class="input-practic">
						<label for="begin-month">*Language:</label> 
						<textarea name="items[0].name" class="form-control" style="resize: none;" required="required">${language.name }</textarea>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="input-practic">
						<label for="begin-month">*Level:</label> <select class="form-control" name="items[0].level" required="required">
							<option ${language.level == 'BEGINNER' ? ' selected="selected"' : ''} value="BEGINNER">Beginner</option>
							<option ${language.level == 'ELEMENTARY' ? ' selected="selected"' : ''} value="ELEMENTARY">Elementary</option>
							<option ${language.level == 'PRE_INTERMEDIATE' ? ' selected="selected"' : ''} value="PRE_INTERMEDIATE">Pre-Intermediate</option>
							<option ${language.level == 'INTERMEDIATE' ? ' selected="selected"' : ''} value="INTERMEDIATE">Intermediate</option>
							<option ${language.level == 'UPPER_INTERMEDIATE' ? ' selected="selected"' : ''} value="UPPER_INTERMEDIATE">Upper-Intermediate</option>
							<option ${language.level == 'ADVANCED' ? ' selected="selected"' : ''} value="ADVANCED">Advanced</option>
							<option ${language.level == 'PROFICIENCY' ? ' selected="selected"' : ''} value="PROFICIENCY">Proficiency</option>
						</select>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
</div>