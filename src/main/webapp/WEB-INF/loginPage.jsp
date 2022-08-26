<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/smallerScreen.css">
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
        <h1><a class="text-light title link" href="/">NoHo Medical Arts</a></h1>
    </nav>
    <div class="container width-var border rounded-2 mt-4 p-4 pt-0">
        <c:if test="${logoutMessage != null}">
            <c:out value="${logoutMessage}"></c:out>
        </c:if>
        <h1>Login!</h1>
        <c:if test="${errorMessage != null}">
            <c:out value="${errorMessage}"></c:out>
        </c:if>
        <form method="POST" action="/login">
            <p>
                <label class="form-label" for="email">Email</label>
                <input class="form-control" type="text" id="email" name="email">
            </p>
            <p>
                <label class="form-label" for="password">Password</label>
                <input class="form-control" type="password" id="password" name="password" />
            </p>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input class="btn btn-outline-dark" type="submit" value="Login!" />
        </form>
    </div>
</body>

</html>