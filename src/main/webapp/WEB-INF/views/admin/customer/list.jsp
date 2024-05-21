<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="margin" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>

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
                        <%--Quản lý khách hàng--%>
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
                        <form:form modelAttribute="modelSearch" action="${customerListURL}" id="listForm" method="GET">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-sm-4">
                                            <label>Tên Khách Hàng</label>
                                            <form:input path="fullName" cssClass="form-control"/>
                                        </div>
                                        <div class="col-sm-4">
                                            <label>Số Điện Thoại</label>
                                            <form:input path="phone" cssClass="form-control"/>
                                        </div>
                                        <div class="col-sm-4">
                                            <label>Email</label>
                                            <form:input path="email" cssClass="form-control"/>
                                        </div>
                                    </div>
                                </div>

                                <div
                                        class="form-group">
                                    <div
                                            class="col-xs-12">

                                        <div class="col-xs-4">
                                            <security:authorize access="hasRole('MANAGER')">
                                                <label class="name">Chọn nhân viên</label><br>
                                                <form:select path="staffId" class="form-control">
                                                    <form:option value="" label="--Chọn nhân viên--"></form:option>
                                                    <form:options value="" items="${staffs}"></form:options>
                                                </form:select>
                                            </security:authorize>

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
                       <a href="/admin/customer-edit">
                           <button class="btn btn-info btn-white" title="Thêm khách hàng">
                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
                                   <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                   <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                               </svg>
                           </button>
                       </a>
                       <button class="btn btn-info btn-white" title="Xóa khách hàng" onclick="deleteAllBuilding()">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-dash" viewBox="0 0 16 16" color="red">
                               <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                               <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                           </svg>
                       </button>
                   </div>
            </div>
        </div><!-- /.span -->

        <!-- bảng danh sách -->

        <div class="row">
            <div class="col-xs-12" style="margin: 30px 12px 0px">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="table-responsive">
                            <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                           requestURI="${customerListURL}" partialList="true" sort="external"
                                           size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group' style='margin: 0px; display: flex; justify-content: center'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell" headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element" />
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                                <display:column headerClass="text-left" property="phone" title="Di động"/>
                                <display:column headerClass="text-left" property="email" title="Email"/>
                                <display:column headerClass="text-left" property="demand" title="Yêu cầu"/>
                                <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                                <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                                <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                   <security:authorize access="hasRole('MANAGER')">
                                       <button class="btn btn-xs btn-success" title="giao tòa nhà"
                                               onclick="assignmentCustomer(${tableList.id})">
                                           <i class="ace-icon fa fa-list bigger-120"></i>
                                       </button>
                                   </security:authorize>
                                    <button class="btn btn-xs btn-info">
                                        <a href="/admin/customer-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120" title="sửa thông tin"></i>
                                        </a>
                                    </button>
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger">
                                            <i class="ace-icon fa fa-trash-o bigger-120" title="xóa tòa nhà"
                                               onclick="deleteBuilding(${tableList.id})"></i>
                                        </button>
                                    </security:authorize>
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
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAssignmentCustomer">Giao tòa
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
            url: "${customerAPI}/",
            type: "DELETE",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (response) {
                console.log("success");
                alert("xóa thành công");
                window.location.href = "<c:url value='/admin/customer-list?message = success'/>";
            },
            error: function (response) {
                console.log("failed");
                alert("xóa không thành công");
                console.log(response);
            }
        });
    }


    function assignmentCustomer(customerID) {
        assignmentModelOpen();
        loadStaff(customerID)
        $('#customerId').val(customerID);

    }

    function assignmentModelOpen() {
        $('#assignmentBuildingModel').modal();
    }

    function loadStaff(customerId) {
        $.ajax({
            type: "GET",
            url: "${customerAPI}/" + customerId + "/staffs",
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

    $('#btnAssignmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var id = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffId'] = staffs;

        $.ajax({
            url: "${customerAPI}/" + id + "/assignment",
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
