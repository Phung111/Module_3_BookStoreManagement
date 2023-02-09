<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Customer</title>
    <!-- loader-->
    <link href="/assets/css/pace.min.css" rel="stylesheet"/>
    <script src="/assets/js/pace.min.js"></script>
    <!--favicon-->
    <link rel="icon" href="/assets/images/pngegg.png" type="image/x-icon">
    <!-- Vector CSS -->
    <link href="/assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
    <!-- simplebar CSS-->
    <link href="/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
    <!-- Bootstrap core CSS-->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- animate CSS-->
    <link href="/assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <!-- Icons CSS-->
    <link href="/assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <!-- Sidebar CSS-->
    <link href="/assets/css/sidebar-menu.css" rel="stylesheet"/>
    <!-- Custom Style-->
    <link href="/assets/css/app-style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.1/sweetalert2.css" integrity="sha512-JzSVRb7c802/njMbV97pjo1wuJAE/6v9CvthGTDxiaZij/TFpPQmQPTcdXyUVucsvLtJBT6YwRb5LhVxX3pQHQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.1/sweetalert2.min.js" integrity="sha512-vCI1Ba/Ob39YYPiWruLs4uHSA3QzxgHBcJNfFMRMJr832nT/2FBrwmMGQMwlD6Z/rAIIwZFX8vJJWDj7odXMaw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>

<body class="bg-theme bg-theme1">
<%--<body>--%>

