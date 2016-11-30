<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${profile.hobbies != null }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-globe"></i> Hobbies <a class="edit-block" href="/edit/hobby"> <i class="fa fa-pencil-square-o"></i>Edit
				</a>
			</h3>
		</div>
		<div class="panel-body">
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
		</div>
	</div>
</c:if>