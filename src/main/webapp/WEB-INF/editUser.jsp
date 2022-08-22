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
        <h1><a href="/">HMS</a></h1>
    </nav>

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

    <c:choose>
    
    <c:when test="${user.roles.get(0).name.equals('ROLE_DOCTOR') && user.doctor == null}">

        <div class="container mt-5">
            <h3>Finish setup</h3>
            <form:form method="POST" action="/admin/${user.id}/addDoctor" modelAttribute="doctor">
                <form:input type="hidden" path="user" value="${user.id}"/>
                <p>
                    <form:label class="form-label" path="specialty">Specialty</form:label>
                    <form:input class="form-control" type="text" id="specialty" path="specialty"/>
                </p>
                <p>
                    <form:label class="form-label" path="salary">Salary</form:label>
                    <form:input class="form-control" type="number" id="salary" path="salary"/>
                </p>
                <p>
                    <form:label class="form-label" path="hireDate">Hire Date</form:label>
                    <form:input class="form-control" type="Date" id="hireDate" path="hireDate"/>
                </p>
                <input type="submit" value="Submit"/>
            </form:form>
        </div>

    </c:when>

    <c:when test="${user.doctor != null}">
        <div class="container mt-5 text-dark">
            <div class="card">
                <div class="card-header">
                    <h1>Doctor ${user.firstName} details</h1>
                </div>
                <div class="card-body">
                    <p>Specialty: ${user.doctor.specialty}</p>
                    <p>Salary: ${user.doctor.salary}</p>
                    <p>Hire Date: ${user.doctor.hireDate}</p>
                </div>
            </div>
        </div>
    </c:when>

    <c:when test="${user.roles.get(0).name.equals('ROLE_PATIENT') && user.patient == null}">

        <div class="container mt-5">
            <p>
                <form:errors path="patient.*" />
            </p>
            <h3>Finish setup</h3>
            <form:form method="POST" action="/admin/${user.id}/addPatient" modelAttribute="patient">
                <form:input type="hidden" path="user" value="${user.id}"/>
                <p>
                    <labelm class="form-label" path="gender">Gender</label>
                    <form:select class="form-control" path="gender">
                        <option value=NONE selected>------SELECT------</option>
                        <option value="boy">Boy</option>
                        <option value="girl">Girl</option>
                        <option value="other">Other</option>
                    </form:select>
                </p>
                <p>
                    <form:label class="form-label" path="insurance">Insurance</form:label>
                    <form:input class="form-control" type="text" id="insurance" path="insurance"/>
                </p>
                <p>
                    <form:label class="form-label" path="phoneNumber">Phone Number</form:label>
                    <form:input class="form-control" type="number" id="phoneNumber" path="phoneNumber"/>
                </p>
                <p>
                    <form:label class="form-label" path="emergencyContact">Emergency Contact</form:label>
                    <form:input class="form-control" type="text" id="emergencyContact" path="emergencyContact"/>
                </p>
                <p>
                    <form:label class="form-label" path="emergencyPhoneNumber">Emergency Contact Number</form:label>
                    <form:input class="form-control" type="number" id="phoneNumber" path="emergencyPhoneNumber"/>
                </p>
                <p>
                    <form:label class="form-label" path="birthday">Birthday</form:label>
                    <form:input class="form-control" type="date" id="birthday" path="birthday"/>
                </p>
                <input type="submit" value="Submit"/>
            </form:form>
        </div>

    </c:when>

    <c:when test="${user.patient != null}">
        <div class="container mt-5 w-50 text-dark">
            <div class="card">
                <div class="card-header">
                    <h1>Patient ${user.firstName} details</h1>
                </div>
                <div class="card-body">
                    <p>Gender: ${user.patient.gender}</p>
                    <p>Insurance: ${user.patient.insurance}</p>
                    <p>Emergency Contact: ${user.patient.emergencyContact}</p>
                    <p>Emergency Contact Phone #: ${user.patient.emergencyPhoneNumber}</p>
                    <p>Birthday: ${user.patient.birthday}</p>
                </div>
            </div>
        </div>
    </c:when>

    <c:otherwise>
        <div>
            <p>Nothing to see here</p>
        </div>
    </c:otherwise>

    </c:choose>
</body>
</html>