package com.skeleton.tables;

import com.skeleton.util.DatabaseUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Instagram extends Table {

    public static Instagram getInstagramFromSqlResultSet(ResultSet rs) throws SQLException {
        Instagram instagram = new Instagram();
        instagram.setID(rs.getInt("id"));
        instagram.setLocationName(rs.getString("locationName"));
        instagram.setLink(rs.getString("link"));
        instagram.setType(rs.getInt("type"));
        instagram.setFilter(rs.getString("filter"));
        instagram.setCreatedTime(rs.getInt("createdTime"));
        instagram.setCaption(rs.getString("caption"));
        instagram.setUserHasLiked(rs.getInt("userHasLiked"));
        instagram.setInstagramId(rs.getString("instagramId"));
        instagram.setLatitude(rs.getDouble("latitude"));
        instagram.setLongitude(rs.getDouble("longitude"));
        instagram.setLocationName(rs.getString("locationName"));
        instagram.setLocationId(rs.getString("locationId"));
        for ( Object like : DatabaseUtil.find(DatabaseUtil.Table.INSTAGRAM_LIKE, "WHERE instagramId = ? ORDER BY id DESC", rs.getInt("id") + "") ) {
            if ( like instanceof InstagramLike ) {
                instagram.addLike((InstagramLike) like);
            }
        }
        for ( Object content : DatabaseUtil.find(DatabaseUtil.Table.INSTAGRAM_CONTENT, "WHERE instagramId = ?",
                rs.getInt("id")+"") ) {
            if ( content instanceof InstagramContent ) {
                instagram.addContent((InstagramContent) content);
            }
        }
        return instagram;
    }

    public static List<Instagram> getMostRecentInstagrams(int limit) {
        List<Instagram> instagrams = new ArrayList<Instagram>();
        for ( Object instagram : DatabaseUtil.find(DatabaseUtil.Table.INSTAGRAM, "ORDER BY createdTime DESC LIMIT "+limit) ) {
            if ( instagram instanceof Instagram ) {
                instagrams.add((Instagram) instagram);
            }
        }
        return instagrams;
    }

    private InstagramType type = InstagramType.IMAGE;
    private String filter = null;
    private int createdTime = 0;
    private String link = "";
    private String caption = null;
    private boolean userHasLiked = false;
    private String instagramId = "";
    private double latitude = 0d;
    private double longitude = 0d;
    private String locationName = null;
    private String locationId = null;
    private List<InstagramLike> likes = new ArrayList<InstagramLike>();
    private List<InstagramContent> content = new ArrayList<InstagramContent>();

    public InstagramType getType() {
        return type;
    }

    public void setType(int t) {
        for (InstagramType type : InstagramType.values()) {
            if ( type.ordinal() == t ) {
                this.type = type;
                break;
            }
        }
    }

    public String getFilter() {
        return filter;
    }

    public void setFilter(String filter) {
        this.filter = filter;
    }

    public int getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(int time) {
        createdTime = time;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public boolean getUserHasLiked() {
        return userHasLiked;
    }

    public void setUserHasLiked(int hasLiked) {
        this.userHasLiked = hasLiked == 1;
    }

    public String getInstagramId() {
        return instagramId;
    }

    public void setInstagramId(String id) {
        instagramId = id;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String name) {
        locationName = name;
    }

    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String id) {
        locationId = id;
    }

    public List<InstagramLike> getLikes() {
        return likes;
    }

    public void addLike(InstagramLike like) {
        likes.add(like);
    }

    public List<InstagramContent> getContent() {
        return content;
    }

    public void addContent(InstagramContent content) {
        this.content.add(content);
    }
}
