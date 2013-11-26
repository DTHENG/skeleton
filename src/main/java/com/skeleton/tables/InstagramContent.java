package com.skeleton.tables;

import java.sql.ResultSet;
import java.sql.SQLException;

public class InstagramContent extends Table {

    private int instagramId = 0;
    private ContentSize size = ContentSize.LARGE;
    private InstagramType type = InstagramType.IMAGE;
    private String url = "";

    public int getInstagramId() {
        return instagramId;
    }

    public void setInstagramId(int id) {
        instagramId = id;
    }

    public ContentSize getSize() {
        return size;
    }

    public void setSize(ContentSize size) {
        this.size = size;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public InstagramType getType() {
        return type;
    }

    public void setType(int type) {
        this.type = InstagramType.getFromInt(type);
    }

    public static InstagramContent getInstagramContentFromSqlResultSet(ResultSet rs) throws SQLException {
        InstagramContent item = new InstagramContent();
        item.setID(rs.getInt("id"));
        item.setInstagramId(rs.getInt("instagramId"));
        item.setSize(ContentSize.getFromInt(rs.getInt("size")));
        item.setType(rs.getInt("type"));
        item.setUrl(rs.getString("url"));
        return item;
    }

    public enum ContentSize {
        SMALL,LARGE,MEDIUM;

        public static ContentSize getFromInt(int ct) {
            for ( ContentSize type : ContentSize.values() ) {
                if ( type.ordinal() == ct ) {
                    return type;
                }
            }
            return null;
        }
    }

    public static String getContentTypeJsonTitle(ContentSize c) {
        switch(c){
            case SMALL      : return "low_resolution";
            case MEDIUM     : return "thumbnail";
            default         : return "standard_resolution";
        }
    }
}