<!-- Start wrapper-->
<div id="wrapper">

    <!--Start sidebar-wrapper-->
    <%--    <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">--%>
    <%--        <div class="brand-logo">--%>
    <%--            <a href="index.html">--%>
    <%--                <img src="assets/images/pngegg.png" class="logo-icon" alt="logo icon">--%>
    <%--                <h5 class="logo-text">MEN'S BOOKSTORE</h5>--%>
    <%--            </a>--%>
    <%--        </div>--%>
    <%--        <ul class="sidebar-menu do-nicescrol">--%>
    <%--            <li class="sidebar-header">MAIN NAVIGATION</li>--%>
    <%--            <li>--%>
    <%--                <a href="index.html">--%>
    <%--                    <i class="zmdi zmdi-view-dashboard"></i> <span>Dashboard</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="icons.html">--%>
    <%--                    <i class="zmdi zmdi-invert-colors"></i> <span>UI Icons</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="forms.html">--%>
    <%--                    <i class="zmdi zmdi-format-list-bulleted"></i> <span>Forms</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="tables.html">--%>
    <%--                    <i class="zmdi zmdi-grid"></i> <span>Tables</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="calendar.html">--%>
    <%--                    <i class="zmdi zmdi-calendar-check"></i> <span>Calendar</span>--%>
    <%--                    <small class="badge float-right badge-light">New</small>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="profile.html">--%>
    <%--                    <i class="zmdi zmdi-face"></i> <span>Profile</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="login.html" target="_blank">--%>
    <%--                    <i class="zmdi zmdi-lock"></i> <span>Login</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li>--%>
    <%--                <a href="register.html" target="_blank">--%>
    <%--                    <i class="zmdi zmdi-account-circle"></i> <span>Registration</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <li class="sidebar-header">LABELS</li>--%>
    <%--            <li><a href=""><i class="zmdi zmdi-coffee text-danger"></i> <span>Important</span></a></li>--%>
    <%--            <li><a href=""><i class="zmdi zmdi-chart-donut text-success"></i> <span>Warning</span></a></li>--%>
    <%--            <li><a href=""><i class="zmdi zmdi-share text-info"></i> <span>Information</span></a></li>--%>

    <%--        </ul>--%>

    <%--    </div>--%>
    <!--End sidebar-wrapper-->

    <!--Start topbar header-->
    <header class="topbar-nav">
        <nav class="navbar navbar-expand fixed-top">
            <ul class="navbar-nav mr-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link toggle-menu" href="">
                        <i class="icon-menu menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <form class="search-bar">
                        <input type="text" class="form-control" placeholder="Enter keywords">
                        <a href="j"><i class="icon-magnifier"></i></a>
                    </form>
                </li>
            </ul>

            <ul class="navbar-nav align-items-center right-nav-link">
                <li class="nav-item dropdown-lg">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="">
                        <i class="fa fa-envelope-open-o"></i></a>
                </li>
                <li class="nav-item dropdown-lg">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="">
                        <i class="fa fa-bell-o"></i></a>
                </li>
                <li class="nav-item language">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href=""><i class="fa fa-flag"></i></a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="dropdown-item"> <i class="flag-icon flag-icon-gb mr-2"></i> English</li>
                        <li class="dropdown-item"> <i class="flag-icon flag-icon-fr mr-2"></i> French</li>
                        <li class="dropdown-item"> <i class="flag-icon flag-icon-cn mr-2"></i> Chinese</li>
                        <li class="dropdown-item"> <i class="flag-icon flag-icon-de mr-2"></i> German</li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
                        <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="dropdown-item user-details">
                            <a href="">
                                <div class="media">
                                    <div class="avatar"><img class="align-self-start mr-3" src="https://via.placeholder.com/110x110" alt="user avatar"></div>
                                    <div class="media-body">
                                        <h6 class="mt-2 user-title">Sarajhon Mccoy</h6>
                                        <p class="user-subtitle">mccoy@example.com</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="dropdown-divider"></li>
                        <li class="dropdown-item"><i class="icon-envelope mr-2"></i> Inbox</li>
                        <li class="dropdown-divider"></li>
                        <li class="dropdown-item"><i class="icon-wallet mr-2"></i> Account</li>
                        <li class="dropdown-divider"></li>
                        <li class="dropdown-item"><i class="icon-settings mr-2"></i> Setting</li>
                        <li class="dropdown-divider"></li>
                        <li class="dropdown-item"><i class="icon-power mr-2"></i> Logout</li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
    <!--End topbar header-->

    <div class="clearfix"></div>

    <div class="content-wrapper">
        <div class="container-fluid">

            <!--Start Dashboard Content-->

            <%--            <div class="card mt-3">--%>
            <%--                <div class="card-content">--%>
            <%--                    <div class="row row-group m-0">--%>
            <%--                        <div class="col-12 col-lg-6 col-xl-3 border-light">--%>
            <%--                            <div class="card-body">--%>
            <%--                                <h5 class="text-white mb-0">9526 <span class="float-right"><i class="fa fa-shopping-cart"></i></span></h5>--%>
            <%--                                <div class="progress my-3" style="height:3px;">--%>
            <%--                                    <div class="progress-bar" style="width:55%"></div>--%>
            <%--                                </div>--%>
            <%--                                <p class="mb-0 text-white small-font">Total Orders <span class="float-right">+4.2% <i class="zmdi zmdi-long-arrow-up"></i></span></p>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="col-12 col-lg-6 col-xl-3 border-light">--%>
            <%--                            <div class="card-body">--%>
            <%--                                <h5 class="text-white mb-0">8323 <span class="float-right"><i class="fa fa-usd"></i></span></h5>--%>
            <%--                                <div class="progress my-3" style="height:3px;">--%>
            <%--                                    <div class="progress-bar" style="width:55%"></div>--%>
            <%--                                </div>--%>
            <%--                                <p class="mb-0 text-white small-font">Total Revenue <span class="float-right">+1.2% <i class="zmdi zmdi-long-arrow-up"></i></span></p>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="col-12 col-lg-6 col-xl-3 border-light">--%>
            <%--                            <div class="card-body">--%>
            <%--                                <h5 class="text-white mb-0">6200 <span class="float-right"><i class="fa fa-eye"></i></span></h5>--%>
            <%--                                <div class="progress my-3" style="height:3px;">--%>
            <%--                                    <div class="progress-bar" style="width:55%"></div>--%>
            <%--                                </div>--%>
            <%--                                <p class="mb-0 text-white small-font">Visitors <span class="float-right">+5.2% <i class="zmdi zmdi-long-arrow-up"></i></span></p>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="col-12 col-lg-6 col-xl-3 border-light">--%>
            <%--                            <div class="card-body">--%>
            <%--                                <h5 class="text-white mb-0">5630 <span class="float-right"><i class="fa fa-envira"></i></span></h5>--%>
            <%--                                <div class="progress my-3" style="height:3px;">--%>
            <%--                                    <div class="progress-bar" style="width:55%"></div>--%>
            <%--                                </div>--%>
            <%--                                <p class="mb-0 text-white small-font">Messages <span class="float-right">+2.2% <i class="zmdi zmdi-long-arrow-up"></i></span></p>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <%--            <div class="row">--%>
            <%--                <div class="col-12 col-lg-8 col-xl-8">--%>
            <%--                    <div class="card">--%>
            <%--                        <div class="card-header">Site Traffic--%>
            <%--                            <div class="card-action">--%>
            <%--                                <div class="dropdown">--%>
            <%--                                    <a href=";" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">--%>
            <%--                                        <i class="icon-options"></i>--%>
            <%--                                    </a>--%>
            <%--                                    <div class="dropdown-menu dropdown-menu-right">--%>
            <%--                                        <a class="dropdown-item" href="">Action</a>--%>
            <%--                                        <a class="dropdown-item" href="">Another action</a>--%>
            <%--                                        <a class="dropdown-item" href="">Something else here</a>--%>
            <%--                                        <div class="dropdown-divider"></div>--%>
            <%--                                        <a class="dropdown-item" href="">Separated link</a>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-body">--%>
            <%--                            <ul class="list-inline">--%>
            <%--                                <li class="list-inline-item"><i class="fa fa-circle mr-2 text-white"></i>New Visitor</li>--%>
            <%--                                <li class="list-inline-item"><i class="fa fa-circle mr-2 text-light"></i>Old Visitor</li>--%>
            <%--                            </ul>--%>
            <%--                            <div class="chart-container-1">--%>
            <%--                                <canvas id="chart1"></canvas>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>

            <%--                        <div class="row m-0 row-group text-center border-top border-light-3">--%>
            <%--                            <div class="col-12 col-lg-4">--%>
            <%--                                <div class="p-3">--%>
            <%--                                    <h5 class="mb-0">45.87M</h5>--%>
            <%--                                    <small class="mb-0">Overall Visitor <span> <i class="fa fa-arrow-up"></i> 2.43%</span></small>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="col-12 col-lg-4">--%>
            <%--                                <div class="p-3">--%>
            <%--                                    <h5 class="mb-0">15:48</h5>--%>
            <%--                                    <small class="mb-0">Visitor Duration <span> <i class="fa fa-arrow-up"></i> 12.65%</span></small>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                            <div class="col-12 col-lg-4">--%>
            <%--                                <div class="p-3">--%>
            <%--                                    <h5 class="mb-0">245.65</h5>--%>
            <%--                                    <small class="mb-0">Pages/Visit <span> <i class="fa fa-arrow-up"></i> 5.62%</span></small>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>

            <%--                    </div>--%>
            <%--                </div>--%>

            <%--                <div class="col-12 col-lg-4 col-xl-4">--%>
            <%--                    <div class="card">--%>
            <%--                        <div class="card-header">Weekly sales--%>
            <%--                            <div class="card-action">--%>
            <%--                                <div class="dropdown">--%>
            <%--                                    <a href=";" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">--%>
            <%--                                        <i class="icon-options"></i>--%>
            <%--                                    </a>--%>
            <%--                                    <div class="dropdown-menu dropdown-menu-right">--%>
            <%--                                        <a class="dropdown-item" href="">Action</a>--%>
            <%--                                        <a class="dropdown-item" href="">Another action</a>--%>
            <%--                                        <a class="dropdown-item" href="">Something else here</a>--%>
            <%--                                        <div class="dropdown-divider"></div>--%>
            <%--                                        <a class="dropdown-item" href="">Separated link</a>--%>
            <%--                                    </div>--%>
            <%--                                </div>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="card-body">--%>
            <%--                            <div class="chart-container-2">--%>
            <%--                                <canvas id="chart2"></canvas>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="table-responsive">--%>
            <%--                            <table class="table align-items-center">--%>
            <%--                                <tbody>--%>
            <%--                                <tr>--%>
            <%--                                    <td><i class="fa fa-circle text-white mr-2"></i> Direct</td>--%>
            <%--                                    <td>$5856</td>--%>
            <%--                                    <td>+55%</td>--%>
            <%--                                </tr>--%>
            <%--                                <tr>--%>
            <%--                                    <td><i class="fa fa-circle text-light-1 mr-2"></i>Affiliate</td>--%>
            <%--                                    <td>$2602</td>--%>
            <%--                                    <td>+25%</td>--%>
            <%--                                </tr>--%>
            <%--                                <tr>--%>
            <%--                                    <td><i class="fa fa-circle text-light-2 mr-2"></i>E-mail</td>--%>
            <%--                                    <td>$1802</td>--%>
            <%--                                    <td>+15%</td>--%>
            <%--                                </tr>--%>
            <%--                                <tr>--%>
            <%--                                    <td><i class="fa fa-circle text-light-3 mr-2"></i>Other</td>--%>
            <%--                                    <td>$1105</td>--%>
            <%--                                    <td>+5%</td>--%>
            <%--                                </tr>--%>
            <%--                                </tbody>--%>
            <%--                            </table>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div><!--End Row-->--%>

            <c:if test="${requestScope.delete == 'success'}">
                <script>
                    window.onload = ()=>{
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                    }
                </script>
            </c:if>
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="card">
<%--                        <div class="card-header">Recent Order Tables--%>
<%--                            <div class="card-action">--%>
<%--                                <div class="dropdown">--%>
<%--                                    <a href="" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">--%>
<%--                                        <i class="icon-options"></i>--%>
<%--                                    </a>--%>
<%--                                    <div class="dropdown-menu dropdown-menu-right">--%>
<%--                                        <a class="dropdown-item" href="">Action</a>--%>
<%--                                        <a class="dropdown-item" href="">Another action</a>--%>
<%--                                        <a class="dropdown-item" href="">Something else here</a>--%>
<%--                                        <div class="dropdown-divider"></div>--%>
<%--                                        <a class="dropdown-item" href="">Separated link</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
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
                                        <td><a href="">${c.getName()}</a></td>
                                        <td><img src="https://via.placeholder.com/110x110" class="product-img" alt="product img"></td>
