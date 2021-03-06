<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<h2 class="text-center caption">Web application 'My Resume' - create your resume in 10 clicks</h2>
					<img class="img-responsive" src="/static/img/logo-large.png" alt="logo-large" style="width: 100%;">
				</div>
			</div>
		</div>
		<div class="row profiles">
			<div id="profileContainer" class="col-xs-12" data-profile-total="${page.totalPages }" data-profile-number="${page.number }">
				<jsp:include page="fragment/profile-items.jsp" />
			</div>
			<c:if test="${page.number < page.totalPages - 1}">
				<div id="loadMoreContainer" class="col-xs-12 text-center">
					<a href="javascript:resume.moreProfiles();" class="btn btn-primary">Load more</a>
				</div>
				<div id="loadMoreIndicator" class="col-xs-12 text-center" style="display: none;">
					<img src="/static/img/large-loading.gif" alt="loading..." />
				</div>
			</c:if>
		</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</div>
</div>