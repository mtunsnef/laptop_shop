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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/user">Products</a></li>
                                    <li class="breadcrumb-item active">Create Product</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <hr />
                                            <form:form action="/admin/product/create" method="post"
                                                enctype="multipart/form-data" modelAttribute="newProduct">
                                                <div class="row">
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Name:</label>
                                                        <form:input path="name" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Price:</label>
                                                        <form:input path="price" type="number" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Detail description:</label>
                                                    <form:textarea path="detailDesc" type="text" class="form-control" />
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Short description:</label>
                                                        <form:input path="shortDesc" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input path="quantity" type="number"
                                                            class="form-control" />
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Target</label>
                                                        <form:input path="target" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Factory</label>
                                                        <form:select path="factory" class="form-select">
                                                            <form:option value="APPLE">Apple (MacBook)</form:option>
                                                            <form:option value="ASUS">Asus</form:option>
                                                            <form:option value="LENOVO">Lenovo</form:option>
                                                            <form:option value="DELL">Dell</form:option>
                                                            <form:option value="LG">LG</form:option>
                                                            <form:option value="ACER">Acer</form:option>
                                                        </form:select>
                                                    </div>

                                                </div>
                                                <div class="col-12 col-md-6  mb-3">
                                                    <label for="avatarFile" class="form-label">Image</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        name="avtFile" accept=".png, .jpg, .jpeg" />
                                                </div>
                                                <div class="col-12 col-md-6  mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview">
                                                </div>

                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </form:form>
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