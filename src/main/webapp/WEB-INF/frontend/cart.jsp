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
    <%-- Toast          --%>
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
    <%-- End Toast         --%>
    <%-- Bảng danh sách light novel       --%>
    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">GIỎ HÀNG</div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush table-borderless">
                            <thead>
                            <tr class="text-center">
                                <%--                        Book(long id, String image, String name, String author, long price,
                                                            long avaiable, long quantity, Date dateAdd, long idBookType)--%>
                                <th>Xoá</th>
                                <th>Ảnh Bìa</th>
                                <th>Sách</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.orderDTO.getOderItemDTOS()}" var="oderItemDTO">
                                <tr class="text-center">
                                    <td class="book_delete" style="text-align: center">
                                        <a onclick="handleDeleteClick(${oderItemDTO.getBook().getId()},'${oderItemDTO.getBook().getName()}')"><i class="fa-regular fa-trash-can" ></i></a>
                                    </td>
                                    <td class="book_image">
                                        <a>
                                            <img src="/images/${oderItemDTO.getBook().getImage()}" style="width: auto; height: 150px;border-radius: 5px ">
                                        </a>
                                    <td class="book_name">${oderItemDTO.getBook().getName()}</td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits = "3" value="${oderItemDTO.getBook().getPrice()}" /> đ</td>
                                    <td class="book_quantity">
                                        <input min="0" max="100" value="${oderItemDTO.getQuantity()}" type="number" onchange="handleInputchange(${oderItemDTO.getBook().getId()}, this)">
                                    </td>
                                    <td class="book_total">${oderItemDTO.getBook().getPrice()*oderItemDTO.getQuantity()}</td>
                                    <td><div class="progress shadow" style="height: 3px;">
                                        <div class="progress-bar" role="progressbar" style="width: 90%"></div>
                                    </div></td>
                                </tr>
                            </c:forEach>
                            </tbody></table>
                        <%--                    <form id="frmDelete" method="post" action="/books?action=delete">--%>
                        <%--                        <input type="hidden" name="idDelete" value="" id="idDelete">--%>
                        <%--                    </form>--%>

                    </div>
                    <div class="row mt-3">
                        <div class="col-lg-7">
                        </div>
                        <div class="col-lg-5">
                            <div class="form-group">
                                <a href="/cart?action=checkout"><button type="submit" class="btn btn-light btn-round px-5">Thanh toán hoá đơn</button></a>
                                <%--                        <button type="submit" class="btn btn-light btn-round px-5">Thanh toán hoá đơn</button>--%>
                                <a href="/" class="btn btn-light btn-round px-5">Huỷ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <form id="frmCartEdit" action="/cart?action=edit" method="post">
            <input id="txtIdProduct" name="idproduct" value="" type="hidden">
            <input id="txtQuantityProduct" name="quantity" value="" type="hidden">
        </form>
    <form id="frmDelete" method="post" action="/cart?action=delete">
            <input type="hidden" name="idDelete" value="" id="idDelete">
        </form>

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
    <script>
        function handleInputchange(id, element) {
                console.log(id);
                let value = element.value;
                console.log(value)
                document.getElementById("txtIdProduct").value = id;
                document.getElementById("txtQuantityProduct").value = value;

                document.getElementById("frmCartEdit").submit();
            }
    </script>

</body>
</html>
