package utility.database;

import models.AnimEntity;
import models.AuthorEntity;
import models.GenreEntity;
import models.UserEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetDataFromDB {

    public static List<AnimEntity> getAnimTableData() throws SQLException {
        Connection myConnection = PostgresConnectionProvider.getConnection();
        List<AnimEntity> anime = new ArrayList<>();
        String sqlQuery = "SELECT * FROM animes";
        PreparedStatement statement = myConnection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            AnimEntity animEntity = new AnimEntity();
            animEntity.setId(resultSet.getLong("id"));
            animEntity.setTitle(resultSet.getString("title"));
            animEntity.setGenre(resultSet.getString("genre"));
            animEntity.setAuthor(resultSet.getString("author"));
            animEntity.setLink(resultSet.getString("link"));
            animEntity.setLinkToImage(resultSet.getString("link_to_image"));
            animEntity.setYear(resultSet.getString("year"));
            animEntity.setType(resultSet.getString("type"));
            animEntity.setStatus(resultSet.getString("status"));
            anime.add(animEntity);
        }
        return anime;
    }

    public static List<AuthorEntity> getAuthorsTableData() throws SQLException {
        Connection myConnection = PostgresConnectionProvider.getConnection();
        List<AuthorEntity> authorEntities = new ArrayList<>();
        String sqlQuery = "SELECT * FROM authors";
        PreparedStatement statement = myConnection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            AuthorEntity authorEntity = new AuthorEntity();
            authorEntity.setId(resultSet.getLong("id"));
            authorEntity.setName(resultSet.getString("name"));
            authorEntity.setInfo(resultSet.getString("info"));
            authorEntities.add(authorEntity);
        }
        return authorEntities;
    }

    public static List<GenreEntity> getGenresTableData() throws SQLException {
        Connection myConnection = PostgresConnectionProvider.getConnection();
        List<GenreEntity> genreEntities = new ArrayList<>();
        String sqlQuery = "SELECT * FROM genres";
        PreparedStatement statement = myConnection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            GenreEntity genreEntity = new GenreEntity();
            genreEntity.setId(resultSet.getLong("id"));
            genreEntity.setName(resultSet.getString("name"));
            genreEntity.setInfo(resultSet.getString("info"));
            genreEntities.add(genreEntity);
        }
        return genreEntities;
    }

    public static List<UserEntity> getAllUsers() throws SQLException {
        Connection myConnection = PostgresConnectionProvider.getConnection();
        List<UserEntity> allUsers = new ArrayList<>();
        String sqlQuery = "SELECT * FROM users";
        PreparedStatement statement = myConnection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            UserEntity userEntity = new UserEntity();
            userEntity.setId(resultSet.getLong("id"));
            userEntity.setLogin(resultSet.getString("login"));
            userEntity.setPassword(resultSet.getString("password"));
            userEntity.setRole(resultSet.getString("role"));
            allUsers.add(userEntity);
        }
        return allUsers;
    }
}
