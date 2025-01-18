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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${updateProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                                    <li class="breadcrumb-item"><a href="/admin/user">Products</a></li>
                                    <li class="breadcrumb-item active">Edit Product</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Edit a product</h3>
                                            <hr />
                                            <form:form action="/admin/product/update" method="post"
                                                enctype="multipart/form-data" modelAttribute="updateProduct">
                                                <c:set var="errorProductName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorLongDetail">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorShortDetail">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>
                                                <div class="mb-3" hidden>
                                                    <label class="form-label">ID</label>
                                                    <form:input path="id" type="text" class="form-control" />
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Name:</label>
                                                        <form:input path="name" type="text"
                                                            class="form-control ${not empty errorProductName ? 'is-invalid' : ''}" />
                                                        ${errorProductName}
                                                    </div>
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Price:</label>
                                                        <form:input path="price" type="number"
                                                            class="form-control ${not empty errorPrice ? 'is-invalid' : ''}" />
                                                        ${errorPrice}
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Detail description:</label>
                                                    <form:textarea path="detailDesc" type="text"
                                                        class="form-control ${not empty errorLongDetail ? 'is-invalid' : ''}" />
                                                    ${errorLongDetail}
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Short description:</label>
                                                        <form:input path="shortDesc" type="text"
                                                            class="form-control ${not empty errorShortDetail ? 'is-invalid' : ''}" />
                                                        ${errorShortDetail}
                                                    </div>
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input path="quantity" type="number"
                                                            class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" />
                                                        ${errorQuantity}
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Target</label>
                                                        <form:select path="target" class="form-select">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="OFFICE">Office</form:option>
                                                            <form:option value="BUSINESS">Business</form:option>
                                                            <form:option value="GRAPHIC-DESIGN">Graphic Design
                                                            </form:option>
                                                        </form:select>

                                                    </div>
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label class="form-label">Factory</label>
                                                        <form:select path="factory" class="form-select">
                                                            <form:option value="APPLE">Apple (MacBook)
                                                            </form:option>
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

                                                <button type="submit" class="btn btn-warning">Update</button>
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