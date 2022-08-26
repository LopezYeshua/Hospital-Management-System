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
    <div class="container w-50 mt-5 border border-dark py-3 rounded-3">
        <form:form action="/doctor/${appointmentId}/prescription" method="post" modelAttribute="prescription">
            <form:input type="hidden" path="doctor" value="${doctor.id}"/>
            <p>
                <form:label class="form-label pb-0" path="patient">Patient</form:label>
                <p class="form-control">${patient.user.firstName}</p>
                <form:input class="form-control" type="hidden" value="${patient.id}" path="patient"/>
            </p>
            <p>
                <form:label class="form-label" path="symptoms">Symptoms</form:label>
                <form:input class="form-control" type="text" id="symptoms" path="symptoms"/>
            </p>
            <p>
                <form:label class="form-label" path="diagnosis">Diagnosis</form:label>
                <form:input class="form-control" type="text" id="diagnosis" path="diagnosis"/>
            </p>
            <form:input class="form-control" type="hidden" id="isArchived" path="isArchived" value="0"/>
            <input type="submit" value="Submit"/>
        </form:form>
    </div>
</body>
</html>