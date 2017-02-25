<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<div class="panel panel-primary">
	<div class="panel-body">
		<form:form action="/sign-up-main" method="post" enctype="multipart/form-data" commandName="profile">
			<div class="data-header" align="center">
				<h2 class="text"><sec:authentication property="principal.fullName"/> </h2>
			</div>
			<hr />
			<div class="data-header" align="center">
				<h4 class="text">
					<b>The following fields must be filled in order to complete your registration!</b>
				</h4>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h4>*Photo:</h4>
						</div>
						<div class="col-md-9">
							<img alt="" src="/static/img/unknown.jpg"><br> 
							<input type="hidden" name="largePhoto" value="${profile.largePhoto}" /> 
							<input type="hidden" name="smallPhoto" value="${profile.smallPhoto}" />
							<div class="row center">
								<div class="col-md-1 col-sm-2"></div>
								<div class="col-md-1 col-sm-2">
									<input type="file" class="btn btn-info" name="file" value="${profile.largePhoto }" required="required"/>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1. Photography can tell a lot about a candidate: from its aesthetic qualities and ending its relationship to the search of serious work. <br>
							2. Photography as a passport or in suit is not necessary, most importantly adequate and well-groomed, neat appearance.<br> 
							3. Photo size should be no less than 400x400.<br>
							4. The file must be in jpg format.
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
								<b>*Date of Birth:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="birthDay" class="datepicker-here form-control" value="${profile.birthDay }" required="required"/>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Enter your real date of birth.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>*Country:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="country" class="form-control pull-right" id="inputCountry" value="${profile.country }" required="required">
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Enter the country of your birth.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>*City:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="city" class="form-control pull-right" style="resize: none;" required="required">${profile.city }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>Enter the city of your birth.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="right">
							<h5>
								<b>*Email:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="email" class="form-control pull-right" id="inputEmail" value="${profile.email }" required="required">
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1.It is desirable that email contains your first and last name as stated in your passport.<br>
							2.It is not recommended to use creative email, for example, TheBestDeveloper@gmail.com, lackomka@gmail.com, etc.<br>
							3.It is not recommended to use the domain name of the employer where you are currently working.<br>
							4.For programmers it is recommended to use the domain @gmail.com.
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
								<b>*Phone:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="phone" class="form-control pull-right" style="resize: none;" required="required">${profile.phone }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1.The phone number should be working, and the number from which you will answer calls from unknown numbers to you.<br>
							2.The phone number should be granted in the form <a href="https://ru.wikipedia.org/wiki/E.164">E.164</a>, for example: +380501234567.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="center">
							<h5>
								<b>*Desired position:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="objective" class="form-control pull-right" style="resize: none;" required="required">${profile.objective }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>In this section, you must specify the desired position of the most concise and clear.</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7">
						<div class="col-md-3" align="center">
							<h5>
								<b>*Your qualification:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<textarea name="summary" style="resize: none;" class="form-control-summary" required="required">${profile.summary }</textarea>
						</div>
					</div>
					<div class="col-md-5">
						<blockquote>
							1. This section should describe your experience (practical or theoretical) in the direction in which you are looking for work. <br> 
							2. If you worked as a photographer and want to change the profile of their activities, it is not necessary to describe your achievements in photography when looking for a job as a programmer.<br> 
							3. If in the desired position you do not have the achievements, it is an occasion to pass any courses in this area, or own study the foundations of their future profession.
						</blockquote>
					</div>
				</div>
			</div>
			<hr />
			<br>
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/my-profile" class="btn btn-primary">Skip registration</a>
				</div>
			</div>
			<br>
			<hr />
		</form:form>
	</div>
</div>