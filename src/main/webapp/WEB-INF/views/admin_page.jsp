<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 21.10.2022
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Админка</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
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
<section class="main-content">
    <div class="container">
        <div class="row">
            <div class="col">
                <main class="form-signin">
                    <form method="post">
                        <h1 class="h3 mb-3 fw-normal" style="text-align: center; padding-top: 50px">Форма добавления сущности
                            аниме/автор</h1>
                        <div class="row" style="padding-top: 5px">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputTitleAnime"
                                           placeholder="name@example.com"
                                           name="titleNewAnime">
                                    <label for="floatingInputTitleAnime">Title new anime</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputGenreNewTitle"
                                           placeholder="name@example.com"
                                           name="newAnimeGenre">
                                    <label for="floatingInputGenreNewTitle">Genre new anime</label>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputNameNewAuthorAdd"
                                           placeholder="name@example.com"
                                           name="nameNewAuthor">
                                    <label for="floatingInputNameNewAuthorAdd">Name new author</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputYearNewAnime"
                                           placeholder="name@example.com"
                                           name="yearNewAnime">
                                    <label for="floatingInputYearNewAnime">Year new anime</label>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-top: 5px">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputTypeNewAnime"
                                           placeholder="name@example.com"
                                           name="typeNewAnime">
                                    <label for="floatingInputTypeNewAnime">Type new anime</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputStatusNewAnime"
                                           placeholder="name@example.com"
                                           name="statusNewAnime">
                                    <label for="floatingInputStatusNewAnime">Status new anime</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-floating" style="padding-top: 5px">
                            <input type="text" class="form-control" id="floatingInputInfoNewAuthorAdd"
                                   placeholder="Password"
                                   name="infoNewAuthor">
                            <label for="floatingInputInfoNewAuthorAdd">Info about new author</label>
                        </div>
                        <h1 class="h3 mb-3 fw-normal" style="text-align: center; padding-top: 15px">Форма удаления
                            сущности аниме/автор</h1>
                        <p class="mb-1"><select class="form-select" aria-label="Name author to delete" name="nameDeleteAuthor">
                            <option selected>Выберите имя автора для удаления</option>
                            <c:if test="${requestScope.authorList!= null}">
                                <c:forEach var="author" items="${requestScope.authorList}">
                                    <option value="${author.name}"><c:out value="${author.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>
                        <p class="mb-1"><select class="form-select" aria-label="Title anime to delete" name="titleAnimeDelete">
                            <option selected>Выберите название аниме для удаления</option>
                            <c:if test="${requestScope.animList!= null}">
                                <c:forEach var="anim" items="${requestScope.animList}">
                                    <option value="${anim.title}"><c:out value="${anim.title}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>

                        <h1 class="h3 mb-3 fw-normal" style="text-align: center; padding-top: 15px">Форма изменения
                            сущности автор</h1>

                        <p class="mb-1"><select class="form-select" aria-label="Name author to edit" name="NameLastAuthor">
                            <option selected>Выберите имя автора для изменения</option>
                            <c:if test="${requestScope.authorList!= null}">
                                <c:forEach var="author" items="${requestScope.authorList}">
                                    <option value="${author.name}"><c:out value="${author.name}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>

                        <div class="form-floating" style="padding-top: 5px">
                            <input type="text" class="form-control" id="floatingInputNameNewAuthor"
                                   placeholder="Password"
                                   name="NameNewAuthor">
                            <label for="floatingInputNameNewAuthor">Name new author</label>
                        </div>
                        <p class="mb-1"><select class="form-select" aria-label="Info author to edit" name="InfoLastAuthor">
                            <option selected>Выберите информацию об авторе для изменения</option>
                            <c:if test="${requestScope.authorList!= null}">
                                <c:forEach var="author" items="${requestScope.authorList}">
                                    <option value="${author.info}"><c:out value="${author.info}"/></option>
                                </c:forEach>
                            </c:if>
                        </select></p>
                        <div class="form-floating" style="padding-top: 5px">
                            <input type="text" class="form-control" id="floatingInputInfoNewAuthor"
                                   placeholder="Password"
                                   name="InfoNewAuthor">
                            <label for="floatingInputInfoNewAuthor">Info about new author</label>
                        </div>
                        <button class="w-100 btn btn-lg btn-dark" style="padding-top: 5px" type="submit">Подтвердить
                        </button>
                    </form>
                </main>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Info</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${requestScope.authorList!= null}">
                        <c:forEach var="author" items="${requestScope.authorList}">
                            <tr>
                                <th scope="row"><c:out value="${author.id}"/></th>
                                <td><c:out value="${author.name}"/></td>
                                <td><c:out value="${author.info}"/></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <table class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Title</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Author</th>
                        <th scope="col">Year</th>
                        <th scope="col">Type</th>
                        <th scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${requestScope.animList!= null}">
                        <c:forEach var="anim" items="${requestScope.animList}">
                            <tr>
                                <th scope="row"><c:out value="${anim.id}"/></th>
                                <td><c:out value="${anim.title}"/></td>
                                <td><c:out value="${anim.genre}"/></td>
                                <td><c:out value="${anim.author}"/></td>
                                <td><c:out value="${anim.year}"/></td>
                                <td><c:out value="${anim.type}"/></td>
                                <td><c:out value="${anim.status}"/></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
</html>
