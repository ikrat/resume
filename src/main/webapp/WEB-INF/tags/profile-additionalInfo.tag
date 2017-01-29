<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-info"></i> Additional info 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/info"> <i class="fa fa-pencil-square-o"></i>Edit</a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.info.isEmpty() || profile.info == null }">
			<div align="center">
				<h6><b>Additional information is not filled.</b></h6>
			</div>
			</c:when>
			<c:otherwise>
				${profile.info }
			</c:otherwise>
		</c:choose>
	</div>
</div>