<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 23.10.2022
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Тайтл</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"
            integrity="sha512-6UofPqm0QupIL0kzS/UIzekR73/luZdC6i/kXDbWnLOJoqwklBK6519iUnShaYceJ0y4FaiPtX/hRnV/X/xlUQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="/resources/mediaElement/mediaelementplayer.min.css"
          rel="stylesheet">
    <link href="/resources/mediaElementPlugin/loop.min.css"
          rel="stylesheet"/>
    <link href="/resources/mediaElementPlugin/playlist.min.css"
          rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
    <link href="/resources/css/base.css" rel="stylesheet">
    <link href="/resources/css/anime_page.css" rel="stylesheet">
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
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="main-content">
    <div class="container my-cont">
        <div class="row">
            <div class="col-lg-4 col-sm-4">
                <c:if test="${requestScope.myAnimEntity != null}">
                <c:set var="title" value="${requestScope.myAnimEntity}"/>
                <img class="my-img" src="${title.linkToImage}" width="250px">
            </div>
            <div class="col-lg-8 col-sm-8">
                <div class="my-text">
                    Тип: <c:out value="${title.type}"/>
                    <br>
                    Статус: <c:out value="${title.status}"/>
                    <br>
                    Год: <c:out value="${title.year}"/>
                    <br>
                    Жанр: <c:out value="${title.genre}"/>
                    <br>
                    Автор: <c:out value="${title.author}"/>
                    <br>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-sm-1">
        </div>
        <div class="col-lg-10 col-sm-10 my-center">
            <h5>Смотреть аниме «<c:out value="${title.title}"/>» онлайн</h5>
            <video data-cast-title="CodeTube Playlist" data-cast-description="Description codetube tuttorial"
                   width="925" height="480">
                <source title="Trailer" data-playlist-thumbnail="${title.linkToImage}" src="${title.link}"
                        type="video/mp4">
                <source title="2" data-playlist-thumbnail="${title.linkToImage}" src="/resources/videos/test.mp4"
                        type="video/mp4">
            </video>
        </div>
        <div class="col-lg-1 col-sm-1">
        </div>
    </div>
</div>
<script src="/resources/mediaElement/mediaelement-and-player.min.js"></script>
<script src="/resources/mediaElementPlugin/loop.min.js"></script>
<script src="/resources/mediaElementPlugin/playlist.min.js"></script>
<script src="/resources/js/videoplayer.js" rel="script"></script>
</body>
</html>
