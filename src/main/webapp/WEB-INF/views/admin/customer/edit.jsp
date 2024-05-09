<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
  <title>Thêm khách hàng</title>
</head>
<body>
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
        <c:if test="${not empty customerEdit.id}">
          <li class="active">Chỉnh sửa khách hàng</li>
        </c:if>
        <c:if test="${empty customerEdit.id}">
          <li class="active">Thêm khách hàng</li>
        </c:if>
      </ul><!-- /.breadcrumb -->

    </div>

    <div class="page-content">

      <div class="page-header">
        <h1>
          Thông tin khách hàng
        </h1>
      </div><!-- /.page-header -->

      <div class="row" style="font-family: 'Times New Roman', Times, serif;">
        <form:form modelAttribute="customerEdit" action="/" method="GET" id="listForm">
          <div class="col-xs-12">
            <form class="form-horizontal" role="form">

              <form:hidden path="id" id="customerId"/>

              <div class="form-group">
                <label class="col-xs-3">Tên khách hàng</label>
                <div class="col-xs-9">
                  <form:input class="form-control" path="name" required="Bạn chưa nhập tên khách hàng"/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3">Số điện thoại</label>
                <div class="col-xs-9">
                  <form:input class="form-control" path="customerPhone" required="Bạn chu nhập số điện thoại"/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3">Email</label>
                <div class="col-xs-9">
                  <form:input class="form-control" path="email"/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3">Tên công ty</label>
                <div class="col-xs-9">
                  <form:input class="form-control" path="companyName"/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3">Nhu cầu</label>
                <div class="col-xs-9">
                  <form:input class="form-control" path="demand"/>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3">Tình trạng</label>
                <div class="col-xs-2">
                  <form:select class="form-control" path="status">
                    <option value="">---Chọn tình trạng---</option>
                    <c:forEach items="${statuses}" var="item">
                      <c:if test="${item.value eq customerEdit.status}">
                        <option value="${item.key}" selected>${item.value}</option>
                      </c:if>
                      <c:if test="${item.value != customerEdit.status}">
                        <option value="${item.key}" >${item.value}</option>
                      </c:if>
                    </c:forEach>
                  </form:select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-xs-3"></label>
                <div class="col-xs-9">
                  <c:if test="${not empty customerEdit.id}">
                    <button type="button" class="btn btn-info" id="btnAddOrUpdateCustomer">
                      Cập nhật thông tin
                    </button>

                    <a href="/admin/customer-list" class="btn btn-danger">
                      Hủy thao tác
                    </a>
                  </c:if>
                  <c:if test="${empty customerEdit.id}">
                    <button type="button" class="btn btn-info" id="btnAddOrUpdateCustomer">
                      Thêm khách hàng
                    </button>

                    <a href="/admin/customer-list" class="btn btn-danger">
                      Hủy thao tác
                    </a>
                  </c:if>
                </div>
              </div>
            </form>
          </div>
        </form:form>
      </div>

      <c:if test="${not empty customerEdit.id}">
        <c:forEach var="item" items="${transactionType}">
          <div class="col-xs-12">
            <div class="col-sm-12">
              <h3 class="header smaller lighter blue">${item.value}</h3>
              <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', '${customerEdit.id}')">
                <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
              </button>
            </div>

            <c:if test="${item.key == 'CSKH'}">
              <div class="col-xs-12">
                <table id="simple-table" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>Ngày tạo</th>
                      <th>Người tạo</th>
                      <c:if test="${not empty(cskh)}">
                        <th>Ngày sửa</th>
                      </c:if>
                      <c:if test="${not empty(cskh)}">
                        <th>Người sửa</th>
                      </c:if>
                      <th>Chi tiết giao dịch</th>
                      <th>Thao tác</th>
                    </tr>
                  </thead>

                  <tbody>
                    <c:forEach var="transaction" items="${cskh}">
                      <c:if test="${transaction.code == 'CSKH'}">
                        <tr>
                          <td>
                            <fmt:formatDate value="${transaction.createdDate}" pattern="dd/MM/yyyy"/>
                          </td>
                          <td>${transaction.createdBy}</td>
                          <c:if test="${not empty transaction.modifiedDate}">
                            <td>
                              <fmt:formatDate value="${transaction.modifiedDate}" pattern="dd/MM/yyyy"/>
                            </td>
                          </c:if>
                          <c:if test="${empty transaction.modifiedDate}">
                            <td></td>
                          </c:if>
                          <c:if test="${not empty transaction.modifiedBy}">
                            <td>${transaction.modifiedBy}</td>
                          </c:if>
                          <c:if test="${empty transaction.modifiedBy}">
                            <td></td>
                          </c:if>
                          <td>${transaction.note}</td>
                          <td>
                            <button type="button" class="btn btn-xs btn-info" title="Sửa giao dich" onclick="updateTransactionType(${transaction.id})">
                              <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                          </td>
                        </tr>
                      </c:if>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:if>

            <c:if test="${item.key == 'DDX'}">
              <div class="col-xs-12">
                <table id="simple" class="table table-striped table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>Ngày tạo</th>
                    <th>Người tạo</th>
                    <c:if test="${not empty(ddx)}">
                      <th>Ngày sửa</th>
                    </c:if>
                    <c:if test="${not empty(ddx)}">
                      <th>Người sửa</th>
                    </c:if>
                    <th>Chi tiết giao dịch</th>
                    <th>Thao tác</th>
                  </tr>
                  </thead>

                  <tbody>
                  <c:forEach var="transaction" items="${ddx}">
                    <c:if test="${transaction.code == 'DDX'}">
                      <tr>
                        <td>
                          <fmt:formatDate value="${transaction.createdDate}" pattern="dd/MM/yyyy"/>
                        </td>
                        <td>${transaction.createdBy}</td>
                        <c:if test="${not empty transaction.modifiedDate}">
                          <td>
                            <fmt:formatDate value="${transaction.modifiedDate}" pattern="dd/MM/yyyy"/>
                          </td>
                        </c:if>
                        <c:if test="${empty transaction.modifiedDate}">
                          <td></td>
                        </c:if>
                        <c:if test="${not empty transaction.modifiedBy}">
                          <td>${transaction.modifiedBy}</td>
                        </c:if>
                        <c:if test="${empty transaction.modifiedBy}">
                          <td></td>
                        </c:if>
                        <td>${transaction.note}</td>
                        <td>
                          <button type="button" class="btn btn-xs btn-info" title="Sửa giao dich" onclick="updateTransactionType(${transaction.id})">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                          </button>
                        </td>
                      </tr>
                    </c:if>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:if>
          </div>
        </c:forEach>
      </c:if>

    </div><!-- /.page-content -->
  </div>
