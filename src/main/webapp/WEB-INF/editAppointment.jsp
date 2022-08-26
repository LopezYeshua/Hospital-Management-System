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
    <link rel="stylesheet" href="/css/style.css">
    <title>Hospital Management System</title>
</head>
<body>
    <svg width="1440" height="132" viewBox="0 0 1440 55" preserveAspectRatio="xMidYMin slice"
        style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
        xmlns="http://www.w3.org/2000/svg">
        <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
        <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
            fill-opacity="0.8"></path>
    </svg>
    <nav class="navbar px-4 position-absolute top-0 start-0">
        <h1><a class="text-light title link" href="/home">NoHo Medical Arts</a></h1>
    </nav>
    <div class="container">
    <form:form method="POST" action="/admin/${appointment.id}/updateAppointment" modelAttribute="appointment">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" value="${appointment.doctor.user.id}" name="doctorId">
        <form:input type="hidden" path="patient" value="${patient.id}"/>
        <p>
            <form:label path="doctor">Choose Doctor</form:label>
            <form:select path="doctor">
                <c:forEach var="doctor" items="${doctors}">
                    <option selected value="${doctor.id}">${doctor.user.firstName}</option>
                </c:forEach>
            </form:select>
        </p>
        <p>
            <form:label class="form-label" path="startDate">Date of appointment</form:label>
            <form:input class="form-control" type="date" id="startDate" path="startDate"/>
        </p>
        <p>
            <form:label class="form-label" path="startTime">Date of appointment</form:label>
            <form:input class="form-control" type="time" id="startTime" path="startTime"/>
        </p>
        <p>
            <form:label class="form-label" path="endTime">Estimated end time</form:label>
            <form:input class="form-control" type="time" id="endTime" path="endTime"/>
        </p>
        <input type="submit" value="Submit"/>
    </form:form>
    </div>
</body>
</html>