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
<body class="bg-dark text-light">
    <nav class="navbar px-4">
        <h1><a href="/home">HMS</a></h1>
    </nav>
    <div class="container w-50 mt-5 border border-light py-3 rounded-3">
        <form:form action="/doctor/${doctor.id}/prescription" method="post" modelAttribute="prescription">
            <form:input type="hidden" path="doctor" value="${doctor.id}"/>
            <form:input type="hidden" path="appointment" value="${appointmentId}"/>
            <p>
                <form:label class="form-label pb-0" path="patient">Patient</form:label>
                <p class="form-control">${patient.user.firstName}</p>
                <form:input class="form-control" type="hidden" value="${patient.id}" path="patient"/>
            </p>
            <p>
                <form:label class="form-label" path="medication">Medication</form:label>
                <form:input class="form-control" type="text" id="medication" path="medication"/>
            </p>
            <p>
                <form:label class="form-label" path="timesTaken">Times Taken</form:label>
                <form:input class="form-control" type="text" id="timesTaken" path="timesTaken"/>
            </p>
            <p>
                <form:label class="form-label" path="daysTaken">Days Taken</form:label>
                <form:input class="form-control" type="text" id="daysTaken" path="daysTaken"/>
            </p>
            <p>
                <form:label class="form-label" path="description">Extra notes</form:label>
                <form:input class="form-control" type="text" id="daysTaken" path="description"/>
            </p>
            <form:input class="form-control" type="hidden" id="isArchived" path="isArchived" value="0"/>
            <input type="submit" value="Submit"/>
        </form:form>
    </div>
</body>
</html>