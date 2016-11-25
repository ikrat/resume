<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-primary certificates">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-certificate"></i> Certificates <a class="edit-block" href="#"> <i class="fa fa-pencil-square-o"></i>Edit
			</a>
		</h3>
	</div>
	<div class="panel-body">
		<c:forEach items="${profile.certificates }" var="certificate">
			<a data-title="Certificate" href="${certificate.largeUrl }" class="thumbnail certificate-link"> 
				<img alt="Certificate" src="${certificate.smallUrl }" class="img-responsive"> <span>${certificate.name }</span>
			</a>
		</c:forEach>

	</div>
</div>