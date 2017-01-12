<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>



<div class="panel panel-primary">
	<div class="panel-body">
		<form:form action="/sign-up-main" method="post" enctype="multipart/form-data" commandName="profileForm">
			<div class="data-header" align="center">
				<h2 class="text">${profileForm.profile.fullName}</h2>
			</div>
			<hr />
			<div class="data-header" align="center">
				<h4 class="text"><b>Следующие поля должны быть заполнены, чтобы завершить регистрацию!</b></h4>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h4>Фото:</h4>
						</div>
						<div class="col-md-9">
							<img alt="" src="/static/img/unknown.jpg"><br>
							<input type="hidden" name="profile.largePhoto" value="${profileForm.profile.largePhoto}" />
							<input type="hidden" name="profile.smallPhoto" value="${profileForm.profile.smallPhoto}" />
							<div>
								<div class="row center">
									<div class="col-md-1 col-sm-2"></div>
									<div class="col-md-1 col-sm-2">
										<input type="file" class="btn btn-info" name="file" value="${profileForm.profile.largePhoto }"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1. Фотография может многое рассказать о кандидате: начиная от его эстетических качеств и заканчивая его отношением к поиску серьезной работы. <br>2.
							Фотография как на паспорт или в костюме необязательна, главное адекватность и ухоженный, аккуратный внешний вид.<br> 3. Размер фотографии
							должен быть не меньше чем 400х400. <br>4. Файл должен быть в формате jpg.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Дата рождения:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="profile.birthDay" class="datepicker-here form-control" id="inputBirthday" value="${profileForm.profile.birthDay }" />
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Укажите свою реальную дату рождения.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Страна:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="profile.country" class="form-control pull-right" id="inputCountry" value="${profileForm.profile.country }">
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Укажите страну Вашего рождения.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Город:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="profile.city" class="form-control pull-right" style="resize: none;">${profileForm.profile.city }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Укажите город Вашего рождения.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Email*</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="profile.email" class="form-control pull-right" style="resize: none;">${profileForm.profile.email }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1.Желательно, чтобы email содержал Ваше имя и фамилию как указано в загран паспорте. <br>2.Не рекомендуется использовать креативные email,
							например, TheBestDeveloper@gmail.com, lackomka@gmail.com, etc. <br>3.Hе рекомендуется использовать доменное имя работодателя там где Вы
							сейчас работаете. <br>4.Для программистов рекомендуется использовать домен @gmail.com
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Телефон*</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="profile.phone" class="form-control pull-right" style="resize: none;">${profileForm.profile.phone }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							Номер телефона должен быть рабочим и тем номером с которого Вы будете отвечать на звонки с неизвестных Вам номеров. Номер телефона нужно
							предоставлять в формате <a href="https://ru.wikipedia.org/wiki/E.164">E.164</a>, например: +380501234567.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>Желаемая должность*</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="profile.objective" class="form-control pull-right" style="resize: none;">${profileForm.profile.objective }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>В данном разделе нужно указать желаемую должность максимально кратко и понятно.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="center">
							<h5>
								<b>Ваша квалификация*</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="profile.summary" style="resize: none;" class="form-control-summary">${profileForm.profile.summary }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1. В данном разделе необходимо описать Ваш опыт (практический или теоретический) по тому направлению, в котором вы ищете работу. <br> 2.
							Если Вы работали фотографим и хотите изменить профиль своей деятельности, не нужно описывать Ваши достижения в фотографии при поиске работы
							программистом. <br> 3. Если в желаемой должности у Вас нет достижений, это повод пройти какие-либо курсы в данном направлении или
							самостоятельно изучить основы будущей профессии.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<br>
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Сохранить">
				</div>
			</div>
			<br>
			<hr />
		</form:form>
	</div>
</div>