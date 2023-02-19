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

  <div class="loader-wrapper"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div>
  <div class="card card-authentication1 mx-auto my-5">
    <div class="card-body">
      <div class="card-content p-2">
        <div class="text-center">
          <img src="assets/images/pngegg.png" alt="logo icon" style="width: 75px">
        </div>
        <div class="card-title text-uppercase text-center py-3">HTTP Status 403 – forbidden</div>

        <div class="text-center mt-3">Bạn không đủ quyền để truy cập trang web hoặc thực hiện hành động này</div>
        <br>

        <a href="/"><button type="button" class="btn btn-light btn-block">Quay lại trang chủ</button></a>
      </div>
    </div>
  </div>

</div><!--wrapper-->

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

