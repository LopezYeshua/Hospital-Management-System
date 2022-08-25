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
    <link rel="stylesheet" href="/css/userPages.css">
    <link rel="stylesheet" href="/css/clock.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.min.js" defer></script> -->
    <script src="/js/clock.js" defer></script>
    <title>Hospital Management System</title>
</head>
<body>
    <svg width="1440" height="55" viewBox="0 0 1440 55" preserveAspectRatio="xMidYMin slice"
    style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
    xmlns="http://www.w3.org/2000/svg">
    <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
    <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
        fill-opacity="0.8"></path>
    </svg>
    <div class="containter">
        <nav class="navbar px-4 position-absolute top-0 start-0">
            <h1><a class="text-light" href="/home">NoHo Medical Arts</a></h1>
        </nav>
    </div>
    <div class="container mt-3">
        <div class="row px-3 py-2">
            <div class="col">
                <h1>Welcome to the admin page <c:out value="${currentUser.firstName}"></c:out></h1>
                <div class="container d-flex gap-3">
                    <form id="logoutForm" method="POST" action="/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input class="btn btn-outline-dark" type="submit" value="Logout!" />
                    </form>
                    <a class="btn btn-outline-dark" href="/admin/registerPatient">Register new employee/patient</a>
                </div>
            </div>
            <!-- Clock -->
            <div class="col-2">
                <div class="clock">
                    <div class="hours">
                        <div class="first">
                            <div class="number">0</div>
                        </div>
                        <div class="second">
                            <div class="number">0</div>
                        </div>
                    </div>
                    <div class="tick">:</div>
                    <div class="minutes">
                        <div class="first">
                        <div class="number">0</div>
                    </div>
                        <div class="second">
                        <div class="number">0</div>
                        </div>
                    </div>
                    <div class="tick">:</div>
                    <div class="seconds">
                        <div class="first">
                            <div class="number">0</div>
                        </div>
                        <div class="second infinite">
                            <div class="number">0</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-3 gap-3">
            <!-- New Users Table -->
            <div class="col shadow-lg w-50 border border-dark rounded-3 mt-4 p-4 pt-0">
                <table class="table">
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
            </div>
            <!-- All Doctors Table -->
            <div class="col shadow-lg w-50 border border-dark rounded-3 mt-4 p-4 pt-0">
                <table class="table">
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
            </div>
        </div>
        <div class="row mt-3 gap-3">
            <!-- All Admins Table -->
            <div class="col shadow-lg w-50 border border-dark rounded-3 mt-4 p-4 pt-0">
                <table class="table">
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
            </div>
            <div class="col shadow-lg w-50 border border-dark rounded-3 mt-4 p-4 pt-0">
        <!-- All Patients Table -->
                <table class="table">
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
            </div>
        </div>
    </div>
</body>
</html>