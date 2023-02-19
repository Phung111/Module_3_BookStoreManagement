<%@ page import="model.Customer" %>
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
      Sửa thông tin khách hàng thành công
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

  <div class="row mt-3">
    <div class="col-lg-6" >
      <div class="card">
        <div class="card-body">
          <div class="card-title">Chi tiết khách hàng</div>
          <%--                        Customer(long id, String image, String name, String email, String password, String address, Date createdAt, long idType)--%>
          <hr>
          <form method="post" enctype="multipart/form-data">
            <%--            <form method="post">--%>
            <%--      phần về image--%>
            <div class="form-group">
              <div class="avatar-customer " style="display: flex; top: 72px">
                <img class="form-control-rounded" id="idImage" src="/images/${requestScope.customer.getImage()}" alt="" style="width: 200px;height: auto">
              </div>
              <br>
              <div class="row mt-2">
                <input style="padding-left: 0" class="" id="imgInput" type="file" name="image">
              </div>

            </div>
            <%--   end phần về image--%>
            <div class="form-group">
              <label>Tên</label>
              <p class="form-control form-control-rounded">${requestScope.customer.getName()}</p>
            </div>
            <div class="form-group">
              <label>Email</label>
              <p class="form-control form-control-rounded">${requestScope.customer.getEmail()}</p>
            </div>
            <div class="form-group">
              <label>Mật khẩu</label>
              <p class="form-control form-control-rounded">${requestScope.customer.getPassword()}</p>
            </div>
            <div class="form-group">
              <label>Địa chỉ</label>
              <p class="form-control form-control-rounded">${requestScope.customer.getAddress()}</p>
            </div>
            <div class="form-group">
              <label>Ngày</label><br>
              <p class="form-control form-control-rounded"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${requestScope.customer.getCreatedAt()}"/></p>
            </div>
            <div class="form-group">
              <label>Loại khách hàng</label><br>
              <p class="form-control form-control-rounded">
                <c:forEach items="${requestScope.customerTypes}" var="ct">
                  <c:if test="${ct.getId() == requestScope.customer.getIdType()}">
                    ${ct.getName()}
                  </c:if>
                </c:forEach>
              </p>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-light btn-round px-5">Xác nhận</button>
              <a href="/customers" class="btn btn-light btn-round px-5">Huỷ</a>
            </div>
          </form>
          <%--            script của image--%>

        </div>
      </div>
    </div>
    <%--      <div class="avatar-customer col-lg-6" style="display: flex; top: 72px">--%>
    <%--        <img id="noavatar-customer" class="form-control-rounded" src="/assets/images/noavatar.jpg" alt="" style="width: 200px;height: 200px">--%>
    <%--      </div>--%>


  </div>
  <%-- End Form Create --%>

  <!--End Dashboard Content-->

  <jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
    <jsp:param name="page" value="customer"/>
  </jsp:include>

  <%-- My script--%>
  <script>
    let imgInput = document.getElementById("imgInput");
    let idImage = document.getElementById("idImage");
    imgInput.onchange = evt => {
      const [file] = imgInput.files
      if (file) {
        idImage.src = URL.createObjectURL(file)
      }
    }
    window.onload = ()=>{
      <% String s = ((Customer) request.getAttribute("customer")).getImage();
          System.out.println(s);
      %>
      let fileName ="<%= s %>";
      console.log("File name: " + fileName)
      let url = "http://localhost:8080/images/" + fileName;
      loadURLToInputFiled(url, fileName);
      document.getElementById("idImage").src = url;
    }
    function loadURLToInputFiled(url, fileName){
      getImgURL(url, (imgBlob)=>{
        // Load img blob to input
        // WIP: UTF8 character error
        let file = new File([imgBlob], fileName,{type:"image/jpeg", lastModified:new Date().getTime()}, 'utf-8');
        let container = new DataTransfer();
        container.items.add(file);
        document.querySelector('#imgInput').files = container.files;

      })
    }
    // xmlHTTP return blob respond
    function getImgURL(url, callback){
      var xhr = new XMLHttpRequest();
      xhr.onload = function() {
        callback(xhr.response);
      };
      xhr.open('GET', url);
      xhr.responseType = 'blob';
      xhr.send();
    }
  </script>
</body>
</html>
