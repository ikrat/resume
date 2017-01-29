<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-primary">
	<c:choose>
		<c:when test="${profile.largePhoto != null }">
			<img class="img-responsive photo" src="${profile.largePhoto }" alt="photo">
		</c:when>
		<c:otherwise>
			<img class="img-responsive photo" src="/static/img/unknown.jpg" alt="photo">
		</c:otherwise>
	</c:choose>
	<h1 class="text-center">
		${profile.fullName}
	</h1>
	<c:if test="${!profile.country.isEmpty() || !profile.city.isEmpty() || profile.city != null || profile.country != null}">
		<h6 class="text-center">
			<strong>${profile.city }</strong>
			<strong>${profile.country }</strong>
		</h6>
	</c:if>
	<c:if test="${profile.birthDay != null }">
		<h6 class="text-center">
			<strong>Age:</strong>${profile.age }, <strong>Birthday:</strong> ${profile.birthDay }
		</h6>
	</c:if>
	<div class="list-group contacts">
		<c:if test="${!profile.phone.isEmpty() && profile.phone != null}">
			<a class="list-group-item" href="tel:${profile.phone }"><i class="fa fa-phone"></i>${profile.phone }</a>
		</c:if>
		<c:if test="${!profile.email.isEmpty() && profile.email != null}">
			<a class="list-group-item" href="mailto:${profile.email }"><i class="fa fa-envelope"></i>${profile.email }</a>
		</c:if>
		<c:if test="${!profile.contacts.skype.isEmpty() && profile.contacts.skype != null}">
			<a class="list-group-item" href="javascript:void(0);"><i class="fa fa-skype"></i>${profile.contacts.skype }</a>
		</c:if>
		<c:if test="${!profile.contacts.vkontakte.isEmpty() && profile.contacts.vkontakte != null}">
			<a target="_blank" class="list-group-item" href="https://vk.com/${profile.contacts.vkontakte}"><i class="fa fa-vk"></i>https://vk.com/${profile.contacts.vkontakte }</a>
		</c:if>
		<c:if test="${!profile.contacts.facebook.isEmpty() && profile.contacts.facebook != null}">
			<a target="_blank" class="list-group-item" href="https://facebook.com/${profile.contacts.facebook }"><i class="fa fa-facebook"></i>https://facebook.com/${profile.contacts.facebook }</a>
		</c:if>
		<c:if test="${!profile.contacts.linkedin.isEmpty() && profile.contacts.linkedin != null}">
			<a target="_blank" class="list-group-item" href="https://linkedin.com/in/${profile.contacts.linkedin }"><i class="fa fa-linkedin"></i>https://linkedin.com/in/${profile.contacts.linkedin }</a>
		</c:if>
		<c:if test="${!profile.contacts.github.isEmpty() && profile.contacts.github != null }">
			<a target="_blank" class="list-group-item" href="https://github.com/${profile.contacts.github }"><i class="fa fa-github"></i>https://github.com/${profile.contacts.github }</a>
		</c:if>
		<c:if test="${!profile.contacts.stackoverflow.isEmpty() && profile.contacts.stackoverflow != null}">
			<a class="list-group-item" href="https://stackoverflow.com/${profile.contacts.stackoverflow }"><i class="fa fa-stack-overflow"></i>https://stackoverflow.com/${profile.contacts.stackoverflow }</a>
		</c:if>
	</div>
</div>