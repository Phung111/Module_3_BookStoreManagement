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
    <%-- Toast thông báo xoá thành công           --%>
    <c:if test="${requestScope.message == 'delete'}">
    <script>
        window.onload = ()=>{
            Swal.fire(
                'Deleted!',
                'Xoá sách thành công.',
                'success'
            )
        }
    </script>
    </c:if>
    <c:if test="${requestScope.message == 'edit'}">
    <script>
        window.onload = ()=>{
            Swal.fire(
                'Edit!',
                'Thông tin không hợp lệ.',
                'success'
            )
        }
    </script>
    </c:if>
        <c:if test="${requestScope.message == 'editsuccess'}">
        <script>
            window.onload = ()=>{
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-bottom-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear"
                    ,
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr["success"]("Sửa thông tin sách thành công", "Sửa thông tin sách")
            }
        </script>
        </c:if>
    <%-- End Toast thông báo xoá thành công           --%>
    <%-- Bảng danh sách light novel       --%>
    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="card">
                <div class="table-responsive">
                    <table class="table align-items-center table-flush table-borderless">
                        <thead>
                        <tr class="text-center">
<%--                        Book(long id, String image, String name, String author, long price,
                            long avaiable, long quantity, Date dateAdd, long idBookType)--%>
                            <th class="text-center">Ảnh bìa</th>
                            <th>Tên sách</th>
                            <th>Tác giả</th>
                            <th>Giá</th>
                            <th>SL có sẵn</th>
                            <th>Tổng SL</th>
                            <th>Ngày thêm</th>
                            <th>Đánh giá</th>
                            <th style="text-align: center">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope['books']}" var="b">
                            <tr>
                                <td class="text-center">
                                    <a href="/books?action=view&id=${b.getId()}">
                                        <img src="/images/${b.getImage()}" style="width: auto; height: 150px;border-radius: 5px ">
                                    </a>
                                <td class="bookname"><a href="/books?action=view&id=${b.getId()}">${b.getName()}</a></td>
                                <td>${b.getAuthor()}</td>
                                <td><fmt:formatNumber type="number" maxFractionDigits = "3" value="${b.getPrice()}" /> đ</td>
                                <td class="text-center">${b.getAvaiable()}</td>
                                <td class="text-center">${b.getQuantity()}</td>
                                <td><fmt:formatDate pattern = "dd/MM/yyyy" value = "${b.getDateAdd()}"/></td>
                                <td>
                                    <c:forEach var="bType" items="${requestScope.bookTypes}">
                                        <c:if test="${bType.getId()==b.getIdBookType()}">
                                            ${bType.getName()}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td style="text-align: center">
                                    <a href="/books?action=edit&id=${b.getId()}"><i class="fa-regular fa-pen-to-square"></i></a>
                                    <a onclick="handleDeleteClick(${b.getId()},'${b.getName()}')"><i class="fa-regular fa-trash-can" ></i></a>
                                </td>
                                <td><div class="progress shadow" style="height: 3px;">
                                    <div class="progress-bar" role="progressbar" style="width: 90%"></div>
                                </div></td>
                            </tr>
                        </c:forEach>
                        </tbody></table>
                    <form id="frmDelete" method="post" action="/books?action=delete">
                        <input type="hidden" name="idDelete" value="" id="idDelete">
                    </form>

                </div>
                <div style="width: 100%">
                    <div class="row justify-content-end" style="margin-right: 20px">
                        <ul class="pagination pagination-split float-right mb-0">
                            <c:if test="${currentPage != 1}">
                                <li class="page-item">
                                    <a href="/books?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${currentPage-1}" class="page-link"><i class="fa fa-angle-left"></i></a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${currentPage eq i}">
                                        <li class="page-item active">
                                            <a href="/books?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${i}" class="page-link">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a href="/books?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${i}" class="page-link">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${currentPage lt noOfPages}">
                                <li class="page-item">
                                    <a href="/books?kw=${requestScope.kw}&ct=${requestScope.ct}&page=${currentPage+1}" class="page-link"><i class="fa fa-angle-right"></i></a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%-- End Bảng danh sách khách hàng       --%>


    <!--End Dashboard Content-->

    <jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
        <jsp:param name="page" value="customer"/>
    </jsp:include>

    <%-- My script--%>
    <script>
        function handleDeleteClick(idBook, name) {
            document.getElementById("idDelete").value = idBook;
            Swal.fire({
                title: 'Are you sure delete?',
                text: name,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById("frmDelete").submit();
                    // Swal.fire(
                    //     'Deleted!',
                    //     'Your file has been deleted.',
                    //     'success'
                    // )
                }
            })
            return false;
        }
    </script>
</body>
</html>
