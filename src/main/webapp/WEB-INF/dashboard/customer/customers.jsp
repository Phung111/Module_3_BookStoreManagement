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
                            'Xoá khách hàng thành công.',
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
            <%-- End Toast thông báo xoá thành công           --%>
            <%-- Bảng danh sách khách hàng       --%>
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush table-borderless">
                                <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Ảnh đại diện</th>
                                    <th>Email</th>
                                    <th>Địa chỉ</th>
                                    <th>Loại khách hàng</th>
                                    <th style="text-align: center">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope['customers']}" var="c">
                                    <tr>
                                        <td><a href="/customers?action=view&id=${c.getId()}">${c.getName()}</a></td>
                                        <td><a href="/customers?action=view&id=${c.getId()}"><img src="/images/${c.getImage()}" style="width: 75px; height: auto;border-radius: 20px "></a>
                                        <td><a href="">${c.getEmail()}</a></td>
                                        <td><a href="">${c.getAddress()}</a></td>
                                        <td>
                                            <c:forEach var="cType" items="${requestScope.customerTypes}">
                                                <c:if test="${cType.getId()==c.getIdType()}">
                                                    ${cType.getName()}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td style="text-align: center">
                                            <a href="/customers?action=edit&id=${c.getId()}"><i class="fa-regular fa-pen-to-square"></i></a>
                                            <a onclick="handleDeleteClick(${c.getId()},'${c.getName()}')"><i class="fa-regular fa-trash-can" ></i></a>
                                        </td>
                                        <td><div class="progress shadow" style="height: 3px;">
                                            <div class="progress-bar" role="progressbar" style="width: 90%"></div>
                                        </div></td>
                                    </tr>
                                </c:forEach>
                                </tbody></table>
                            <form id="frmDelete" method="post" action="/customers?action=delete">
                                <input type="hidden" name="idDelete" value="" id="idDelete">
                            </form>


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
    function handleDeleteClick(idCustomer, name) {
        document.getElementById("idDelete").value = idCustomer;
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
