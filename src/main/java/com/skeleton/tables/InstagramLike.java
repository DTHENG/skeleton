package com.skeleton.tables;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Daniel Thengvall
 */
public class InstagramLike extends Table {

    private long instagramId = 0l;
    private String username = "";
    private String profilePicture = "";
    private String likeId = "";
    private String fullName = "";

    public long getInstagramId() {
        return instagramId;
    }

    public void setInstagramId(long id) {
        instagramId = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String user) {
        username = user;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String picture) {
        profilePicture = picture;
    }

    public String getLikeId() {
        return likeId;
    }

    public void setLikeId(String id) {
        likeId = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String name) {
        fullName = name;
    }

    public static InstagramLike getInstagramLikeFromSqlResultSet(ResultSet rs) throws SQLException {
        InstagramLike like = new InstagramLike();
        like.setID(rs.getInt("id"));
        like.setInstagramId(rs.getInt("instagramId"));
        like.setUsername(rs.getString("username"));
        like.setProfilePicture(rs.getString("profilePicture"));
        like.setLikeId(rs.getString("likeId"));
        like.setFullName(rs.getString("fullName"));
        return like;
    }
}