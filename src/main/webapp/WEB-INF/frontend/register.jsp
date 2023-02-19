<%@ page import="model.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/dashboard/layout/meta_head.jsp"></jsp:include>
</head>

<body class="bg-theme bg-theme1">

<!-- start loader -->
<div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
<!-- end loader -->

<!-- Start wrapper-->
<div id="wrapper">

    <div class="card card-authentication1 mx-auto my-4" style="width: 1000px; align-items: center">
        <div class="card-body" style="width: 100%">
            <div class="card-content p-2">
                <div class="text-center">
                    <img src="assets/images/pngegg.png" alt="logo icon" style="width: 75px">
                </div>
                <div class="card-title text-uppercase text-center py-3">Sign Up</div>
                <form method="post" enctype="multipart/form-data">
                    <div class="row mt-3">
                        <div class="col-lg-3">
                            <%--            phần về image--%>
                            <div class="form-group">
                                <div class="avatar-customer ">
                                    <img class="form-control-rounded" id="idImage" src="/assets/images/noavatar.jpg" alt="" style="width: 200px;height: auto">
                                </div>
                                <br>
                                <div class="row mt-2">
                                    <input style="padding-left: 0" class="" id="imgInput" type="file" name="image" value="${requestScope.customer.getImage()}">
                                </div>
                            </div>
                            <%--         end phần về image--%>
                        </div>
                        <div class="col-lg-9" >
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title">Đăng ký tài khoản</div>
                                    <div class="form-group">
                                        <label for="input-6">Tên</label>
                                        <input type="text" class="form-control form-control-rounded" id="input-6" placeholder="Nhập tên"
                                               name="name"
                                               value="${requestScope.customer.getName()}">
                                    </div>
                                    <div class="form-group">
                                        <label for="input-7">Email</label>
                                        <input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Nhập email"
                                               name="email"
                                               value="${requestScope.customer.getEmail()}">
                                    </div>
                                    <div class="form-group">
                                        <label for="input-8">Mật khẩu</label>
                                        <input type="text" class="form-control form-control-rounded" id="input-8" placeholder="Nhập mật khẩu"
                                               name="password"
                                               value="${requestScope.customer.getPassword()}">
                                    </div>
                                    <div class="form-group">
                                        <label for="input-9">Địa chỉ</label>
                                        <input type="text" class="form-control form-control-rounded" id="input-9" placeholder="Nhập địa chỉ"
                                               name="address"
                                               value="${requestScope.customer.getAddress()}">
                                    </div>
                                    <div class="form-group">
                                        <label for="input-10">Ngày</label><br>
                                        <input id="input-10" class="col-9 form-control form-control-rounded" type="date" name="createdAt"
<%--                                               value='<fmt:formatDate pattern = "yyyy-MM-dd"--%>
<%--                                       value = "${requestScope.customer.getCreatedAt()}" />'--%>
                                        <c:choose>
                                        <c:when test="${requestScope.customer.getCreatedAt() == null}">value=""</c:when>
                                        <c:otherwise>value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${requestScope.customer.getCreatedAt()}" />'</c:otherwise>
                                        </c:choose>
                                        >
                                    </div>
                                    <div class="form-group">
                                        <label for="input-11">Loại khách hàng</label><br>
                                        <select class="form-control form-control-rounded" id="input-11" name="idType">
                                            <c:forEach items="${requestScope.customerTypes}" var="ct">
                                                <option <c:if test="${ct.getId() == requestScope.customer.getIdType()}"> selected</c:if> value="${ct.getId()}">${ct.getName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-light btn-round px-5">Xác nhận</button>
                                        <a href="/login?action=register" class="btn btn-light btn-round px-5">Huỷ</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="loader-wrapper" style="">
                <%--Thông báo lỗi khi nhập--%>
                <c:if test="${requestScope.errors!=null && requestScope.errors.size()!=0}">
                    <div class="alert alert-danger" style="height: auto; width: 100%;padding: 25px 10px;bottom: 40px;top: 5px; background-color: rgb(241,155,155);color: #933a3f">
                        <ul>
                            <c:forEach var="e" items="${requestScope.errors}">
                                <li>${e}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <%--End Thông báo lỗi khi nhập--%>
            </div>
        </div>
        <div class="card-footer text-center py-3">
            <p class="text-warning mb-0">Already have an account? <a href="/login"> Sign In here</a></p>
        </div>
    </div>


</div><!--wrapper-->

<script>
    <%--            script của image--%>
    let imgInput = document.getElementById("imgInput");
    let idImage = document.getElementById("idImage");
    imgInput.onchange = evt => {
        const [file] = imgInput.files
        if (file) {
            idImage.src = URL.createObjectURL(file)
        }
    }
    <%--         end script của image--%>
</script>

<!-- Bootstrap core JavaScript-->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- simplebar js -->
<script src="/assets/plugins/simplebar/js/simplebar.js"></script>
<!-- sidebar-menu js -->
<script src="/assets/js/sidebar-menu.js"></script>
<!-- loader scripts -->
<script src="/assets/js/jquery.loading-indicator.js"></script>
<!-- Custom scripts -->
<script src="/assets/js/app-script.js"></script>
<!-- Chart js -->

<script src="/assets/plugins/Chart.js/Chart.min.js"></script>

<!-- Index js -->
<script src="/assets/js/index.js"></script>
<%--Scripte toast thêm thành công--%>
<script src="/assets\libs\toastr\toastr.min.js"></script>
<script src="/assets\libs\toastr\toastr.init.js"></script>

</body>
</html>
