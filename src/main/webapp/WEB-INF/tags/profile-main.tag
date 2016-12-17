<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-primary">
	<c:if test="${profile.largePhoto != null }">
		<a href="/edit"><img class="img-responsive photo" src="${profile.largePhoto}" alt="photo"></a>
	</c:if>
	<h1 class="text-center">
		<a style="color: black;" href="/edit">${profile.fullName}</a>
	</h1>
	<c:if test="${profile.country != null || profile.city != null }">
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
		<c:if test="${profile.phone != null }">
			<a class="list-group-item" href="tel:${profile.phone }"><i class="fa fa-phone"></i>${profile.phone }</a>
		</c:if>
		<c:if test="${profile.email != null }">
			<a class="list-group-item" href="mailto:${profile.email }"><i class="fa fa-envelope"></i>${profile.email }</a>
		</c:if>
		<c:if test="${profile.contacts.skype != null }">
			<a class="list-group-item" href="javascript:void(0);"><i class="fa fa-skype"></i>${profile.contacts.skype }</a>
		</c:if>
		<c:if test="${profile.contacts.vkontakte != null }">
			<a target="_blank" class="list-group-item" href="${profile.contacts.vkontakte}"><i class="fa fa-vk"></i>${profile.contacts.vkontakte }</a>
		</c:if>
		<c:if test="${profile.contacts.facebook != null }">
			<a target="_blank" class="list-group-item" href="${profile.contacts.facebook }"><i class="fa fa-facebook"></i> ${profile.contacts.facebook }</a>
		</c:if>
		<c:if test="${profile.contacts.linkedin != null }">
			<a target="_blank" class="list-group-item" href="${profile.contacts.linkedin }"><i class="fa fa-linkedin"></i> ${profile.contacts.linkedin }</a>
		</c:if>
		<c:if test="${profile.contacts.github != null }">
			<a target="_blank" class="list-group-item" href="${profile.contacts.github }"><i class="fa fa-github"></i>${profile.contacts.github }</a>
		</c:if>
		<c:if test="${profile.contacts.stackoverflow != null }">
			<a target="_blank" class="list-group-item" href="${profile.contacts.stackoverflow }"><i class="fa fa-stack-overflow"></i>${profile.contacts.stackoverflow }</a>
		</c:if>
	</div>
</div>