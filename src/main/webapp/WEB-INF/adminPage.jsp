<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <title>Hospital Management System</title>
</head>
<body class="bg-dark text-light">
    <nav class="navbar px-4">
        <h1><a href="/">HMS</a></h1>
    </nav>
    <div class="container w-25 border rounded-2 mt-4 p-4 pt-0">
        <h1>Welcome to the admin page <c:out value="${currentUser.firstName}"></c:out></h1>

        <table class="table table-dark">
            <h1>New Users</h1>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Finish setup</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${allUsers}">
                    <c:choose>
                        <c:when test="${user.roles.get(0).name.equals('ROLE_DOCTOR') && user.doctor == null}">
                            <tr>
                                <td>
                                    <p>${user.firstName} ${user.lastName}</p>
                                </td>
                                <td><a href="admin/${user.id}/edit">edit role</a></td>
                            </tr>
                        </c:when>
                        <c:when test="${user.roles.get(0).name.equals('ROLE_PATIENT') && user.patient == null}">
                            <tr>
                                <td>
                                    <p>${user.firstName} ${user.lastName}</p>
                                </td>
                                <td><a href="admin/${user.id}/edit">edit role</a></td>
                            </tr>
                        </c:when>

                    </c:choose>
                </c:forEach>
            </tbody>
        </table>

        <table class="table table-dark">
            <h1>Doctors</h1>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="doctor" items="${doctors}">
                    <tr>
                        <td><a href="/admin/${doctor.user.id}/showUser">${doctor.user.firstName} ${doctor.user.lastName}</a></td>
                        <td class="d-flex gap-3">
                            <a href="/admin/${doctor.user.id}/showAppointments">Show appointments</a>
                            <p>|</p>
                            <form action="/admin/${doctor.user.id}/delete" method ="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="TERMINATE">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <table class="table table-dark">
            <h1>Admins</h1>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="admin" items="${admins}">
                    <tr>
                        <td><a href="/admin/${admin.id}/showUser">${admin.firstName} ${admin.lastName}</a></td>
                        <td>
                            <c:if test="${admin.id != currentUser.id}">
                                <form action="/admin/${admin.id}/delete" method ="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="submit" value="TERMINATE">
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <table class="table table-dark">
            <h1>Patients</h1>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="patient" items="${patients}">
                    <tr>
                        <td><a href="/admin/${patient.user.id}/showUser">${patient.user.firstName} ${patient.user.lastName}</a></td>
                        <td class="d-flex gap-3">
                            <a href="/admin/${patient.user.id}/appointments">Make Appointment</a>
                            <p>|</p>
                            <form action="/admin/${patient.user.id}/delete" method ="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="_method" value="delete">
                                <input type="submit" value="DELETE">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="container d-flex justify-content-between">
            <form id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn btn-light" type="submit" value="Logout!" />
            </form>
            <a class="btn btn-light" href="/registration">Register new employee/patient</a>
        </div>
    </div>
</body>
</html>