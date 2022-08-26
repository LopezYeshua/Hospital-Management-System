<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/smallerScreen.css">
    <title>Registration Page</title>
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
    <div class="container width-var border border-1 rounded-2 mt-5 p-5 pt-5">
        <c:choose>
            <c:when test="${isAdmin == 1}">
                <h1>Register Patient</h1>
            </c:when>

            <c:otherwise>
                <h1>Apply!</h1>
            </c:otherwise>
        </c:choose>
            <p>
                <form:errors path="user.*" />
            </p>
            
            <form:form method="POST" action="/registration" modelAttribute="user">
                <p>
                    <form:label class="form-label" path="firstName">First Name</form:label>
                    <form:input class="form-control" type="text" id="firstName" path="firstName" />
                </p>
                <p>
                    <form:label class="form-label" path="lastName">Last Name</form:label>
                    <form:input class="form-control" type="text" id="lastName" path="lastName" />
                </p>
                <p>
                    <form:label class="form-label" path="email">Email</form:label>
                    <form:input class="form-control" type="text" id="email" path="email" />
                </p>
                <p>
                    <form:label class="form-label" path="password">Password:</form:label>
                    <form:password class="form-control" path="password" />
                </p>
                <p>
                    <form:label class="form-label" path="passwordConfirmation">Password Confirmation:
                    </form:label>
                    <form:password class="form-control" path="passwordConfirmation" />
                </p>
                <p>
                    <c:choose>
                        <c:when test="${isAdmin == 1}">
                            <input type="hidden" name="role" value="0">
                        </c:when>
                        <c:otherwise>
                            <label for="role">Register as:</label>
                            <select name="role">
                                <option value="0">Patient</option>
                                <option selected value="1">Doctor</option>
                                <option value="2">Admin</option>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </p>
                <input type="submit" value="Register!" />
                <a href="/login">Login</a>
            </form:form>
    </div>
</body>