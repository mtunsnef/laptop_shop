<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Dashboard - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                                    <li class="breadcrumb-item active">Product Detail</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Detail Product</h3>
                                            </div>
                                            <hr />
                                            <div class="card" style="width: 70%">
                                                <div class="card-header fw-bold">
                                                    Product Information
                                                </div>
                                                <ul class="list-group list-group-flush ">
                                                    <div class="text-center">
                                                        <li class="list-group-item"><img width="300px" height="200px"
                                                                src="/images/product/${productDetail.image}" alt="">
                                                        </li>
                                                    </div>

                                                    <li class="list-group-item">ID: ${productDetail.id}</li>
                                                    <li class="list-group-item">Name: ${productDetail.name}</li>
                                                    <li class="list-group-item">Short Detail: ${productDetail.shortDesc}
                                                    </li>
                                                    <li class="list-group-item">Price: ${productDetail.price}</li>
                                                    <li class="list-group-item">Factory: ${productDetail.factory}</li>
                                                    <li class="list-group-item">Target: ${productDetail.target}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>