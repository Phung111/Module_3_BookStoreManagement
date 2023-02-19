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
<%--<body>--%>
<!-- Start wrapper-->
<div id="wrapper">
  <jsp:include page="/WEB-INF/dashboard/layout/left_bar_and_header_bar.jsp"></jsp:include>
  <!--Start Dashboard Content-->

  <%--      Toast thông báo thành công--%>
  <c:if test="${requestScope.message != null}">
  <script>
    window.onload = ()=>{
      $('.toast').toast({delay: 2000});
      $('.toast').toast('show');
    }
  </script>
  </c:if>

  <div class="toast" data-autohide="true" style="position: fixed; top: 0; right: 0">
    <div class="toast-header">
      <strong class="mr-auto text-primary">Toast Header</strong>
      <small class="text-muted">5 mins ago</small>
      <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
    <div class="toast-body">
      Sửa thông tin sách thành công
    </div>
  </div>
  <%--     End Toast thông báo thành công--%>

  <%--Thông báo lỗi khi nhập--%>
  <c:if test="${requestScope.errors!=null && requestScope.errors.size()!=0}">
  <div class="alert alert-danger" style="height: 100px; width: 100%">
    <ul>
      <c:forEach var="e" items="${requestScope.errors}">
        <li>${e}</li>
      </c:forEach>
    </ul>
  </div>
  </c:if>
  <%--End Thông báo lỗi khi nhập--%>
  <%--  Form Create --%>
  <form method="post" enctype="multipart/form-data">
    <div class="row mt-3">
      <div class="col-lg-5">
        <%--            phần về image--%>
        <div class="form-group">
          <div class="avatar-customer ">
            <img class="form-control-rounded" id="idImage" src="images/${requestScope.book.getImage()}" alt="" style="width: 100%;height: auto">
          </div>
          <br>
        </div>
        <%--         end phần về image--%>
      </div>
      <div class="col-lg-7" >
        <div class="card">
          <div class="card-body">
            <div class="card-title">Xem chi tiết thông tin sách</div>
            <%--          Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType)--%>
            <div class="form-group">
              <label>Tên sách</label>
              <p class="form-control form-control-rounded">${requestScope.book.getName()}</p>
            </div>
            <div class="form-group">
              <label>Tác giả</label>
              <p class="form-control form-control-rounded">${requestScope.book.getAuthor()}</p>
            </div>
            <div class="form-group">
              <label>Giá</label>
              <p class="form-control form-control-rounded"><fmt:formatNumber type="number" maxFractionDigits = "3" value="${requestScope.book.getPrice()}" /> đ</p>
            </div>
            <div class="form-group">
              <label>Số lượng có sẵn</label>
              <p class="form-control form-control-rounded">${requestScope.book.getAvaiable()}</p>
            </div>
            <div class="form-group">
              <label>Tổng số lương</label>
              <p class="form-control form-control-rounded">${requestScope.book.getQuantity()}</p>
            </div>
            <div class="form-group">
              <label>Ngày thêm</label>
              <p class="form-control form-control-rounded"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${requestScope.book.getDateAdd()}"/></p>
            </div>
            <div class="form-group">
              <label>Đánh giá</label>
              <p class="form-control form-control-rounded">
                  <c:forEach items="${requestScope.bookTypes}" var="bt">
                    <c:if test="${bt.getId() == requestScope.book.getIdBookType()}">
                      ${bt.getName()}
                    </c:if>
                  </c:forEach>
              </p>
            </div>
            <div class="form-group">
              <a href="/books" class="btn btn-light btn-round px-5">Trở lại danh sách light novel</a>
              <a href="/cart?action=add&id=${requestScope.book.getId()}" class="btn btn-light btn-round px-5">Thêm vào giỏ hàng</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
  <!--End Dashboard Content-->

  <jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
    <jsp:param name="page" value="customer"/>
  </jsp:include>

  <%-- My script--%>
</body>
</html>
