package models;

public class AnimEntity {
    private long id;
    private String title;
    private String genre;
    private String author;
    private String link;
    private String linkToImage;

    private String year;
    private String type;
    private String status;

    private long countEpisodes;

    public long getCountEpisodes() {
        return countEpisodes;
    }

    public void setCountEpisodes(long countEpisodes) {
        this.countEpisodes = countEpisodes;
    }

    @Override
    public String toString() {
        return "AnimEntity{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", genre='" + genre + '\'' +
                ", author='" + author + '\'' +
                ", link='" + link + '\'' +
                ", linkToImage='" + linkToImage + '\'' +
                ", year=" + year +
                ", type='" + type + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getLinkToImage() {
        return linkToImage;
    }

    public void setLinkToImage(String linkToImage) {
        this.linkToImage = linkToImage;
    }
}
