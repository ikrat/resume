<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar />
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Дополнительные контакты:skype, ссылки на социальные профили и т.д.</h4>
		<hr />
		<form:form action="/edit/contacts" method="post" commandName="contactsForm">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="col-md-3" align="right">
							<h5>
								<b>Skype*</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="contacts.skype" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.skype }</textarea>
						</div>
					</div>
					<div class="col-md-6">
						<blockquote>
							1.Желательно, чтобы skype содержал Ваше имя и фамилию как указано в загран паспорте. Если указанное имя уже занято, возможны сокращения.<br>2.Не
							рекомендуется использовать креативные skype, например, TheBestDeveloper, lackomka, etc.<br> 3.Если у Вас нет адекватного skype-имени,
							значит пришло время его создать.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row-contacts">
					<div class="col-md-6">
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>Vkontakte*</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="contacts.vkontakte" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.vkontakte } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>Facebook*</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="contacts.facebook" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.facebook } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>Linkedin*</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="contacts.linkedin" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.linkedin } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>GitHub*</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="contacts.github" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.github } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>StackOverflow*</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="contacts.stackoverflow" class="form-control pull-right" style="resize: none;">${contactsForm.contacts.stackoverflow } </textarea>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<blockquote>
							1.Для получения полной информации о кандидате HR-менеджер может поискать его профиль в социальной сети. Для того, чтобы Ваш профиль был быстрее
							всего найден, укажите ссылки на него в Ваших дополнительных контактах.<br> 2.Указывая профиль, убедитесь что в нем нет информации,
							противоречащей Вашему резюме, так как такие несоответствия видны невооруженным глазом.<br>3.Просмотрите Ваш профиль со стороны и убедитесь
							что в нем нет неприличных фотографий Вашей бурной студенческой жизни - это информация ни к чему при поиске работы. <br>4.Если Вы состоите
							в сомнительных группах, которые компрометируют Вас как адекватного человека, пришло время покинуть эти сообщества. <br>5.В настройках
							современных социальных сетей есть возможность создания именованных ссылок на профиль, вместо id12345678, поэтому имеет смысл воспользоваться
							данными возможностями.
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