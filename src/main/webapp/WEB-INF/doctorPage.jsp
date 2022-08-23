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
    <title>Hospital Management System</title>
</head>
<body class="bg-dark text-light">
    <div class="container w-25 border rounded-2 mt-4 p-4 pt-0">
        <h1>Welcome Doctor <c:out value="${currentUser.firstName}"></c:out></h1>
        <div>
            <table class="table table-dark">
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
        <form id="logoutForm" method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Logout!" />
        </form>
    </div>
</body>
</html>