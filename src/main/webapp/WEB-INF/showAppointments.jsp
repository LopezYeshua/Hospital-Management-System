<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<body>

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
                            <td>${appointment.startDate}</td>
                            <td>
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