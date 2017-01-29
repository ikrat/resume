<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>
<%@ attribute name="section" required="true" type="java.lang.Object"%>
<div class="container-fluid">
	<ul class="nav nav-tabs">
		<li role="presentation" ${section == "Edit" ? ' class="active"' : ''}><a href="/edit">Main</a></li>
		<li role="presentation" ${section == "Contacts" ? ' class="active"' : ''}><a href="/edit/contacts">Contacts</a></li>
		<li role="presentation" ${section == "Skills" ? ' class="active"' : ''}><a href="/edit/skills">Technical skills</a></li>
		<li role="presentation" ${section == "Practics" ? ' class="active"' : ''}><a href="/edit/practic">Practical experience</a></li>
		<li role="presentation" ${section == "Certificates" ? ' class="active"' : ''}><a href="/edit/certificates">Certificates</a></li>
		<li role="presentation" ${section == "Courses" ? ' class="active"' : ''}><a href="/edit/courses">Courses</a></li>
		<li role="presentation" ${section == "Education" ? ' class="active"' : ''}><a href="/edit/education">Education</a></li>
		<li role="presentation" ${section == "Languages" ? ' class="active"' : ''}><a href="/edit/languages">Foreign languages</a></li>
		<li role="presentation" ${section == "Hobbies" ? ' class="active"' : ''}><a href="/edit/hobby">Hobbies</a></li>
		<li role="presentation" ${section == "Info" ? ' class="active"' : ''}><a href="/edit/info">Additional info</a></li>
	</ul>
</div>