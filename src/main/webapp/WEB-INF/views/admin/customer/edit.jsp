<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="customerEditURL" value="/admin/customer-edit"/>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Chỉnh sủa người dùng</title>
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
            <div class="ace-settings-container"
                 id="ace-settings-container">
                <div class="ace-settings-box clearfix"
                     id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div
                                class="ace-settings-item">
                            <div
                                    class="pull-left">
                                <select id="skin-colorpicker"
                                        class="hide">
                                    <option data-skin="no-skin"
                                            value="#438EB9">
                                        #438EB9
                                    </option>
                                    <option data-skin="skin-1"
                                            value="#222A2D">
                                        #222A2D
                                    </option>
                                    <option data-skin="skin-2"
                                            value="#C6487E">
                                        #C6487E
                                    </option>
                                    <option data-skin="skin-3"
                                            value="#D0D0D0">
                                        #D0D0D0
                                    </option>
                                </select>
                            </div>
                            <span>&nbsp; Choose
										Skin</span>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-navbar"/>
                            <label class="lbl"
                                   for="ace-settings-navbar">
                                Fixed
                                Navbar</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-sidebar"/>
                            <label class="lbl"
                                   for="ace-settings-sidebar">
                                Fixed
                                Sidebar</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-breadcrumbs"/>
                            <label class="lbl"
                                   for="ace-settings-breadcrumbs">
                                Fixed
                                Breadcrumbs</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-rtl"/>
                            <label class="lbl"
                                   for="ace-settings-rtl">
                                Right
                                To
                                Left
                                (rtl)</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-add-container"/>
                            <label class="lbl"
                                   for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-hover"/>
                            <label class="lbl"
                                   for="ace-settings-hover">
                                Submenu
                                on
                                Hover</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-compact"/>
                            <label class="lbl"
                                   for="ace-settings-compact">
                                Compact
                                Sidebar</label>
                        </div>

                        <div
                                class="ace-settings-item">
                            <input type="checkbox"
                                   class="ace ace-checkbox-2"
                                   id="ace-settings-highlight"/>
                            <label class="lbl"
                                   for="ace-settings-highlight">
                                Alt.
                                Active
                                Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="page-header">
                <h1>
                    Dashboard
                    <small>
                        <i
                                class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->


        </div><!-- /.page-content -->
        <form:form modelAttribute="customerEdits" action="${customerEditURL}" id="listForm" method="GET">
            <div class="row" style="font-family: 'Times New Roman', Times, serif; font-size: 16px;">
                <form class="" id="form-edit">
                    <div class="col-xs-12">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tên
                                khách hàng</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="fullName" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Số điện thoại</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="phone" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;font-size: 20px;">Email</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="email" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tên công ty</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="companyName" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Nhu cầu</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="demand" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tình trạng</label>

                        </div>
                        <div class="col-sm-10">
                            <form:select path="status" class="form-control">
                                <form:option value="" label="--Chọn tình trạng--"></form:option>
                                <form:options value="" items="${statusType}"></form:options>
                            </form:select>
                        </div>
                    </div>
                    <input type="hidden" id="createdate" name="createdate" value="${customerEdits.createdDate}">
                    <input type="hidden" id="createby" name="createby" value="${customerEdits.createdBy}">
                </form>
            </div>
            <div class="form-group">
                <div class="col-xs-12" style="margin: 5px 0px">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-xs-5"
                         style="margin: 5px 0px; padding: 0px">
                        <c:if test="${not empty customerEdits.id}">
                            <button class="btn btn-primary"
                                    id="btnAddOrUpdateCustomer"><i
                                    class="ace-icon fa fa-plus-circle align-top bigger-125"></i>Cập nhật thông tin
                            </button>
                            <a href="/admin/customer-list">
                                <button class="btn btn-danger"><i
                                        class="ace-icon fa fa-trash-o align-top bigger-125"></i>Hủy thao tác
                                </button>
                            </a>
                        </c:if>
                        <c:if test="${empty customerEdits.id}">
                            <button type="button" class="btn btn-primary"
                                    id="btnAddOrUpdateCustomer"><i
                                    class="ace-icon fa fa-plus-circle align-top bigger-125"></i>Thêm thông tin
                            </button>
                            <a href="/admin/customer-list">
                                <button class="btn btn-danger"><i
                                        class="ace-icon fa fa-trash-o align-top bigger-125"></i>Hủy thao tác
                                </button>
                            </a>
                        </c:if>
                    </div>
                </div>
                <form:hidden path="id" id="customerId"/>
            </div>
            <c:if test="${not empty customerEdits.id}">
                <c:forEach var="item" items="${transactionType}">
                    <div class="col-xs-12">
                        <div class="col-sm-12">
                            <h3 class="header samller lighter blue">${item.value}</h3>
                            <button type="button" class="btn btn-primary"
                                    onclick="transactionType('${item.key}', ${customerEdits.id})">
                                <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Thêm
                            </button>
                        </div>


                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           id="table"
                                           cellpadding="0">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th class="center">Ngày tạo</th>
                                            <th class="center">Người tạo</th>
                                            <th class="center">Ngày sửa</th>
                                            <th class="center">Người sửa</th>
                                            <th class="center">Chi tiết giao dịch</th>
                                            <th class="center">Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item1" items="${transactionCode}">
                                            <c:if test="${item.key == item1.code}">
                                                <tr>
                                                    <c:if test="${not empty item1.createdBy}">
                                                        <td>${item1.createdDate}</td>
                                                        <td>${item1.createdBy}</td>
                                                        <td>${item1.modifiedDate}</td>
                                                        <td>${item1.modifiedBy}</td>
                                                    </c:if>
                                                    <c:if test="${empty item1.createdBy}">
                                                        <td>${item1.modifiedDate}</td>
                                                        <td>${item1.modifiedBy}</td>
                                                        <td></td>
                                                        <td></td>
                                                    </c:if>

                                                    <td>${item1.note}</td>
                                                    <td>
                                                        <button class="btn btn-xs btn-info"
                                                                onclick="updateTransaction(${item1.id}, '${item1.code}', '${item1.note}', '${item1.modifiedDate}', '${item1.modifiedBy}')">
                                                            <i class="ace-icon fa fa-pencil bigger-120"
                                                               title="sửa thông tin"></i>
                                                        </button>
                                                    </td>
                                                </tr>

                                            </c:if>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>


                    </div>
                </c:forEach>
            </c:if>
        </form:form>
    </div>
