<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="margin" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="userAPI" value="/api/user"/>
<html>
<head>
    <title>Dashboard - Admin</title>
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
                    <i
                            class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">


            <%--<div class="page-header">--%>
            <%--<h1>--%>
            <%--Dashboard--%>
            <%--<small>--%>
            <%--<i--%>
            <%--class="ace-icon fa fa-angle-double-right"></i>--%>
            <%--Quản lý tòa nhà--%>
            <%--</small>--%>
            <%--</h1>--%>
            <%--</div><!-- /.page-header -->--%>


        </div><!-- /.page-content -->
        <div class="col-xs-12">
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">TÌM KIẾM
                    </h4>

                    <div class="widget-toolbar">
                        <a href="#"
                           data-action="collapse">
                            <i
                                    class="ace-icon fa fa-chevron-up"></i>
                        </a>


                    </div>
                </div>
                <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                    <div class="widget-main">
                        <form:form modelAttribute="modelSearch" action="${buildingListURL}" id="listForm" method="GET">
                            <div class="row">
                                <div
                                        class="form-group">
                                    <div
                                            class="col-xs-12">
                                        <div
                                                class="col-sm-6">
                                            <label>Tên
                                                tòa
                                                nhà</label>
                                                <%--<input type="text"--%>
                                                <%--class="form-control"--%>
                                                <%--name="name" value="${modelSearch.name}">--%>
                                            <form:input path="name" cssClass="form-control"/>
                                        </div>
                                        <div
                                                class="col-sm-6">
                                            <label>Diện tích sàn</label>
                                                <%--<input type="number"--%>
                                                <%--class="form-control"--%>
                                                <%--id="form-field-8" name="numberOfBasement" value="">--%>
                                            <form:input path="numberOfBasement" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div
                                        class="form-group">
                                    <div
                                            class="col-xs-12">
                                        <div
                                                class="col-xs-2">
                                            <label class="name">Quận Hiện Có</label><br>
                                            <form:select path="district" class="form-control">
                                                <form:option value="" label="--Chọn Quận--"></form:option>
                                                <form:options items="${district}"></form:options>
                                            </form:select>

                                        </div>
                                        <div
                                                class="col-xs-5">
                                            <label>Phường</label>
                                            <form:input path="ward" cssClass="form-control"/>
                                        </div>
                                        <div
                                                class="col-xs-5">
                                            <label>Đường</label>
                                            <form:input path="street" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div
                                        class="form-group">
                                    <div
                                            class="col-xs-12">
                                        <div
                                                class="col-xs-3">
                                            <label
                                                    class="name">Diện
                                                tích
                                                từ</label><br>
                                            <form:input path="rentAreaFrom" cssClass="form-control"/>

                                        </div>
                                        <div
                                                class="col-xs-3">
                                            <label
                                                    class="name">Diện
                                                tích
                                                đến</label><br>
                                            <form:input path="rentAreaTo" cssClass="form-control"/>

                                        </div>
                                        <div
                                                class="col-xs-3">
                                            <label
                                                    class="name">Giá
                                                thuê
                                                từ</label><br>
                                            <form:input path="rentPriceFrom" cssClass="form-control"/>

                                        </div>
                                        <div
                                                class="col-xs-3">
                                            <label
                                                    class="name">Giá
                                                thuê
                                                đến</label><br>
                                            <form:input path="rentPriceTo" cssClass="form-control"/>

                                        </div>
                                    </div>
                                </div>
                                <div
                                        class="form-group">
                                    <div
                                            class="col-xs-12">

                                        <div
                                                class="col-xs-5">
                                            <label>Tên
                                                quản
                                                lý</label>
                                            <form:input path="managerName" cssClass="form-control"/>
                                        </div>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <div class="col-xs-5">
                                                <label>Số
                                                    điện
                                                    thoại
                                                    quản
                                                    lý</label>
                                                <form:input path="managerPhone" cssClass="form-control"/>
                                            </div>
                                        </security:authorize>
                                        <security:authorize access="hasRole('STAFF')">
                                            <div class="col-xs-7">
                                                <label>Số
                                                    điện
                                                    thoại
                                                    quản
                                                    lý</label>
                                                <form:input path="managerPhone" cssClass="form-control"/>
                                            </div>
                                        </security:authorize>
                                        <div class="col-xs-2">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <label class="name">Chọn nhân viên phụ trách</label><br>
                                                <form:select path="staffId" class="form-control">
                                                    <form:option value="" label="--Chọn nhân viên--"></form:option>
                                                    <form:options value="" items="${staffs}"></form:options>
                                                </form:select>
                                            </security:authorize>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-7">
                                        <div class="col-xs-5"
                                             style="display: flex; flex-direction: row; justify-content: space-between">
                                            <form:checkboxes path="typeCode" name="form-field-checkbox" items="${types}"
                                                             cssStyle=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-3">

                                            <button class="btn btn-xs btn-danger" id="btn-Search"><i
                                                    class="ace-icon glyphicon glyphicon-search"></i>Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>

                    </div>
                </div>
                <div class="pull-right">
                    <a href="/admin/building-edit">
                        <button class="btn btn-info btn-white" title="Thêm tòa nhà">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.493 4.493 0 0 0 12.5 8a4.493 4.493 0 0 0-3.59 1.787A.498.498 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.476 4.476 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </a>
                    <button class="btn btn-info btn-white" title="Xóa tòa nhà" onclick="deleteAllBuilding()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-building-fill-dash" viewBox="0 0 16 16" color="red">
                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.493 4.493 0 0 0 12.5 8a4.493 4.493 0 0 0-3.59 1.787A.498.498 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.476 4.476 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div><!-- /.span -->

        <!-- bảng danh sách -->

        <div class="row">
            <div class="col-xs-12" >
                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                           requestURI="${buildingListURL}" partialList="true" sort="external"
                                           size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group' style='margin: 0px; display: flex; justify-content: center'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                headerClass="center select-cell" >
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element" />
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                                <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                                <display:column headerClass="text-left" property="numberOfBasement"
                                                title="Số tầng hầm"/>
                                <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                <display:column headerClass="text-left" property="managerPhone"
                                                title="Số điện thoại"/>
                                <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                                <display:column headerClass="text-left" property="emptyArea" title="Diện tích trống"/>
                                <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                                <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                                <display:column headerClass="text-left" property="rentPrice" title="Giá thuê"/>
                                <display:column headerClass="text-left" property="brokerageFee" title="Phí MG"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                    <button class="btn btn-xs btn-success" title="giao tòa nhà"
                                            onclick="assignmentBuilding(${tableList.id})">
                                        <i class="ace-icon fa fa-list bigger-120"></i>
                                    </button>
                                    <button class="btn btn-xs btn-info">
                                        <a href="/admin/building-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120" title="sửa tòa nhà"></i>
                                        </a>
                                    </button>

                                    <button class="btn btn-xs btn-danger">
                                        <i class="ace-icon fa fa-trash-o bigger-120" title="xóa tòa nhà"
                                           onclick="deleteBuilding(${tableList.id})"></i>
                                    </button>
                                </display:column>
                            </display:table>
                        </div>
                    </div>
                </div>
            </div><!-- /.span -->

        </div>
    </div>
