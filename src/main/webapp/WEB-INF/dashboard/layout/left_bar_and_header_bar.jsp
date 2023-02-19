<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--Start sidebar-wrapper-->
<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
  <div class="brand-logo">
    <a href="/">
      <img src="assets/images/pngegg.png" class="logo-icon" alt="logo icon">
      <h5 class="logo-text">MEN'S BOOKSTORE</h5>
    </a>
  </div>
  <ul class="sidebar-menu do-nicescrol">
    <li class="sidebar-header">MAIN NAVIGATION</li>

    <li>
      <a href="/">
        <i class="fa-solid fa-house"></i><span>Trang chủ</span>
      </a>
    </li>

    <li>
      <a href="/cart">
        <i class="fa-solid fa-cart-shopping"></i><span>Giỏ hàng</span>
      </a>
    </li>

    <li>
      <a href="/cart?action=checkout">
        <i class="fa-solid fa-thumbs-up"></i><span>Thanh toán</span>
      </a>
    </li>
<c:if test="${requestScope.customerLogin.getIdType() != 3 && requestScope.customerLogin != null}">
    <li>
      <a href="/books">
        <i class="fa-solid fa-book"></i><span>Danh sách Light Novel</span>
      </a>
    </li>

    <li>
      <a href="/books?action=create">
        <i class="fa-solid fa-plus"></i> <span>Thêm sách mới</span>
      </a>
    </li>

    <li>
      <a href="/customers">
        <i class="fa-solid fa-users"></i> <span>Danh sách khách hàng</span>
      </a>
    </li>

    <li>
      <a href="/customers?action=create">
        <i class="fa-solid fa-plus"></i> <span>Thêm khách hàng mới </span>
      </a>
    </li>
  </ul>
</c:if>

</div>
<!--End sidebar-wrapper-->

<!--Start topbar header-->
<header class="topbar-nav">
  <nav class="navbar navbar-expand fixed-top">
    <ul class="navbar-nav mr-auto align-items-center">
      <li class="nav-item">
        <a class="nav-link toggle-menu" href="javascript:void();">
          <i class="icon-menu menu-icon"></i>
        </a>
      </li>
      <li class="nav-item">
        <form method="get" action="/books" id="search-form" class="search-bar" style="display: flex">
          <select name="bt" class="form-control" style="height: 34px; width: 125px; display: inline-block" >
            <option value="-1">ALL</option>
            <c:forEach items="${requestScope.bookTypes}" var="bType">
              <option
                      <c:if test="${requestScope.bt == bType.getId()}">selected</c:if>
                      value="${bType.getId()}">${bType.getName()}</option>
            </c:forEach>
          </select>
          <input type="text" class="form-control" placeholder="Enter keywords" value="${requestScope.kw}" name="kw" style="width: 300px">
          <a href="javascript:{}" onclick="document.getElementById('search-form').submit();"><i class="icon-magnifier"></i></a>
        </form>
      </li>
    </ul>

    <ul class="navbar-nav align-items-center right-nav-link">
      <li class="nav-item">
        <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
          <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
<%--          <span class="user-profile"><img src="/images/${requestScope.customer.getImage()}" class="img-circle" alt="user avatar"></span>--%>
        </a>
        <ul class="dropdown-menu dropdown-menu-right">
          <li class="dropdown-item user-details">
              <div class="media">
                <div class="avatar"><img class="align-self-start mr-3" src="https://via.placeholder.com/110x110" alt="user avatar"></div>
                <div class="media-body">
                <h6 class="mt-2 user-title">${requestScope.customerLogin.getName()}</h6>
                  <p class="user-subtitle">${requestScope.customerLogin.getEmail()}</p>
                </div>
              </div>
          </li>
          <c:choose>
            <c:when test="${requestScope.customerLogin == null}">
              <li class="dropdown-divider"></li>
              <a href="/login"><li class="dropdown-item"><i class="icon-power mr-2"></i>Đăng nhập</li></a>
            </c:when>
            <c:otherwise>
              <li class="dropdown-divider"></li>
              <a href="/customers?action=view&id=${requestScope.customerLogin.getId()}"><li class="dropdown-item"><i class="icon-wallet mr-2"></i>Tài khoản</li></a>
              <li class="dropdown-divider"></li>
              <a href="/login?action=logout"><li class="dropdown-item"><i class="icon-power mr-2"></i>Đăng xuất</li></a>
            </c:otherwise>
          </c:choose>
          <c:if test="${requestScope.customerLogin.getIdType() != 3 && requestScope.customerLogin != null}">
          </c:if>
        </ul>
      </li>
    </ul>
  </nav>
</header>
<jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp">
  <jsp:param name="page" value="customer"/>
</jsp:include>
<!--End topbar header-->

<div class="clearfix"></div>

<div class="content-wrapper">
  <div class="container-fluid">