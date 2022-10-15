<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/userPages.css">
    <link rel="stylesheet" href="/css/clock.css">
    <script src="/js/clock.js" defer></script>
    <title>HeartBeat Hospital</title>
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
            <h1><a class="text-light" href="/home">HeartBeat Hospital</a></h1>
        </nav>
    </div>
    <div class="row px-5 py-2 mt-5">
        <div class="col">
            <h1>Welcome Doctor <c:out value="${currentUser.lastName}"></c:out></h1>
            <form id="logoutForm" method="POST" action="/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input class="btn btn-outline-dark" type="submit" value="Logout!" />
            </form>
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
    <div class="container shadow-lg w-50 border border-dark rounded-3 mt-4 p-4 pt-0">
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
                    <c:if test="${currentUser.doctor.appointments == null}">
                        <tr>
                            <td>Nothing to see here</td>
                        </tr>
                    </c:if>
                    <c:forEach var="appointment" items="${currentUser.doctor.appointments}">
                        <tr>
                            <td><a href="/doctor/${appointment.id}">${appointment.patient.user.firstName} ${appointment.patient.user.lastName}</a></td>
                            <td>
                                <fmt:formatDate type="date" value="${appointment.startDate}"/> at
                                <fmt:formatDate type="time" value="${appointment.startTime}"/> -
                                <fmt:formatDate type="time" value="${appointment.endTime}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>