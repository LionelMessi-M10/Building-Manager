<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                <li class="active">Thêm tòa nhà</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Thêm tòa nhà
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="buildingEdit" action="/" method="GET" id="listForm">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form">

                            <form:hidden path="id" id="buildingId"/>

                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <form:select class="form-control" path="district">
                                        <option value="">---Chọn Quận---</option>
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="ward"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="street"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Kết cấu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="structure"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số tằng hầm</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="numberOfBasement"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="floorArea"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="direction"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="level"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentArea"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPrice"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPriceDescription"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="serviceFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="carFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="motorbikeFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="overtimeFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="electricityFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="deposit"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="payment"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời hạn thuê</label>
                                <div class="col-xs-9">
                                    <fmt:formatDate value="${buildingEdit.rentTime}" pattern="yyyy-MM-dd" var="formattedRentTime" />
                                    <input type="date" class="form-control" name="rentTime" value="${formattedRentTime}"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <fmt:formatDate value="${buildingEdit.decorationTime}" pattern="yyyy-MM-dd" var="formattedDecorationTime" />
                                    <input type="date" class="form-control" name="decorationTime" value="${formattedDecorationTime}"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
                                    <form:input  class="form-control" path="managerName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
                                    <form:input  class="form-control" path="managerPhone"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="brokerageFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-6">
                                    <c:forEach var="item" items="${typeCodes}">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="typeCode" name="typeCode" value="${item.data.key}" ${item.message}>${item.data.value}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
                                    <form:input  class="form-control" path="note"/>
                                </div>
                            </div>

<%--                            <div class="form-group">--%>
<%--                                <label class="col-xs-3">Hình đại diện</label>--%>
<%--                                <div class="col-xs-9">--%>
<%--                                    <form:input type="file" class="form-control" path="image"/>--%>
<%--                                    <img src="" alt="" width="200px" height="200px">--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-group">
                                <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                <div class="col-sm-9">
                                    <c:if test="${not empty buildingEdit.image}">
                                        <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                        <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                    </c:if>
                                    <c:if test="${empty buildingEdit.image}">
                                        <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                    </c:if>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-info" id="btnAddOrUpdateBuilding">
                                            Cập nhật tòa nhà
                                        </button>

                                        <a href="/admin/building-list" class="btn btn-danger">
                                            Hủy thao tác
                                        </a>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-info" id="btnAddOrUpdateBuilding">
                                            Thêm mới
                                        </button>

                                        <a href="/admin/building-list" class="btn btn-danger">
                                            Hủy thao tác
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </form:form>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>
    var imageBase64 = '';
    var imageName = '';

    $('#btnAddOrUpdateBuilding').click(function() {

        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();

        $.each(formData, function(i, v) {
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }

            if (v.name !== 'typeCode') {
                data["" + v.name + ""] = v.value;
            } else {
                typeCode.push(v.value);
            }
        });

        data['typeCode'] = typeCode;

        $('#loading_image').show();

        console.log(data);

        if (data['typeCode'] != '') {
            btnAddOrUpdateBuilding(data);
        } else {
            var buildingId = $('#buildingId').val();
            var api = "";
            if(buildingId > 0){
                api = '/admin/building-edit-' + buildingId + '?typeCode=required';
            }
            else api = '/admin/building-edit' + buildingId + '?typeCode=required';
            window.location.href = api;
        }
    });

    function btnAddOrUpdateBuilding(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data), // Chuyen data -> JSON
            contentType: "application/json", // Gui toi server voi dang JSON
            // dataType: "JSON", // Kieu tra ve la json tu server
            success: function(response){
                window.location.href = "http://localhost:8081/admin/building-list";
                console.log("Success");
            },
            error: function(response){
                console.log("Fail");
                console.log(response);
            }
        });
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

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });


    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
