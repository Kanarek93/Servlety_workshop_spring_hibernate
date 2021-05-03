<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<style> <%@include file="/resources/theme/css/sb-admin-2.min.css"%> </style>
<!--link href="<c:url value="/resources/theme/css/sb-admin-2.min.css"/>" rel="stylesheet"-->
<style> <%@include file="/resources/theme/custom/form-validate.js" %> </style>
<!--script src="/theme/custom/form-validate.js"></script-->

<jsp:include page="header.jsp"/>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href="<c:url value="/user/list"/>" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Lista użytkowników</a>
    </div>

</div>
<!-- /.container-fluid -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Edytuj użytkownika</h6>
    </div>
    <div class="card-body">
        <form method="post" action="/user/edit" class="form-floating" id="form">
            <div class="mb-3">
                <label for="username" class="form-label">Nazwa<br></label>
                <input type="text" name="username" id="username" value="${user.getUsername()}" class="form-control">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email<br></label>
                <input type="text" name="email" id="email" value="${user.getEmail()}" class="form-control">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Hasło<br></label>
                <input type="password" name="password" id="password" value="*****" class="form-control">
            </div>
            <input type="hidden" name="id" value="${user.getId()}">
            <input type="submit" value="Zapisz" class="btn btn-primary"></input>
        </form>
    </div>

</div>
<!-- End of Main Content -->
<jsp:include page="footer.jsp"/>
