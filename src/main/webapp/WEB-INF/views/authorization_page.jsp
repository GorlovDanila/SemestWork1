<%--
  Created by IntelliJ IDEA.
  User: danil
  Date: 17.10.2022
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Авторизация</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">
    <link href="/resources/css/base.css" rel="stylesheet">
    <link href="/resources/css/authorization_page.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/50e3c0bd8c.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/f93f6752bd.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body class="text-center">
<nav class="navbar fixed-top navbar-expand-md bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img src="/resources/logos/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Аниме</a>
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
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-current="page" href="#"><i
                            class="fa-solid fa-door-open fa-xl"></i></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/authorization">Вход</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="/registration">Регистрация</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="form-signin">
    <form method="post">
        <img class="mb-4" src="/resources/logos/girl-160326.svg" alt="" width="100">
        <h1 class="h3 mb-3 fw-normal">Форма входа</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="personLogin">
            <label for="floatingInput">Login</label>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="personPassword">
            <label for="floatingPassword">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">Войти</button>
    </form>
</main>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast2" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false">
        <div class="toast-header">
            <img src="/resources/logos/logo.png" class="rounded me-2">
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Закрыть" style="padding-left: 400px"></button>
        </div>
        <div class="toast-body">
            Вас перекинет на страницу регистрации, если пользователь с такими данными не существует!
        </div>
    </div>
</div>
<script src="/resources/js/toast.js" rel="script"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>

