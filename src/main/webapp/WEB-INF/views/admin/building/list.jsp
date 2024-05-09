<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
	<title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>

				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="/admin/building-list">Home</a>
					</li>
				</ul><!-- /.breadcrumb -->

			</div>

			<div class="page-content">

				<div class="page-header">
					<h1>
						Danh sách tòa nhà
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							Quản lý tòa nhà
						</small>
					</h1>
				</div><!-- /.page-header -->

				<div class="row" style="font-family: 'Times New Roman', Times, serif;">
					<div class="col-xs-12">
						<div class="widget-box ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title">Tìm kiếm</h5>

								<div class="widget-toolbar">

									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>

								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<form:form modelAttribute="modelSearch" action="${buildingListURL}" id="listForm" method="GET">
										<div class="row">
											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<label class="name">Tên tòa nhà</label>
														<form:input type="text" class="form-control" path="name"/>
													</div>

													<div class="col-xs-6">
														<label class="name">Diện tích sàn</label>
														<form:input type="number" class="form-control" path="floorArea"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-2">
														<label class="name">Quận</label>
														<form:select class="form-control" path="district">
															<option value="">---Chọn Quận---</option>
															<form:options items="${districts}"/>
														</form:select>
													</div>
													<div class="col-xs-5">
														<label class="name">Phường</label>
														<form:input type="text" class="form-control" path="ward"/>
													</div>
													<div class="col-xs-5">
														<label class="name">Đường</label>
														<form:input type="text" class="form-control" path="street"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-4">
														<label class="name">Số tầng hầm</label>
														<form:input type="number" class="form-control" path="numberOfBasement"/>
													</div>
													<div class="col-xs-4">
														<label class="name">Hướng</label>
														<form:input type="text" class="form-control" path="direction"/>
													</div>
													<div class="col-xs-4">
														<label class="name">Hạng</label>
														<form:input type="text" class="form-control" path="level" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-3">
														<label class="name">Diện tích từ</label>
														<form:input type="number" class="form-control" path="areaFrom"/>
													</div>
													<div class="col-xs-3">
														<label class="name">Diện tích đến</label>
														<form:input type="number" class="form-control" path="areaTo"/>
													</div>
													<div class="col-xs-3">
														<label class="name">Giá thuê từ</label>
														<form:input type="number" class="form-control" path="rentPriceFrom" />
													</div>
													<div class="col-xs-3">
														<label class="name">Giá thuê đến</label>
														<form:input type="number" class="form-control" path="rentPriceTo"/>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-4">
														<label class="name">Tên quản lý</label>
														<form:input type="text" class="form-control" path="managerName" />
													</div>
													<div class="col-xs-4">
														<label class="name">SĐT quản lý</label>
														<form:input type="text" class="form-control" path="managerPhone"/>
													</div>
													<c:if test="${role eq 'ROLE_MANAGER'}">
														<div class="col-xs-4">
															<label class="name">Chọn nhân viên</label>
															<form:select class="form-control" path="staffId">
																<option value="">---Chọn nhân viên---</option>
																<form:options items="${listStaff}"/>
															</form:select>
														</div>
													</c:if>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<form:checkboxes items="${typeCodes}" path="typeCode" />
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-xs-12">
													<div class="col-xs-6">
														<button type="submit" class="btn btn-xs btn-danger" id="btnSearchBuilding">
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
																<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
															</svg>
															Tìm kiếm
														</button>
													</div>
												</div>
											</div>
										</div>
									</form:form>
								</div>
							</div>

							<c:if test="${role eq 'ROLE_MANAGER'}">
								<div class="pull-right">
									<a href="/admin/building-edit">
										<button class="btn-info" title="Thêm tòa nhà">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
												<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
												<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
												<path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
											</svg>
										</button>
									</a>
									<button class="btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
											<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
											<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
											<path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
										</svg>
									</button>
								</div>
							</c:if>
						</div>

					</div>
				</div>

				<!-- Bảng danh sách -->
				<div class="row">
					<div class="col-xs-12">
						<display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
									   requestURI="${buildingListURL}" partialList="true" sort="external"
									   size="${modelSearch.totalItems}" defaultsort="2" defaultorder="ascending"
									   id="tableList" pagesize="${modelSearch.maxPageItems}"
									   export="false"
									   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
									   style="margin: 3em 0 1.5em;">
							<display:column title="<fieldset class='form-group'>
																		<input type='checkbox' id='checkAll' class='check-box-element'>
																		</fieldset>" class="center select-cell"
											headerClass="center select-cell">
								<fieldset>
									<input type="checkbox" name="checkList" value="${tableList.id}"
										   id="checkbox_${tableList.id}" class="check-box-element"/>
								</fieldset>
							</display:column>
							<display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
							<display:column headerClass="text-left" property="address" title="Địa chỉ"/>
							<display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>
							<display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
							<display:column headerClass="text-left" property="managerPhone" title="SĐT quản lý"/>
							<display:column headerClass="text-left" property="floorArea" title="DT sàn"/>
							<display:column headerClass="text-left" property="emptyArea" title="DT trống"/>
							<display:column headerClass="text-left" property="rentArea" title="DT thuê"/>
							<display:column headerClass="text-left" property="rentPrice" title="Giá thuê"/>
							<display:column headerClass="text-left" property="brokerageFee" title="Phí môi giới"/>
							<display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
							<display:column headerClass="col-actions" title="Thao tác">
								<div class="hidden-sm hidden-xs btn-group">
									<c:if test="${role eq 'ROLE_MANAGER'}">
										<button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="13" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
												<path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"></path>
												<path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z"></path>
											</svg>
										</button>
									</c:if>

									<a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
										<i class="ace-icon fa fa-pencil bigger-120"></i>
									</a>

									<button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
										<i class="ace-icon fa fa-trash-o bigger-120"></i>
									</button>

								</div>
							</display:column>
						</display:table>
					</div>
				</div>
			</div><!-- /.page-content -->
		</div>
	</div><!-- /.main-content -->

