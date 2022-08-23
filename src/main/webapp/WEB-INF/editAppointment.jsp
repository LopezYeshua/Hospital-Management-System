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
    <div class="container">
    <form:form method="POST" action="/admin/${appointment.id}/updateAppointment" modelAttribute="appointment">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" value="${appointment.doctor.user.id}" name="doctorId">
        <form:input type="hidden" path="patient" value="${patient.id}"/>
        <p>
            <form:label path="doctor">Choose Doctor</form:label>
            <form:select path="doctor">
                <c:forEach var="doctor" items="${doctors}">
                    <option value="${doctor.id}">${doctor.user.firstName}</option>
                </c:forEach>
            </form:select>
        </p>
        <p>
            <form:label class="form-label" path="startDate">Date of appointment</form:label>
            <form:input class="form-control" type="date" id="startDate" path="startDate"/>
        </p>
        <p>
            <form:label class="form-label" path="endDate">Estimated end time</form:label>
            <form:input class="form-control" type="time" id="endDate" path="endDate"/>
        </p>
        <input type="submit" value="Submit"/>
    </form:form>
    </div>
</body>
</html>