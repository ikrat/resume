<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${profile.info != null }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-info"></i> Additional info <a class="edit-block" href="/edit/info"> <i class="fa fa-pencil-square-o"></i>Edit
				</a>
			</h3>
		</div>
		<div class="panel-body">${profile.info }</div>
	</div>
</c:if>