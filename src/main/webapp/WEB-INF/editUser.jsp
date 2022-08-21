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
        <h3>Edit ${user.firstName}</h3>
        <form:form method="POST" action="/admin/${user.id}/edit" modelAttribute="user">
            <input type="hidden" name="_method" value="put">
                <p>
                    <form:label class="form-label" path="firstName">First Name</form:label>
                    <form:input class="form-control" type="text" id="firstName" path="firstName"/>
                </p>
                <p>
                    <form:label class="form-label" path="lastName">Last Name</form:label>
                    <form:input class="form-control" type="text" id="lastName" path="lastName"/>
                </p>
                <input type="submit" value="Submit"/>
            </form:form>
    </div>
</body>
</html>