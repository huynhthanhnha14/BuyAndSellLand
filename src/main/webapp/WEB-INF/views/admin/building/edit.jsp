<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="buildingEditURL" value="/admin/building-edit"/>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Chỉnh sủa tòa nhà</title>
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
        <form:form modelAttribute="buildingEdit" action="${buildingEditURL}" id="listForm" method="GET">
            <div class="row" style="font-family: 'Times New Roman', Times, serif; font-size: 16px;">
                <form class="" id="form-edit">
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tên
                                tòa
                                nhà</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="name" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Quận</label>

                        </div>
                        <div class="col-sm-10">
                            <form:select path="district" class="form-control">
                                <form:option value="" label="--Chọn Quận--"></form:option>
                                <form:options items="${district}"></form:options>
                            </form:select>
                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;font-size: 20px;">Phường</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="ward" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Đường</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="street" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Kết
                                cấu</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="structure" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Số
                                tầng
                                hầm</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="numberOfBasement" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Diện
                                tích
                                sàn</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="floorArea" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Hướng</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="direction" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Hạng</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="level" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Diện
                                tích
                                thuê</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="rentAreas" cssClass="form-control" value="${listRentArea}"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Giá
                                thuê</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="rentPrice" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Mô
                                tả
                                giá</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="rentPriceDescription" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Phí
                                dịch
                                vụ</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="serviceFee" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Phí
                                ô tô</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="carFee" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Phí
                                mô
                                tô</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="motoFee" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Phí
                                ngoài
                                giờ</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="overTimeFee" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tiền
                                điện</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="electricityFee" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Đặt
                                cọc</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="deposit" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Thanh
                                toán</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="payment" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Thời
                                hạn
                                thuê</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="rentTime" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Thời
                                gian trang
                                trí</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="decorationTime" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px;">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Tên
                                quản
                                lý</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="managerName" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">SĐT
                                quản
                                lý</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="managerPhone" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Phí
                                môi
                                giới</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="brokerageFee" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px" id="type">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Loại
                                tòa
                                nhà</label>

                        </div>
                        <div class="col-xs-5"
                             style="display: flex; flex-direction: row; justify-content: space-between" id="typeCode" name="checkList">
                            <c:if test="${empty buildingEdit.id}">
                                <form:checkboxes path="typeCode" name="form-field-checkbox" items="${types}" cssStyle=""/>
                            </c:if>
                        </div>

                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Ghi
                                chú</label>

                        </div>
                        <div class="col-sm-10">
                            <form:input path="note" cssClass="form-control"/>

                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2">
                            <label for="form-field-8"
                                   style="margin-bottom: 0px;font-size: 20px;">Hình
                                đại
                                diện</label>

                        </div>
                        <div class="col-sm-10">
                            <%--<input type="file"--%>
                                   <%--class="form-control"--%>
                                   <%--id="form-field-8">--%>
                                <form:input path="image" type="file" name="upload" id="upload" accept="image/png, image/jpeg" onchange="ImagesFileAsUrl()"  />
                        </div>
                    </div>
                    <div class="col-xs-12" style="margin: 5px 0px">
                        <div class="col-sm-2"> </div>
                        <div class="col-sm-10">
                            <div id="displayImg"></div>
                        </div>
                    </div>
                </form>

            </div>

            <div class="form-group">
                <div class="col-xs-12" style="margin: 5px 0px">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-xs-5"
                         style="margin: 5px 0px; padding: 0px">
                        <c:if test="${not empty buildingEdit.id}">
                            <button class="btn btn-primary"
                                    id="btnAddOrUpdateBuilding"><i
                                    class="ace-icon fa fa-plus-circle align-top bigger-125"></i>Cập nhật tòa nhà
                            </button>
                            <a href="/admin/building-list"><button class="btn btn-danger"><i
                                    class="ace-icon fa fa-trash-o align-top bigger-125"></i>Hủy thao tác
                            </button></a>
                        </c:if>
                        <c:if test="${empty buildingEdit.id}">
                            <button type="button" class="btn btn-primary"
                                    id="btnAddOrUpdateBuilding"><i
                                    class="ace-icon fa fa-plus-circle align-top bigger-125"></i>Thêm tòa nhà
                            </button>
                            <a href="/admin/building-list"><button class="btn btn-danger"><i
                                    class="ace-icon fa fa-trash-o align-top bigger-125"></i>Hủy thao tác
                            </button></a>
                        </c:if>
                    </div>
                </div>
                <form:hidden path="id" id="buildingId"/>
            </div>
        </form:form>
    </div>
