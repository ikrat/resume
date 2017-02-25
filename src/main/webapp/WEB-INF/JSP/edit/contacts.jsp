<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<resume:edit-navbar section="Contacts"/>
<div class="panel panel-primary">
	<div class="panel-body">
		<h4 class="data-header" align="center">Additional contacts: skype, links to social profiles, etc.</h4>
		<hr />
		<form:form action="/edit/contacts" method="post" commandName="contacts">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="col-md-3" align="right">
							<h5>
								<b>Skype:</b>
							</h5>
						</div>
						<div class="col-md-9">
							<input name="skype" class="form-control pull-right" value="${contacts.skype }">
						</div>
					</div>
					<div class="col-md-6">
						<blockquote>
							1.It is desirable that Skype contains your first and last name as stated in your passport.<br>
							2.It is not recommended to use creative Skype, for example, TheBestDeveloper, lackomka, etc.<br> 
							3.If you do not have adequate Skype-name, it's time to create it.
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
									<b>Vkontakte:</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="vkontakte" class="form-control pull-right" style="resize: none;">${contacts.vkontakte } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>Facebook:</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="facebook" class="form-control pull-right" style="resize: none;">${contacts.facebook } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>Linkedin:</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="linkedin" class="form-control pull-right" style="resize: none;">${contacts.linkedin } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>GitHub:</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="github" class="form-control pull-right" style="resize: none;">${contacts.github } </textarea>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-3" align="right">
								<h5>
									<b>StackOverflow:</b>
								</h5>
							</div>
							<div class="col-md-9">
								<textarea name="stackoverflow" class="form-control pull-right" style="resize: none;">${contacts.stackoverflow } </textarea>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<blockquote>
							<b>1.For proper operation of links, use only a link to the profile, without pointing the domain, for example, "richard-hendricks".</b><br>
							2.For complete information about the candidate HR-manager can look for his profile on the social network. To ensure that your profile was quickly found, enter the reference to it in your other contacts.<br> 
							3.Pointing to the profile, make sure that there is no information contrary to your resume, as such discrepancies are visible to the naked eye.<br>
							4.Look at your profile to the side and make sure that there are no indecent photos of your student's life, that information to nothing when searching for work. <br>
							5.If you are a member of dubious groups that compromise you as adequate human, it's time to leave this community. <br>
							6.In the settings of modern social networks have the ability to create links to the named profile, instead id12345678, so it makes sense to take advantage of these possibilities.
						</blockquote>
					</div>
				</div>
			</div>

			<hr />
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
					<a href="/edit/skills" class="btn btn-primary">Skip</a>
				</div>
			</div>
		</form:form>
	</div>
</div>