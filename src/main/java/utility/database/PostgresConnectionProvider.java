package utility.database;

import java.sql.*;

public class PostgresConnectionProvider {

    private static int count = 0;
    public static Connection getConnection() {
        try {
            Class.forName(PostgresDBConnectionData.DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("Unable to find driver class :(");
        }
        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DriverManager.getConnection(PostgresDBConnectionData.URL,
                    PostgresDBConnectionData.USERNAME,
                    PostgresDBConnectionData.PASSWORD);
            statement = connection.createStatement();
            if(count == 0) {
                count++;
                String sql = "CREATE DATABASE MySemWork";
                statement.executeUpdate(sql);

                sql = "CREATE TABLE public.animes (id bigint PRIMARY KEY NOT NULL, title varchar(100) NOT NULL, genre varchar(100) NOT NULL, author varchar(50) NOT NULL, link varchar(100), link_to_image varchar(100), type varchar(25) NOT NULL , status varchar(50) NOT NULL, year varchar(10) NOT NULL)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "INSERT INTO public.animes VALUES (1000, 'Блич: Тысячелетняя кровавая война', 'Фэнтези, Приключения, Сверхъестественное', 'Тайте Кубо', '/resources/videos/bleach.mp4', '/resources/images/bleach.jpg', 'ТВ Сериал', 'Онгоинг', '2022'), (1002, 'Человек-бензопила', 'Боевик, Фэнтези, Ужасы', 'Тацуки Фудзимото', '/resources/videos/chainsaw man.mp4', '/resources/images/Human-benz.png', 'ТВ Сериал', 'Онгоинг', '2022'), (1003, 'Семья шпиона', ' Боевик, Комедия, Шпионская фантастика', 'Тацуя Эндо', '/resources/videos/spy x family.mp4', '/resources/images/spy_family.jpg', 'ТВ Сериал', 'Онгоинг', '2022'), (1004, 'Киберпанк: Бегущие по краю', 'Фантастика, Экшен', 'CD Projekt Red', '/resources/videos/cyberpunk_edgerunners.mp4' , '/resources/images/cyberpank.jpg', 'ONA', 'Вышел', '2022'), (1005, 'Моб Психо 100', 'Комедия, Сверхъестественное, Супер сила, Экшен', 'One', '/resources/videos/mob psycho 100 III.mp4', '/resources/images/mob.jpg' , 'ТВ Сериал', 'Онгоинг', '2022'), (1006, 'Синяя тюрьма', 'Сёнэн, Спорт, Драма, Психология', 'Мунэюки Канэсиро', '/resources/videos/blue_lock.mp4', '/resources/images/blue_prison.jpg', 'ТВ Сериал', 'Онгоинг', '2022')";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "ALTER TABLE public.animes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "CREATE TABLE public.authors (id bigint PRIMARY KEY NOT NULL, name varchar(50) NOT NULL, info varchar(250) NOT NULL)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "INSERT INTO public.authors VALUES (2000, 'Тацуки Фудзимото', 'Тацуки Фудзимото - японский мангака, наиболее известный своими работами Fire Punch и «Человек-бензопила». Окончил среднюю школу Никахо префектуры Акита и университет искусств и дизайна Тохоку, учился на факультете изящных искусств.'), (2001, 'Тацуя Эндо', 'Тацуя Эндо - японский художник манги. Эндо наиболее известен по созданию манги Tista, Gekka Bijin и Spy × Family, а также других работ. Последняя работа в журнале Shonen Jump+ достигла рубежа в 10 миллионов физических и цифровых копий.'), (2002, 'CD Projekt Red', 'CD Projekt RED — компания-разработчик компьютерных игр, расположенная в Польше. Является дочерним предприятием компании CD Projekt.'), (2003, 'One', 'One - псевдоним японского мангаки, ставшего известным из-за перерисованной версии своей веб-манги «Ванпанчмен». ONE публикует  «Моб Психо 100» в онлайн-версии Weekly Shonen Sunday.'), (2004, 'Тайте Кубо', 'Тайте Кубо - японский мангака. Он наиболее известен своей мангой «Блич». Часто встречаются ошибочные варианты написания его псевдонима, например: Титэ Кубо, Кубо Тайт, Куботайт, Куботайто, Куботитэ.'), (2005, 'Мунэюки Канэсиро', 'Мунэюки Канэсиро - японский художник манги. Он дебютировал в 2011 году в фильме По воле богов, который был экранизирован. В 2018 году он выпустил Синий замок с Юсуке Номурой, который получил 45-ю премию Коданша Манга в категории сенэн.')";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "ALTER TABLE public.authors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "CREATE TABLE public.genres (id bigint PRIMARY KEY NOT NULL, name varchar(50) NOT NULL, info varchar(250) NOT NULL)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "INSERT INTO public.genres VALUES (1, 'Фэнтези', 'Фэнтези — занимает особую нишу в области анимационного творчества. Данный жанр привлекает зрителей своими оригинальными сюжетами и яркими персонажами.'), (2, 'Приключения', 'Приключения — в аниме являются очень востребованным жанром, ведь они рассказывают публике невероятно интересные и захватывающие истории. Главные герои картин данного стиля живут в поразительной атмосфере бесконечных происшествий и испытаний.'), (3, 'Сверхъестественное', 'Сверхъестественное — основной акцент делается на сверхъестественных и необъяснимых явлениях. Непременные персонажи этого жанра - вампиры, призраки, духи, демоны. '), (4, 'Боевик', '-'), (5, 'Ужасы', 'Ужасы — с первых секунд вызывает у зрителей дикий поток острых ощущений, невероятного напряжения и бушующего адреналина. Зачастую совершенно невозможно предугадать, куда заведёт сюжетная линия.'), (6, 'Комедия', 'Комедия — в этом жанре основной упор делается на юмор. Он предназначен для легкого восприятия, где зрители могут отдохнуть от обыденной рутины и насладиться смешными и забавными сценами.'), (7, 'Шпионская фантастика', '-'), (8, 'Фантастика', '-'), (9, 'Экшен', 'Экшен - этому жанру свойственна динамичность и быстрое развитие событий. Чаще всего, вы будете свидетелями захватывающих сражений и боевых сцен. Сюжет построен на сильном эмоциональном напряжении, ему характерен накал страстей и резкие спады.'), (10, 'Супер сила', '-')";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "ALTER TABLE public.genres ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "CREATE TABLE public.users (id bigint PRIMARY KEY NOT NULL, login varchar(50) NOT NULL, password varchar(100) NOT NULL, role varchar(50) NOT NULL)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "INSERT INTO public.users VALUES(1, 'Admin', '$2a$12$8JQSoHw7nIx7jikippsQe.amWvWZNigK2n4yLUSUYD4VJUeqt5b.m', 'admin'), (2, 'Test', '$2a$12$Ihk3ufcLA2IJGikXHt4Meup9vL.ZtvLXVQXJ27G5Zh5AnoiQCWCaK', 'default')";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();

                sql = "ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();
            }

            return connection;
        } catch (SQLException e) {
            System.out.println("Unable to receive connection :(");
            throw new RuntimeException(e);
        }
    }
}
