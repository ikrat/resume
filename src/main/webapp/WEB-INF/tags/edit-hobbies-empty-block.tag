<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div id="ui-item-0" class="row ui-item skill-item">
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[0].id" value="${hobby.id }" /> 
		<select name="items[0].name" class="form-control">
			<option value="${null}"> </option>
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[1].id" value="${hobby.id }" /> 
		<select name="items[1].name" class="form-control">
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[2].id" value="${hobby.id }" /> 
		<select name="items[2].name" class="form-control">
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[3].id" value="${hobby.id }" /> 
		<select name="items[3].name" class="form-control">
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-xs-4 col-sm-8 col-md-12 form-group">
		<input type="hidden" name="items[4].id" value="${hobby.id }" /> 
		<select name="items[4].name" class="form-control">
			<c:forEach var="name" items="${hobbiesCategories }">
				<option class="btn btn-default" value="${name.name }" ${name.name == hobby.name ? ' selected="selected"' : ''}>${name.name }</option>
			</c:forEach>
		</select>
	</div>
</div>