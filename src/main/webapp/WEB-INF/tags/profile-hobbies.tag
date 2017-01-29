<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-globe"></i> Hobbies 
			<sec:authorize access="hasAuthority('USER')">
				<a class="edit-block" href="/edit/hobby"> <i class="fa fa-pencil-square-o"></i>Edit </a>
			</sec:authorize>
		</h3>
	</div>
	<div class="panel-body">
		<c:choose>
			<c:when test="${profile.hobbies.isEmpty() || profile.hobbies == null}">
				<div align="center">
					<h6><b>Information about the hobbies are not filled.</b></h6>
				</div>
			</c:when>
			<c:otherwise>
				<div class="hobbies">
					<table class="table table-bordered">
						<tbody>
							<c:forEach items="${profile.hobbies }" var="hobby">
								<tr>
									<td><i class="fa fa-heart"></i></td>
									<td>${hobby.name }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
