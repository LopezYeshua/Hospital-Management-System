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
                    <title>Hospital Management System</title>
                </head>

                <body>
                    <svg width="1440" height="120" viewBox="-10 -10 1440 55" preserveAspectRatio="xMidYMin slice"
                        style="width: 100%; padding-bottom: 3em; overflow: visible" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M-16 55V-71.2907L1440 -81C1078.17 21.2026 512 55 -16 55Z" fill="#00548C"></path>
                        <path d="M2212 -68.9745V18L720 29.5C1074 -70.4755 1864 -76.9726 2212 -68.9745Z" fill="#57a5cc"
                            fill-opacity="0.8"></path>
                    </svg>
                    <div class="containter">
                        <nav class="navbar px-4 position-absolute top-0 start-0">
                            <h1><a class="text-light test" href="/">NoHo Medical Arts</a></h1>
                        </nav>
                        <div class="div px-3 position-absolute top-0 end-0 mt-3">
                            <a class="text-light" href="/login">Patient Portal</a>
                            <a class="text-light px-2" href="/registration">Careers</a>
                        </div>
                    </div>

                    <div class="container mt-3 text-center">
                        <div class="row">
                            <div class="container hero">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col about">
                                <div class="container"><a href="">About</a></div>
                            </div>
                            <div class="col doctors">
                                <div class="container"><a href="">Doctors</a></div>
                            </div>
                            <div class="col contact">
                                <div class="container"><a href="">Contact Us</a></div>
                            </div>
                            <div class="col covid">
                                <div class="container"><a href="">COVID</a></div>
                            </div>
                        </div>
                    </div>
                </body>

                </html>