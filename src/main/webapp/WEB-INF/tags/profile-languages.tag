<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-language"></i> Foreign languages <a class="edit-block" href="#"> <i class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<c:forEach items="${profile.languages }" var="language">
			<strong>${language.name }:</strong> ${language.level } (${language.type })<br>
		</c:forEach>
	</div>
</div>
