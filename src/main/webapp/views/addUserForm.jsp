<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!--link href="<c:url value="/resources/theme/css/sb-admin-2.min.css"/>" rel="stylesheet" type="text/css"-->
<style> <%@include file="/resources/theme/css/sb-admin-2.min.css"%> </style>
<script src="<c:url value="/resources/theme/custom/form-validate.js" />" type="text/javascript"></script>

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
        <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
    </div>
    <div class="card-body">
        <form:form method="post" action="/user/add" class="form-floating" id="form" modelAttribute="user">
            <div class="mb-3">
                <form:label path="username" class="form-label"> Nazwa <br></form:label>
                <form:input path="username" type="text" id="username" value="Nazwa użytkownika" class="form-control"/>
            </div>
            <div class="mb-3">
                <form:label path="email" class="form-label">Email<br></form:label>
                <form:input path="email" type="text" name="email" id="email" value="Email użytkownika" class="form-control"/>
            </div>
            <div class="mb-3">
                <form:label path="password" class="form-label">Hasło<br></form:label>
                <form:input path="password" type="password" name="password" id="password" value="*****" class="form-control"/>
            </div>
                <input type="submit" value="Zapisz" class="btn btn-primary"/>
        </form:form>
    </div>

</div>
<!-- End of Main Content -->
<jsp:include page="footer.jsp"/>
