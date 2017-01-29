<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid" align="center">
	<div class="panel panel-primary sign-up" align="left">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-unlock"></i> Access recovery
			</h3>
		</div>
		<div class="panel-body">
			<form action="/restore" method="post">
				<div class="form-group">
					<label>Input your UID or Email or Phone</label>
					 <input name="anyUniqueId" class="form-control" required="required" placeholder="UID or Email or Phone">
				</div>
				<button type="submit" class="btn btn-primary">Restore</button>
			</form>
		</div>
	</div>
</div>