</div><!-- /.main-container -->

<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Danh sách nhân viên</h4>
			</div>
			<div class="modal-body">
				<table class="table table-striped table-bordered table-hover" id="staffList">
					<thead>
					<tr>
						<th class="center">Chọn</th>
						<th class="center">Tên nhân viên</th>
					</tr>
					</thead>

					<tbody class="center">

					</tbody>
				</table>

				<input type="hidden" name="buildingId" id="buildingIdModal">
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success" id="btnAssignmentBuilding">Giao tòa nhà</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
			</div>
		</div>

	</div>
</div>

<script>
	function assignmentBuilding(buildingId){
		$('#assignmentBuildingModal').modal();
		$('#buildingIdModal').val(buildingId);
		loadStaff(buildingId);
	}

	function loadStaff(buildingId){
		$.ajax({
			type: "GET",
			url: "${buildingAPI}/" + buildingId + "/staffs",
			dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				var row = "";

				$.each(response.data, function (index, item){
					row += '<tr>'
					row += '<td> <input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element"' + item.checked + '/></td>';
					row += '<td>' + item.fullName + '</td>'
					row += '</tr>'
				});

				$('#staffList tbody').html(row);

				console.log("Success");
			},
			error: function(response){
				console.log("Fail");
				window.location.href = "<c:url value="/admin/building-list?message=error" />";
				console.log(response);
			}
		});
	}


	$('#btnAssignmentBuilding').click(function(e){
		e.preventDefault();
		var data = {};
		data['buildingId'] = $('#buildingIdModal').val();

		var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
			return $(this).val();
		}).get();

		data['staffs'] = staffs;

		if(data['buildingId'] != '') assignmentBuildingFromModal(data);
		else window.location.href = "<c:url value="/admin/building-list?message=error" />";

		console.log("ok");
	});

	function assignmentBuildingFromModal(data){
		$.ajax({
			type: "POST",
			url: "${buildingAPI}/assignment",
			data: JSON.stringify(data), // Chuyen data -> JSON
			contentType: "application/json", // Gui toi server voi dang JSON
			// dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				console.info("Giao thành công");
				window.location.href = "http://localhost:8081/admin/building-list";
			},
			error: function(response){
				console.info("Giao không thành công");
				console.log(response);
				window.location.href = "<c:url value="/admin/building-list?message=error" />";
			}
		});
	}

	$('#btnSearchBuilding').click(function(e){
		e.preventDefault();
		$('#listForm').submit();
	});

	function deleteBuilding(id){
		var buildingId = [id];
		deleteBuildings(buildingId);
	}

	$('#btnDeleteBuilding').click(function(e){
		e.preventDefault();

		var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
			return $(this).val();
		}).get();

		deleteBuildings(buildingIds);
	});

	function deleteBuildings(data){
		$.ajax({
			type: "DELETE",
			url: "${buildingAPI}/" + data,
			data: JSON.stringify(data), // Chuyen data -> JSON
			contentType: "application/json", // Gui toi server voi dang JSON
			// dataType: "JSON", // Kieu tra ve la json tu server
			success: function(response){
				window.location.reload();
				console.log("Success");
			},
			error: function(response){
				console.log("Fail");
				console.log(response);
			}
		});
	}
</script>
</body>
</html>