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
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/userPages.css">
    <link rel="stylesheet" href="/css/clock.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/velocity-animate@1.5.2/velocity.min.js" defer></script> -->
    <script src="/js/clock.js" defer></script>
    <title>Hospital Management System</title>
</head>
<body>
    <svg width="1440" height="152" viewBox="0 0 1440 55" preserveAspectRatio="xMidYMin slice"
    style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
    xmlns="http://www.w3.org/2000/svg">
    <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
    <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
        fill-opacity="0.8"></path>
    </svg>
    <nav class="navbar px-4 position-absolute top-0 start-0">
        <h1><a class="text-light title link" href="/home">NoHo Medical Arts</a></h1>
    </nav>
    
    <div class="container w-25 border border-dark rounded-2 mt-4 p-4 pt-0">
        <h1>Welcome <c:out value="${currentUser.firstName}"></c:out></h1>
        <div>
            <table class="table">
                <h3>Your upcoming appointments</h3>
                <thead>
                    <tr>
                        <th>Doctor</th>
                        <th>Date & Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${currentUser.patient.appointments.size() == 0}">
                        <tr>
                            <td>Nothing to see here</td>
                        </tr>
                    </c:if>
                    <c:forEach var="appointment" items="${currentUser.patient.appointments}">
                        <tr>
                            <td><strong>${appointment.doctor.user.firstName} ${appointment.doctor.user.lastName}</strong></td>
                            <td>
                                <fmt:formatDate type="date" value="${appointment.startDate}"/> at
                                <fmt:formatDate type="time" value="${appointment.startTime}"/> -
                                <fmt:formatDate type="time" value="${appointment.endTime}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <table class="table">
                <h3>Patients History</h3>
                <thead>
                    <tr>
                        <th>Doctor</th>
                        <th>Symptoms</th>
                        <th>Diagnosis</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prescription" items="${allPrescriptions}">
                        <c:if test="${prescription.patient.user.id == currentUser.id}">
                            <tr>
                                <td><strong>${prescription.doctor.user.firstName} ${prescription.doctor.user.lastName}</strong></td>
                                <td>${prescription.symptoms}</td>
                                <td>${prescription.diagnosis}</td>
                                <td><fmt:formatDate type="date" value="${prescription.createdAt}"/></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <form id="logoutForm" method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="btn btn-outline-dark" type="submit" value="Logout!" />
        </form>
    </div>
</body>
</html>