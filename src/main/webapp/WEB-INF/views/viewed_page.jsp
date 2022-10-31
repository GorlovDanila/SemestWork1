<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 31.10.2022
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Просмотренное</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
    <link href="/resources/css/viewed_page.css">
    <link href="/resources/css/base.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/50e3c0bd8c.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/f93f6752bd.js"></script>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-md bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img src="../../resources/logos/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Аниме</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/authors">Создатели</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/genres">Жанры</a>
                </li>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="/viewed">Просмотренно</a>--%>
                <%--                </li>--%>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <c:if test="${sessionScope.currentUser != null}">
                        <c:set var="user" value="${(sessionScope.currentUser)}"/>
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#">
                            <i class="fa-regular fa-user fa-xl"></i></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item active text-bg-light"><c:out value="${user.login}"/>
                            </a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item active text-bg-light"><c:out value="${user.password}"/>
                            </a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/viewed">Просмотренное</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/registration">Выйти</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${sessionScope.currentUser == null}">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#"><i
                                class="fa-solid fa-door-open fa-xl"></i></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/authorization">Вход</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/registration">Регистрация</a></li>
                        </ul>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="main-content" style="margin-bottom: 50px">
    <div class="container">
        <h3 style="text-align: center; margin-top: 50px">Моё просмотренное</h3>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="list-group my-list">
                    <c:if test="${sessionScope.currentUser.listViewed != null}">
                        <c:set var="currentUser" value="${sessionScope.currentUser}"/>
                        <c:forEach var="anim" items="${currentUser.listViewed}">
                            <a class="list-group-item list-group-item-action active text-bg-light">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="ms-1"><c:out value="${anim.title}"/>
                                    </h5>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-sm-4">
                                        <img src=${anim.linkToImage} width="150px">
                                    </div>
                                    <div class="col-lg-8 col-sm-8">
                                        Жанры: <c:out value="${anim.genre}"/>
                                        <br>
                                        Автор: <c:out value="${anim.author}"/>
                                        <br>
                                        Год: <c:out value="${anim.year}"/>
                                        <br>
                                        Тип: <c:out value="${anim.type}"/>
                                        <br>
                                        Статус: <c:out value="${anim.status}"/>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:if>
<%--                    <c:if test="${sessionScope.currentUser.listViewed == null}">--%>
<%--                        <h1 style="text-align: center">Вы пока ничего не посмотрели):</h1>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-lg-12 col-sm-12">--%>
<%--                                <img src="/resources/images/bleach.jpg">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:if>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>