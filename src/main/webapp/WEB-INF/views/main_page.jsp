<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Created by IntelliJ IDEA.
User: danil
Date: 21.10.2022
Time: 17:26
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Добро пожаловать!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
    <link href="/resources/css/main_page.css" rel="stylesheet">
    <link href="/resources/css/base.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/50e3c0bd8c.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/f93f6752bd.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
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
<div class="container" style="padding-left: 65px; padding-top: 15px">
    <div class="row">
        <div class="col-lg-11 col-sm-11">
            <div id="carouselExampleControls" class="carousel my-carousel" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/Human-benz.png" class="d-block w-100"
                                                          alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Человек-бензопила</h5>
                                <p class="card-text">Жанры: Боевик, Фэнтези, Ужасы.</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1002"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/bleach.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Блич: Тысячелетняя война</h5>
                                <p class="card-text">Жанры: Фэнтези, Приключения, Сверхъестественное.</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1000"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/mob.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Моб Психо 100 3</h5>
                                <p class="card-text">Жанры: Комедия, Сверхъестественное, Супер сила, Экшен.</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1005"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/spy_family.jpg" class="d-block w-100"
                                                          alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Семья шпиона</h5>
                                <p class="card-text">Жанры: Боевик, Комедия, Шпионская фантастика.</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1003"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/cyberpank.jpg" class="d-block w-100"
                                                          alt="..."></div>
                            <div class="card-body">
                                <h5 class="card-title">Киберпанк: Бегущие по краю</h5>
                                <p class="card-text">Жанры: Фантастика, Экшен</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1004"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div class="img-wrapper"><img src="/resources/images/blue_prison.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Синяя тюрьма</h5>
                                <p class="card-text">Жанры: Сёнэн, Спорт, Драма, Психология</p>
                                <form action="/title" method="post">
                                    <input type="hidden" name="myTitle" value="1005"/>
                                    <button type="submit" class="btn btn-dark my-button">Пoсетить</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/carusel_script.js" rel="script"></script>
<section class="main-content" style="margin-bottom: 50px">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-8">
                <div class="list-group my-list">
                    <c:if test="${requestScope.animList != null}">
                        <c:forEach var="anim" items="${requestScope.animList}">
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
                                <form action="/title" method="post" style="padding-top: 5px">
                                    <input type="hidden" name="myTitle" value="${anim.id}"/>
                                    <button type="submit" class="btn btn-dark my-button">Перейти</button>
                                </form>
                            </a>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-4 col-sm-4">
                <div class="list-group my-list">
                    <a class="list-group-item nav-link active">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Фильтр</h5>
                        </div>
                    </a>
                    <form method="post">
                        <a class="list-group-item nav-link active text-bg-light">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Год</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedYear">
                                <option selected>Выберите год</option>
                                <c:if test="${requestScope.listForFilterYears != null}">
                                    <c:forEach var="year" items="${requestScope.listForFilterYears}">
                                        <option value="${year}"><c:out value="${year}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Жанры</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Выберите жанр" name="selectedGenre">
                                <option selected>Выберите жанр</option>
                                <c:if test="${requestScope.listForFilterGenres != null}">
                                    <c:forEach var="genre" items="${requestScope.listForFilterGenres}">
                                        <option value="${genre}"><c:out value="${genre}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Тип</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Выберите тип" name="selectedType">
                                <option selected>Выберите тип</option>
                                <c:if test="${requestScope.listForFilterTypes != null}">
                                    <c:forEach var="type" items="${requestScope.listForFilterTypes}">
                                        <option value="${type}"><c:out value="${type}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Статус</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedStatus">
                                <option selected>Выберите статус</option>
                                <c:if test="${requestScope.listForFilterStatus != null}">
                                    <c:forEach var="status" items="${requestScope.listForFilterStatus}">
                                        <option value="${status}"><c:out value="${status}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <a class="list-group-item nav-link active text-bg-light">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">Создатель</h5>
                            </div>
                            <p class="mb-1"><select class="form-select" aria-label="Default select example"
                                                    name="selectedAuthor">
                                <option selected>Выберите создателя</option>
                                <c:if test="${requestScope.listForFilterAuthors != null}">
                                    <c:forEach var="author" items="${requestScope.listForFilterAuthors}">
                                        <option value="${author}"><c:out value="${author}"/></option>
                                    </c:forEach>
                                </c:if>
                            </select></p>
                        </a>
                        <button type="submit" class="btn btn-dark my-button">Искать</button>
                    </form>
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
