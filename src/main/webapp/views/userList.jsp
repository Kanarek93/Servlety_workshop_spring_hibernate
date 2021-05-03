<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<style> <%@include file="/resources/theme/vendor/datatables/dataTables.bootstrap4.min.css"%> </style>
<style> <%@include file="/resources/theme/css/sb-admin-2.min.css"%> </style>
<!--link href="<c:url value="/resources/theme/vendor/datatables/dataTables.bootstrap4.min.css"/>" rel="stylesheet"-->
<!--link href="<c:url value="/resources/theme/css/sb-admin-2.css"/>" rel="stylesheet"-->

<jsp:include page="header.jsp"/>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
                        <a href="/user/add" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Dodaj użytkownika </a>
                    </div>

                </div>
                <!-- /.container-fluid -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table">
                            <table class="table" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Nazwa użytkownika</th>
                                        <th>Email</th>
                                        <th>Akcja</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty userList}">
                                            <c:forEach var="user" items="${userList}" varStatus="loop">
                                                <tr>
                                                    <td> ${loop.index+1}</td>
                                                    <td> ${user.getUsername()}</td>
                                                    <td> ${user.getEmail()}</td>
                                                    <td>
                                                        <a href="<c:url value="/user/delete/${user.getId()}"/>"> Usuń</a>
                                                        <a href="<c:url value="/user/edit/${user.getId()}" />">Edytuj</a>
                                                        <a href="<c:url value="/user/show/${user.getId()}" />">Pokaż</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            Nie ma żadnych użytkowników, dodaj.
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            <!-- End of Main Content -->
<jsp:include page="footer.jsp"/>