</div><!-- /.main-content -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content" id="staffList">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Nhập giao dịch</h4>
            </div>
            <div class="modal-body">
                <div class="form-group has-success">
                    <label for="transactionDetail" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi
                        tiết
                        giao dịch</label>
                    <div class="col-xs-12 col-sm-9" id="center">
                            <span class="block input-icon input-icon-right" id="span">

                            </span>
                    </div>
                </div>
                <input type="hidden" id="customerId" name="customerId" value="">
                <input type="hidden" id="code" name="code" value="">
                <input type="hidden" id="id" name="id" value="">
                <input type="hidden" id="createdDate" name="createdDate" value="">
                <input type="hidden" id="createdBy" name="createdBy" value="">
            </div>
            <div class="modal-footer" id="footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAddTransaction">

                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal" class="close">Đóng</button>
            </div>
        </div>

    </div>

</div>
<script>
    //có thể dùng ajax để cập nhật transaction
    function transactionType(code, customerId) {
        $('#myModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
        var row = 'Thêm giao dịch';
        $('#staffList #footer #btnAddTransaction').html(row);
        var row1 = '<input type="text" id="transactionDetail" class="width-100" >';
        $('#staffList #center #span').html(row1);
    }

    function updateTransaction(id, code, note, date, by) {
        $('#myModal').modal();
        $('#id').val(id);
        $('#code').val(code)
        $('#createdDate').val(date);
        $('#createdBy').val(by);
        var row = 'Thay đổi giao dịch';
        $('#staffList #footer #btnAddTransaction').html(row);
        var row1 = '<input type="text" id="transactionDetail" class="width-100" '+'value = "'+note+'">';
        $('#staffList #center #span').html(row1);
    }

    $('#btnAddTransaction').click(function (e) {
        e.preventDefault();
        var data = {};
        data['id'] = $('#id').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['note'] = $('#transactionDetail').val();
        data['createdDate'] = $('#createdDate').val();
        data['createdBy'] = $('#createdBy').val();
//customerId + code + transactionDetail
        addTransaction(data);

    })

    function addTransaction(data) {
        $.ajax({
            type: "POST",
            url: '${customerAPI}/transaction',
            data: JSON.stringify(data),
            // dataType: "json",
            contentType: "application/json",
            success: function (response) {
                if($('#id').val() == ""){
                    alert("Thêm giao dịch thành công")
                }
                else{
                    alert("Cập nhật giao dịch thành công")
                }
                location.reload();
            },
            error: function (response) {
                if($('#id').val() == ""){
                    alert("Thêm giao dịch thất bại")
                }
                else{
                    alert("Cập nhật giao dịch thất bại")
                }
                console.log(response)
            }
        })
    }

    $('#btnAddOrUpdateCustomer').click(function (e) {
        e.preventDefault();
        var data = {}
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        })
        addAndUpdateCustomer(data);
    })

    function addAndUpdateCustomer(data) {
        if ($("#customerId").val() != "") {
            var customerId = $("#customerId").val();
            data['id'] = customerId;
        }
        data['createdDate'] = $("input[name = 'createdate']").val();
        data['createdBy'] = $("input[name = 'createby']").val();
        $.ajax({
            url: "${customerAPI}",
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                if ($("#customerId").val() == "") {
                    alert("thêm thành công");
                    window.location.href = "<c:url value='/admin/customer-list?message = success'/>";
                }
                else {
                    alert("cập nhật thành công");
                    window.location.href = "<c:url value='/admin/customer-list?message = success'/>";
                }

            },
            error: function (response) {
                if (customerId == "") {
                    console.log("failed")
                    alert("Thêm không thành công");
                }
                else {
                    alert("cập nhật không thành công");
                }
                console.log(response);
            }
        })

    }


</script>
</body>
</html>