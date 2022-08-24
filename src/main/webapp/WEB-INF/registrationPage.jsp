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
                <link rel="stylesheet" href="css/style.css">
                <title>Registration Page</title>
            </head>

            <body class="bg-dark text-dark border-dark">
                <svg width="1440" height="55" viewBox="0 0 1440 55" preserveAspectRatio="xMidYMin slice"
                    style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
                    <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
                        fill-opacity="0.8"></path>
                </svg>
                <h1><a href="/">HMS</a></h1>
                <div class="container w-25 border border-1 rounded-2 mt-5 p-5 pt-5">
                    <h1>Register</h1>
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
                            <label for="role">Register as:</label>
                            <select name="role">
                                <option value="0">Patient</option>
                                <option value="1">Doctor</option>
                                <option value="2">Admin</option>
                            </select>
                        </p>
                        <input type="submit" value="Register!" />
                    </form:form>
                </div>
            </body>

            </html>