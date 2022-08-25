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
    <title>Noho medical Arts</title>
</head>
<body>
    <svg width="1440" height="120" viewBox="-10 -10 1440 55" preserveAspectRatio="xMidYMin slice"
        style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
        xmlns="http://www.w3.org/2000/svg">
        <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
        <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
            fill-opacity="0.8"></path>
    </svg>
    <nav class="navbar px-4 position-absolute top-0 start-0">
        <h1><a class="text-light test" href="/">NoHo Medical Arts</a></h1>
    </nav>
    <div class="row container">
        <form:form method="POST" action="/admin/${patient.id}/appointments" modelAttribute="appointment">
            <p>
                <form:label path="doctor">Choose Doctor</form:label>
                <form:select path="doctor">
                    <c:forEach var="doctor" items="${doctors}">
                        <option value="${doctor.id}">${doctor.user.firstName} - ${doctor.specialty}</option>
                    </c:forEach>
                </form:select>
            </p>
            <p>
                <form:label class="form-label" path="startDate">Date of appointment</form:label>
                <form:input class="form-control" type="date" id="startDate" path="startDate"/>
            </p>
            <p>
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