<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
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

    <c:choose>

    <c:when test="${user.roles.get(0).name.equals('ROLE_DOCTOR')}">
        <div class="container">
            <h1>Doctor ${user.firstName}'s appointments</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th>Patient</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="appointment" items="${user.doctor.appointments}">
                        <tr>
                            <td>${appointment.patient.user.firstName}</td>
                            <td>
                                <fmt:formatDate type="date" value="${appointment.startDate}"/> at
                                <fmt:formatDate type="time" dateStyle="short" value="${appointment.startTime}"/> -
                                <fmt:formatDate type="time" dateStyle="short" value="${appointment.endTime}"/>
                            </td>
                            <td class="d-flex gap-3">
                                <a href="/admin/${appointment.id}/editAppointment">Edit</a>
                                <p>|</p>
                                <form action="/admin/${appointment.id}/deleteAppointment" method ="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="submit" value="CANCEL">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:when>

    <c:otherwise>
        <div>
            <h1>Nothing to see here</h1>
        </div>
    </c:otherwise>

    </c:choose>
</body>
</html>