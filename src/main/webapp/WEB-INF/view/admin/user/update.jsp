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
                                    <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                                    <li class="breadcrumb-item active">Edit User</li>
                                </ol>
                                <div>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Edit a user</h3>
                                            <hr />
                                            <form:form action="/admin/user/update" method="post"
                                                modelAttribute="updateUser">
                                                <div class="mb-3" hidden>
                                                    <label class="form-label">Id:</label>
                                                    <form:input path="id" type="text" class="form-control" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Full name:</label>
                                                    <form:input path="fullName" type="text" class="form-control" />
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Email:</label>
                                                        <form:input path="email" disabled="true" type="email"
                                                            class="form-control" />
                                                    </div>
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Phone number:</label>
                                                        <form:input path="phone" type="text" class="form-control" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6 mb-3">
                                                        <label class="form-label">Role:</label>
                                                        <form:select class="form-select" path="role.id">
                                                            <c:forEach items="${roleList}" var="role">
                                                                <form:option value="${role.id}">${role.name}
                                                                </form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <label for="avatarFile" class="form-label">Avatar</label>
                                                        <form:input path="avatar" class="form-control" type="file"
                                                            id="avatarFile" name="avtFile" accept=".png, .jpg, .jpeg" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-md-6  mb-3">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview">
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Address:</label>
                                                    <form:input path="address" type="text" class="form-control" />
                                                </div>
                                                <button type="submit" class="btn btn-success">Update</button>
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