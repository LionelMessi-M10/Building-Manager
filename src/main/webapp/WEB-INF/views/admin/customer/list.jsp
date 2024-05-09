<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>
    <%--<spring:message code="label.user.list"/>--%>
    Danh sách khách hàng
  </title>
</head>

<body>
<div class="main-content">
    <div class="main-content-inner">
      <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
        </script>

        <ul class="breadcrumb">
          <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="<c:url value="/admin/home"/>">
              Trang chủ
            </a>
          </li>
          <li class="active">
            Quản lý khách hàng
          </li>
        </ul>
        <!-- /.breadcrumb -->
      </div>
      <div class="page-content">
        <div class="row">
          <div class="col-xs-12">
            <c:if test="${messageResponse!=null}">
              <div class="alert alert-block alert-${alert}">
                <button type="button" class="close" data-dismiss="alert">
                  <i class="ace-icon fa fa-times"></i>
                </button>
                  ${messageResponse}
              </div>
            </c:if>
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
              <div class="col-xs-12">
                <div class="widget-box table-filter">
                  <div class="widget-header">
                    <h4 class="widget-title">
                      Tìm kiếm
                    </h4>
                    <div class="widget-toolbar">
                      <a href="#" data-action="collapse">
                        <i class="ace-icon fa fa-chevron-up"></i>
                      </a>
                    </div>
                  </div>
                  <div class="widget-body">
                    <form:form action="${formUrl}" modelAttribute="modelSearch" method="get" id="listForm">
                      <div class="widget-main">
                        <div class="form-horizontal">
                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-4">
                                <label class="name">Tên khách hàng</label>
                                <form:input type="text" id="name" class="form-control" path="name"/>
                              </div>

                              <div class="col-xs-4">
                                <label class="telephone">Di động</label>
                                <form:input type="text" id="telephone" class="form-control" path="customerPhone"/>
                              </div>

                              <div class="col-xs-4">
                                <label class="email">Email</label>
                                <form:input type="text" id="email" class="form-control" path="email"/>
                              </div>
                            </div>
                          </div>

                          <c:if test="${role eq 'ROLE_MANAGER'}">
                            <div class="form-group">
                              <div class="col-xs-12">
                                <div class="col-xs-4">
                                  <label class="name">Chọn nhân viên</label>
                                  <form:select class="form-control" path="managementStaff">
                                    <option value="">---Chọn nhân viên---</option>
                                    <form:options items="${listStaff}"/>
                                  </form:select>
                                </div>
                              </div>
                            </div>
                          </c:if>

                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-6">
                                <button id="btnSearchCustomer" type="button" class="btn btn-sm btn-danger">
                                  Tìm kiếm
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>

                <c:if test="${role eq 'ROLE_MANAGER'}">
                  <div class="pull-right">
                    <a href="/admin/customer-edit">
                      <button class="btn-info" title="Thêm khách hàng">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
                          <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                          <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                        </svg>
                      </button>
                    </a>
                    <button class="btn-danger" title="Xóa khách hàng" id="btnDeleteCustomer">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-dash" viewBox="0 0 16 16">
                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                        <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                      </svg>
                    </button>
                  </div>
                </c:if>

              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="table-responsive">
                  <display:table name="modelSearch.listResult" cellspacing="0" cellpadding="0"
                                 requestURI="${formUrl}" partialList="true" sort="external"
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
                    <display:column headerClass="text-left" property="name" title="Tên khách hàng"/>
                    <display:column headerClass="text-left" property="customerPhone" title="Di động"/>
                    <display:column headerClass="text-left" property="email" title="Email"/>
                    <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                    <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                    <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                    <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                    <display:column headerClass="col-actions" title="Thao tác">
                      <div class="hidden-sm hidden-xs btn-group">
                        <c:if test="${role eq 'ROLE_MANAGER'}">
                          <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})">
                            <i class="icon-only ace-icon fa fa-align-justify"></i>
                          </button>
                        </c:if>

                        <a class="btn btn-xs btn-info" title="Sửa khách hàng" href="/admin/customer-edit-${tableList.id}">
                          <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </a>

                        <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                          <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                      </div>
                    </display:column>
                  </display:table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>

<div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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

        <input type="hidden" name="customerId" id="customerIdModal">
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success" id="btnAssignmentCustomer">Giao khách hàng</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
      </div>
    </div>

  </div>
</div>

<script>
    function assignmentCustomer(customerId){
        $('#assignmentCustomerModal').modal();
        $('#customerIdModal').val(customerId);
        loadStaff(customerId);
    }

    function loadStaff(customerId){
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + customerId + "/staffs",
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


    $('#btnAssignmentCustomer').click(function(e){
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerIdModal').val();

        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();

        data['staffs'] = staffs;

        if(data['customerId'] != '') assignmentBuildingFromModal(data);
        else window.location.href = "<c:url value="/admin/customer-list?message=error" />";

        console.log("ok");
    });

    function assignmentBuildingFromModal(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}/assignment",
            data: JSON.stringify(data), // Chuyen data -> JSON
            contentType: "application/json", // Gui toi server voi dang JSON
            // dataType: "JSON", // Kieu tra ve la json tu server
            success: function(response){
                console.log("Giao khách hàng thành công");
                window.location.reload();
            },
            error: function(response){
                console.log("Giao không thành công");
                console.log(response);
                window.location.href = "<c:url value="/admin/building-list?message=error" />";
            }
        });
    }

    $('#btnSearchCustomer').click(function(e){
        e.preventDefault();
        $('#listForm').submit();
    });

    function deleteCustomer(id){
        var customerId = [id];
        deleteCustomers(customerId);
    }

    $('#btnDeleteCustomer').click(function(e){
        e.preventDefault();

        var customerIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();

        deleteCustomers(customerIds);
    });

    function deleteCustomers(data){
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}/" + data,
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