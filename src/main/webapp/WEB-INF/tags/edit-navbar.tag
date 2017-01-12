<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="resume"	tagdir="/WEB-INF/tags"%>
<%@ attribute name="section" required="true" type="java.lang.Object"%>

<ul class="nav nav-tabs">
  <li role="presentation" ${section == "Edit" ? ' class="active"' : ''}><a href="/edit">Основное</a></li>
  <li role="presentation" ${section == "Contacts" ? ' class="active"' : ''}><a href="/edit/contacts">Контакты</a></li>
  <li role="presentation" ${section == "Skills" ? ' class="active"' : ''}><a href="/edit/skills">Технические навыки</a></li>
  <li role="presentation" ${section == "Practics" ? ' class="active"' : ''}><a href="/edit/practic">Практический опыт</a></li>
  <li role="presentation" ${section == "Certificates" ? ' class="active"' : ''}><a href="/edit/certificates">Сертификаты</a></li>
  <li role="presentation" ${section == "Courses" ? ' class="active"' : ''}><a href="/edit/courses">Курсы</a></li>
  <li role="presentation" ${section == "Education" ? ' class="active"' : ''}><a href="/edit/education">Образование</a></li>
  <li role="presentation" ${section == "Languages" ? ' class="active"' : ''}><a href="/edit/languages">Языки</a></li>
  <li role="presentation" ${section == "Hobbies" ? ' class="active"' : ''}><a href="/edit/hobby">Хобби</a></li>
  <li role="presentation" ${section == "Info" ? ' class="active"' : ''}><a href="/edit/info">Дополнительно</a></li>
</ul>