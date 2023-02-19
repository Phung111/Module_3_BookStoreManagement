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
          <div class="row mt-2">
            <input style="padding-left: 0" class="" id="imgInput" type="file" name="image">
          </div>
        </div>
        <%--         end phần về image--%>
      </div>
      <div class="col-lg-7" >
        <div class="card">
          <div class="card-body">
            <div class="card-title">Sửa thông tin sách</div>
            <%--          Book(long id, String image, String name, String author, long price, long avaiable, long quantity, Date dateAdd, long idBookType)--%>
            <div class="form-group">
              <label for="input-6">Tên sách</label>
              <input type="text" class="form-control form-control-rounded" id="input-6" placeholder="Nhập tên"
                     name="name"
                     value="${requestScope.book.getName()}">
            </div>
            <div class="form-group">
              <label for="input-7">Tác giả</label>
              <input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Nhập tác giả"
                     name="author"
                     value="${requestScope.book.getAuthor()}">
            </div>
            <div class="form-group">
              <label for="input-8">Giá</label>
              <input type="number" class="form-control form-control-rounded" id="input-8" placeholder="Nhập giá"
                     name="price"
                     value="${requestScope.book.getPrice()}">
            </div>
            <div class="form-group">
              <label for="input-9">Số lượng có sẵn</label>
              <input type="number" class="form-control form-control-rounded" id="input-9" placeholder="Nhập số lượng có sẵn"
                     name="avaiable"
                     value="${requestScope.book.getAvaiable()}">
            </div>
            <div class="form-group">
              <label for="input-10">Tổng số lượng</label>
              <input type="number" class="form-control form-control-rounded" id="input-10" placeholder="Nhập số lượng có sẵn"
                     name="quantity"
                     value="${requestScope.book.getQuantity()}">
            </div>
            <div class="form-group">
              <label for="input-11">Ngày thêm</label><br>
              <input id="input-11" class="col-9 form-control form-control-rounded" type="date"
                     name="dateAdd" value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${requestScope.book.getDateAdd()}" />'>
            </div>
            <div class="form-group">
              <label for="input-12">Đánh giá</label><br>
              <select class="form-control form-control-rounded" id="input-12"
                      name="idBookType">
                <c:forEach items="${requestScope.bookTypes}" var="bt">
                  <option <c:if test="${bt.getId() == requestScope.book.getIdBookType()}"> selected</c:if> value="${bt.getId()}">${bt.getName()}</option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-light btn-round px-5">Xác nhận</button>
              <a href="/books" class="btn btn-light btn-round px-5">Huỷ</a>
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
        <% String s = ((Book) request.getAttribute("book")).getImage();
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
