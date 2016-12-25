<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar />
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">О себе</h4>
		<h5 class="data-body" align="center">
			<b>Несколько слов о себе, которые представят Вам преимущества перед другими кандидатами</b>
		</h5>
		<hr />
		<form:form action="/edit/info" method="post" commandName="profileForm">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<textarea name="profile.info" class="form-control-summary pull-right" style="resize: none;">${profileForm.profile.info }</textarea>
					</div>

				</div>
			</div>
			<br>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<blockquote>Укажите дополнительную информацию, которая действительно важна работодателю. Например:<br>
						Наличие открытой визы в иностранное государство, семейное положение, если женат и есть дети, реальный опыт в деятельности,
						которая может быть Вашей предметной областью при разработке програмного обеспечения, возможно опыт исследовательский работы в НИИ и т.д.<br>
						НЕ стоит указывать ваши личные качества, почти все кандидаты ответственные, комуникабельные и порядочные.
						
						</blockquote>
					</div>

				</div>
			</div>
			<hr />

			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Сохранить">
				</div>
			</div>
		</form:form>
	</div>
</div>