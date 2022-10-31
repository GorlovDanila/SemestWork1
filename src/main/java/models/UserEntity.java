package models;

import java.util.List;

public class UserEntity {
    private Long id;
    private String login;
    private String password;
    private String role;

    private List<AnimEntity> listViewed;

    public List<AnimEntity> getListViewed() {
        return listViewed;
    }

    public void setListViewed(List<AnimEntity> listViewed) {
        this.listViewed = listViewed;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