</div><!-- /.main-content -->
<!-- giao tòa nhà -->
<div class="modal fade" id="assignmentBuildingModel" role="dialog">
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
                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAssignmentBuilding">Giao tòa
                    nhà
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>

</div>

<script>

    function deleteAllBuilding() {
        var building = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        deleteBuilding(building);
    }

    function deleteBuilding(building) {
        var data = [];
        if (!Array.isArray(building)) {
            data.push(building);
        }
        else data = building;
        $.ajax({
            url: "${buildingAPI}/",
            type: "DELETE",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                console.log("success");
                alert("xóa thành công");
                window.location.href = "<c:url value='/admin/building-list?message = success'/>";
            },
            error: function (response) {
                console.log("failed");
                console.log(response);
            }
        });
    }


    function assignmentBuilding(buildingID) {
        assignmentModelOpen();
        loadStaff(buildingID)
        $('#buildingId').val(buildingID);

    }

    function assignmentModelOpen() {
        $('#assignmentBuildingModel').modal();
    }

    function loadStaff(buildingId) {
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/" + buildingId + "/staffs",
            dataType: "json",
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="center"><input type="checkbox" value="' + item.staffId + '" id="checkbox_' + item.staffId + '" ' + item.checked + '>' + '</td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.log("success")
            },
            error: function (response) {
                console.log("failed")
                console.log(response);
            }
        })
    }

    $('#btnAssignmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var id = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffId'] = staffs;

        $.ajax({
            url: "${userAPI}/" + id + "/assignment",
            type: "PUT",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                console.log("success")
            },
            error: function (response) {
                console.log("failed")
                console.log(response);
            }
        });
    });

    $('#btn-Search').click(function (e) {
        e.preventDefault();
        $('#listForm').submit();
    });


</script>
</body>
</html>