<%--                                        <td><a href="">${c.getImage()}</a></td>--%>
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
                                            <a><i class="fa-regular fa-pen-to-square" ></i></a>
                                            <a onclick="handleDeleteClick(${c.getId()})"><i class="fa-regular fa-trash-can" ></i></a>
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
            </div><!--End Row-->

            <%--      Create Form      --%>
            <div class="row mt-3">
            <div class="col-lg-6" >
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Thêm khác hàng mới</div>
<%--                        Customer(long id, String image, String name, String email, String password, String address, Date createdAt, long idType)--%>
                        <hr>
                        <form>
                            <div class="form-group">
                                <label for="input-6">Tên</label>
                                <input type="text" class="form-control form-control-rounded" id="input-6" placeholder="Nhập tên">
                            </div>
                            <div class="form-group">
                                <label for="input-7">Email</label>
                                <input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Nhập email">
                            </div>
                            <div class="form-group">
                                <label for="input-8">Mật khẩu</label>
                                <input type="text" class="form-control form-control-rounded" id="input-8" placeholder="Nhập mật khẩu">
                            </div>
                            <div class="form-group">
                                <label for="input-9">Địa chỉ</label>
                                <input type="text" class="form-control form-control-rounded" id="input-9" placeholder="Nhập địa chỉ">
                            </div>
                            <div class="form-group">
                                <label for="input-10">Ngày</label><br>
                                <input id="input-10" class="col-9 form-control form-control-rounded" type="date" name="createdAt" value='<fmt:formatDate pattern = "yyyy-MM-dd"
                                            value = "${requestScope.customer.getCreatedAt()}" />' >
                            </div>
                            <div class="form-group">
                                <label for="input-11">Loại khách hàng</label><br>
                                <select class="form-control form-control-rounded" id="input-11">
                                    <option value="1">VIP</option>
                                    <option value="2">SUPERVIP</option>
                                    <option value="3">NORMAL</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-light btn-round px-5">Xác nhận</button>
                                <button type="submit" class="btn btn-light btn-round px-5">Hủy</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                <div class="avatar-customer col-lg-6" style="display: flex; top: 72px">
                    <img id="noavatar-customer" class="form-control-rounded" src="/assets/images/noavatar.jpg" alt="" style="width: 200px;height: 200px">
                </div>
            </div>

            <!--End Dashboard Content-->

            <!--start overlay-->
            <div class="overlay toggle-menu"></div>
            <!--end overlay-->

        </div>
        <!-- End container-fluid-->

    </div><!--End content-wrapper-->
    <!--Start Back To Top Button-->
    <a href="" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->

    <!--Start footer-->
    <footer class="footer">
        <div class="container">
            <div class="text-center">
                Power By CodeGym
            </div>
        </div>
    </footer>
    <!--End footer-->

    <!--start color switcher-->
