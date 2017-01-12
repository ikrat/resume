<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="language" required="false" type="net.study.resume.entity.Language"%>


<div class="frame ui-item" id="ui-item-${index}">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<br>
	<div class="row">
		<div class="col-lg-3 col-sm-2 ">
			<input type="hidden" name="items[${index }].id" value="${language.id }" />
			<div class="input-practic">
				<label for="begin-month">Тип</label> 
				<select class="form-control" name="items[${index }].type">
					<option value="ALL">Не указан</option>
					<option ${language.type == 'WRITING' ? ' selected="selected"' : ''} value="WRITING">Письменный</option>
					<option ${language.type == 'SPOKEN' ? ' selected="selected"' : ''} value="SPOKEN">Разговорный</option>
				</select>
			</div>
		</div>
		<div class="col-lg-3 col-sm-2 ">
			<div class="input-practic">
				<label for="begin-month">Язык</label>
				<select class="form-control" name="items[${index }].name">
					<option ${language.name == 'English' ? ' selected="selected"' : ''}>English</option>
					<option ${language.name == 'Spanish' ? ' selected="selected"' : ''}>Spanish</option>
					<option ${language.name == 'French' ? ' selected="selected"' : ''}>French</option>
					<option ${language.name == 'German' ? ' selected="selected"' : ''}>German</option>
					<option ${language.name == 'Italian' ? ' selected="selected"' : ''}>Italian</option>
				</select>
			</div>
		</div>
		<div class="col-lg-6 col-sm-6">
			<div class="input-practic">
				<label for="begin-month">Уровень</label> <select class="form-control" name="items[${index }].level">
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
	<br> <br>
</div>