</div><!-- /.main-content -->
<script>
    var image = "";
    var imageName = document.getElementById('upload');
    function ImagesFileAsUrl() {
        var fileSelected = document.getElementById('upload').files;
        if(fileSelected.length > 0){
            var fileToLoad = fileSelected[0];
            var fileReader = new FileReader();
            fileReader.onload = function(fileLoaderEvent){
                var srcData = fileLoaderEvent.target.result;
                var newImage = document.createElement('img');
                newImage.src = srcData;
                imageName = newImage;
                image = fileToLoad.name;
                document.getElementById('displayImg').innerHTML = newImage.outerHTML;
                $('img').width(300);
            }
            fileReader.readAsDataURL(fileToLoad);
        }
    }
    window.onload = function loadTypeCode(){
        var data = [];
        var building =  $('#buildingId').val();
        data["building"] = building;
        document.getElementById('displayImg').innerHTML = imageName.outerHTML;
        if(building !== ""){
            $.ajax({
                type: "GET",
                url: "${buildingAPI}/" + building+"/typeCodes",
                success: function (response) {
                    var row = '';
                    $.each(response.data, function(index, item){
                        row += '<span>';
                        row += '<input type="checkbox" name="checktype" value='+item.typeCode+' '+ item.checked + '>';
                        row += '<label>'+item.fullName+'</label>';
                        row += '</span>';
                    });
                    $('#typeCode').html(row);
                    console.log("success")
                },
                error: function (response) {
                    console.log("failed")
                    console.log(response);
                }
            });
        }
    }
    $('#btnAddOrUpdateBuilding').click(function (e) {
        e.preventDefault();

        var data = {};
        var buildingType = [];
        var formData = $('#listForm').serializeArray();
        data['image'] = image;

        $.each(formData, function (index, it) {
            if (it.name != 'typeCode') {
                data["" + it.name + ""] = it.value
            }
            else {
                buildingType.push(it.value);
            }
        });

        var type = "";
        for (var i = 0; i < buildingType.length; i++) {
            type += buildingType[i]+",";
        }
        var checkbox = document.getElementsByName('checktype');

        for (var i = 0; i < checkbox.length; i++){
            if (checkbox[i].checked === true){
                type+=checkbox[i].value + ",";
            }
        }
        type = type.slice(0, -1);
        data['typeCode'] = type;
        // data['imageBase64'] = image;

        if ($("#buildingId").val() != "") {
            var buildingId = $("#buildingId").val();
            if(type.length != 0){
                data['id'] = buildingId;
                updateBuilding(data, buildingId);
                alert("cập nhật thành công");
                window.location.href = "<c:url value='/admin/building-list?message = success'/>";
            }
            else{
                alert("cập nhật không thành công");
                alert("cập nhật vào loại tòa nhà");
                window.location.href = "<c:url value='/admin/building-edit-"+buildingId+"?typeCode= typeCode_require'/>";
            }
        }
        else {
            $.ajax({
                url: "${buildingAPI}",
                type: "POST",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",
                success: function (response) {
                    var formData = new FormData();
                    data["image"] = formData.append('file', $('#fileInput')[0].files[0]);
                    data['district'] = district;
                    if(district.length != 0){
                        alert("thêm thành công");
                        window.location.href = "<c:url value='/admin/building-list?message = success'/>";
                    }
                    else{
                        alert("thêm không thành công");
                    }
                },
                error: function (response) {
                    console.log("failed")
                    alert("Thêm diện tích thuê");
                    console.log(response);
                }
            })
        }

    });
    function updateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/",
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
    }
</script>
</body>
</html>