<%--    <div class="right-sidebar">--%>
<%--        <div class="switcher-icon">--%>
<%--            <i class="zmdi zmdi-settings zmdi-hc-spin"></i>--%>
<%--        </div>--%>
<%--        <div class="right-sidebar-content">--%>

<%--            <p class="mb-0">Gaussion Texture</p>--%>
<%--            <hr>--%>

<%--            <ul class="switcher">--%>
<%--                <li id="theme1"></li>--%>
<%--                <li id="theme2"></li>--%>
<%--                <li id="theme3"></li>--%>
<%--                <li id="theme4"></li>--%>
<%--                <li id="theme5"></li>--%>
<%--                <li id="theme6"></li>--%>
<%--            </ul>--%>

<%--            <p class="mb-0">Gradient Background</p>--%>
<%--            <hr>--%>

<%--            <ul class="switcher">--%>
<%--                <li id="theme7"></li>--%>
<%--                <li id="theme8"></li>--%>
<%--                <li id="theme9"></li>--%>
<%--                <li id="theme10"></li>--%>
<%--                <li id="theme11"></li>--%>
<%--                <li id="theme12"></li>--%>
<%--                <li id="theme13"></li>--%>
<%--                <li id="theme14"></li>--%>
<%--                <li id="theme15"></li>--%>
<%--            </ul>--%>

<%--        </div>--%>
<%--    </div>--%>
    <!--end color switcher-->

</div><!--End wrapper-->

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

<%-- My script--%>
<script>
    function handleDeleteClick(idCustomer) {
        document.getElementById("idDelete").value = idCustomer;
        Swal.fire({
            title: 'Are you sure delete?',
            // text: "You won't be able to revert this!",
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
