<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<%@ attribute name="index" required="true" type="java.lang.Object"%>
<%@ attribute name="practic" required="false" type="net.study.resume.entity.Practic"%>


<div id="ui-item-${index }" class="row ui-item course-item">
	<div class="panel panel-primary">
		<div class="panel-body">
		<button type="button" class="close" onclick="$('#ui-item-${index }').remove();">
			<span aria-hidden="true">&times;</span>
		</button>
			<input type="hidden" name="items[${index }].id" value="${practic.id }" />
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<br>
				<b>Должность</b>
				<textarea name="items[${index }].name" class="form-control" style="resize: none;">${practic.position }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Компания или организация</b><br>
				<textarea name="items[${index }].name" class="form-control" style="resize: none;">${practic.company }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
			<b>Дата начала</b>
			<br>
			
			<!-- ПЕРЕДЕЛАТЬ -->
			<select class="form-control-begin">		
			<option value="${practic.beginDateMonth }" ${practic.beginDateMonth == practic.beginDateMonth ? ' selected="selected"' : ''}>${practic.beginDateMonth }</option>
				<option value="1">Январь</option>
				<option value="2">Февраль</option>
				<option value="3">Март</option>
				<option value="4">Апрель</option>
				<option value="5">Май</option>
				<option value="6">Июнь</option>
				<option value="7">Июль</option>
				<option value="8">Август</option>
				<option value="9">Сентябрь</option>
				<option value="October">Октябрь</option>
				<option value="11">Ноябрь</option>
				<option value="12">Декабрь</option>
			</select>
			<select class="form-control-begin">
			<option value="${practic.beginDateYear }" ${practic.beginDateYear == practic.beginDateYear ? ' selected="selected"' : ''}>${practic.beginDateYear }</option>
				<option>2005</option>
				<option>2006</option>
				<option>2007</option>
				<option>2008</option>
				<option>2009</option>
				<option>2010</option>
				<option>2011</option>
				<option>2012</option>
				<option>2013</option>
				<option>2014</option>
				<option>2015</option>
				<option>2016</option>
				<option>2017</option>
				<option>2018</option>
			</select>
			</div>
			
				<div class="col-xs-5 col-sm-4 col-md-6 form-group">
			<b>Дата завершения</b>
			<br>
			<select class="form-control-begin">
				<option value="${practic.finishDateMonth }" ${practic.finishDateMonth == practic.finishDateMonth ? ' selected="selected"' : ''}>${practic.finishDateMonth }</option>
				<option value="1">Январь</option>
				<option value="2">Февраль</option>
				<option value="3">Март</option>
				<option value="4">Апрель</option>
				<option value="5">Май</option>
				<option value="6">Июнь</option>
				<option value="7">Июль</option>
				<option value="8">Август</option>
				<option value="9">Сентябрь</option>
				<option value="10">Октябрь</option>
				<option value="11">Ноябрь</option>
				<option value="12">Декабрь</option>
			</select>
			<select class="form-control-begin">
			<option value="${practic.finishDateYear }" ${practic.finishDateYear == practic.finishDateYear ? ' selected="selected"' : ''}>${practic.finishDateYear }</option>
				<option>2000</option>
				<option>2001</option>
				<option>2002</option>
				<option>2003</option>
				<option>2004</option>
				<option>2005</option>
				<option>2006</option>
				<option>2007</option>
				<option>2008</option>
				<option>2009</option>
				<option>2010</option>
				<option>2011</option>
				<option>2012</option>
				<option>2013</option>
				<option>2014</option>
			</select>
			</div>
			<!-- THIS -->
			
			<div class="col-xs-5 col-sm-4 col-md-12 form-group">
				<b>Обязанности/достижения</b><br>
				<textarea name="items[${index }].responsibilities" class="form-control pull-right" required="required" rows="2">${practic.responsibilities }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>ССылка на демо:</b>
				<br>
				<textarea name="items[${index }].demo" class="form-control" style="resize: none;">${practic.demo }</textarea>
			</div>
			<div class="col-xs-5 col-sm-4 col-md-6 form-group">
				<b>Исходный код</b>
				<br>
				<textarea name="items[${index }].src" class="form-control" style="resize: none;">${practic.src }</textarea>
			</div>
		</div>
	</div>
</div>