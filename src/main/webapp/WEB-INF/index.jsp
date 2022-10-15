<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/css/smallerScreen.css">
    <title>HeartBeat Hospital</title>
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
            <h1><a class="text-light title link" href="/">HeartBeat Hospital</a></h1>
        </nav>
        <div class="div px-3 position-absolute top-0 end-0 mt-3">
            <a class="text-light link links" href="/login">Patient Portal</a>
            <a class="text-light px-2 link links" href="/registration">Careers</a>
        </div>
    </div>

    <div class="container mt-3 text-center">
        <div class="row">
            <img class="container hero-responsive" src="/images/drpic.jpg" alt="no">
            <h3 class="in-hero text-light">Where your health comes first</h3>
        </div>
        <div class="row container mt-4">
            <div class="col">
                <a href="#">
                    <div class="about">
                        <p class="link">About</p>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="/doctors">
                    <div class="doctors">
                        <p class="link">Doctors</p>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="#">
                    <div class="contact">
                        <p class="link">Contact Us</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>

</html>