</div><!-- /.main-content -->

<div class="modal fade" id="transactionTypeModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Nhập giao dịch</h4>
      </div>
      <div class="modal-body">
        <div class="form-group has-success">
          <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi tiết giao dich</label>
          <div class="col-xs-12 col-sm-9" id="transaction">
            <span class="block input-icon input-icon-right">
              <input type="text" id="transactionDetail" class="width-100">
            </span>
          </div>
          <input type="hidden" name="customerId" id="customerId" value="">
          <input type="hidden" name="code" id="code" value="">
          <input type="hidden" name="id" id="id" value="">
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
      </div>
    </div>

  </div>
</div>

<script>

    $('#btnAddOrUpdateCustomer').click(function() {

        var data = {};
        var formData = $('#listForm').serializeArray();

        $.each(formData, function(i, v) {
            data["" + v.name + ""] = v.value;
        });

        console.log(data);

        if (data['status'] != '') {
            btnAddOrUpdateCustomer(data);
        } else {
            var customerId = $('#customerId').val();
            var api = "";
            if(buildingId > 0){
                api = '/admin/customer-edit-' + customerId + '?typeCode=required';
            }
            else{
                api = '/admin/customer-edit' + customerId + '?typeCode=required';
            }
            window.location.href = api;
            alert("Bạn chưa cập nhật tình trạng");
        }
    });

    function btnAddOrUpdateCustomer(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data), // Chuyen data -> JSON
            contentType: "application/json", // Gui toi server voi dang JSON
            // dataType: "JSON", // Kieu tra ve la json tu server
            success: function(response){
                window.location.href = "http://localhost:8081/admin/customer-list";
                console.log("Success");
            },
            error: function(response){
                console.log("Fail");
                console.log(response);
            }
        });
    }

    function transactionType(code, customerId){
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function updateTransactionType(id){
        $('#transactionTypeModal').modal();
        $('#id').val(id);
        loadTransactionDetail(id);
    }

    function loadTransactionDetail(id){
        $.ajax({
            type: "GET",
            url: "${customerAPI}/transaction/" + id,
            dataType: "JSON", // Kieu tra ve la json tu server
            success: function(response){
                $('#transactionDetail').val(response.note);
            },
            error: function(response){
                console.log(response);
                window.location.reload();
            }
        });
    }

    $('#btnAddOrUpdateTransaction').click(function (e){
        e.preventDefault();
        var data = {};

        data['id'] = $('#id').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['note'] = $('#transactionDetail').val();

        addTransaction(data);
    });

    function addTransaction(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}/transaction",
            data: JSON.stringify(data), // Chuyen data -> JSON
            contentType: "application/json", // Gui toi server voi dang JSON
            // dataType: "JSON", // Kieu tra ve la json tu server
            success: function(response){
                console.log("Thêm giao dịch thành công");
                window.location.reload();
            },
            error: function(response){
                console.log("Thêm giao dịch không thành công");
                console.log(response);
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>
