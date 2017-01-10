<%@tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form action="/edit/certificates/upload" method="post" enctype="multipart/form-data" commandName="uploadForm">
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal">×</button>
					<h4 class="modal-title">Загрузить файл сертификата</h4>
				</div>
				<div class="modal-body" style="text-align: right;">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">100%</div>
							</div>
						</div>
					</div>
					<div class="row center">
						<div class="col-lg-3 col-sm-3"></div>
						<div class="col-lg-3 col-sm-3">
							<input type="file" class="btn btn-info" name="file" />
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Name certificate" name="name">
							</div>
						</div>
						<div class="col-xs-12 text-center">
						<input type="submit" class="btn btn-primary" value="Добавить сертификат">
					</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</form:form>