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
    <title>Our Doctors</title>
</head>
<body>
    <svg width="1440" height="132" viewBox="-10 -10 1440 55" preserveAspectRatio="xMidYMin slice"
        style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
        xmlns="http://www.w3.org/2000/svg">
        <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
        <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
            fill-opacity="0.8"></path>
    </svg>
    <div class="containter">
        <nav class="navbar px-4 position-absolute top-0 start-0">
            <h1><a class="text-light title link" href="/">NoHo Medical Arts</a></h1>
        </nav>
        <div class="div px-3 position-absolute top-0 end-0 mt-3">
            <a class="text-light link links" href="/login">Patient Portal</a>
            <a class="text-light px-2 link links" href="/registration">Careers</a>
        </div>
    </div>
    <div class="container">
        <c:forEach var="doctor" items="${allDoctors}">
            <article class="border border-dark mb-3 rounded-3 px-3 py-1">
                <p><strong>${doctor.user.firstName} ${doctor.user.lastName}</strong></p>
                <p>Member Since: <fmt:formatDate type="date" value="${doctor.hireDate}"/></p>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ea dolorum repudiandae eum. Voluptates molestias optio magnam maiores error quisquam quasi quos minima molestiae, modi iste dolor est totam pariatur eum?</p>
            </article>
        </c:forEach>
    </div>
</body>
</html>