package com.skeleton.util;

import com.skeleton.core.Config;
import com.skeleton.tables.Instagram;
import com.skeleton.tables.InstagramContent;
import com.skeleton.tables.InstagramLike;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

public class DatabaseUtil {

    private static final Logger LOG = Logger.getLogger(DatabaseUtil.class.getSimpleName());

    public enum Table {
        INSTAGRAM,
        INSTAGRAM_COMMENT,
        INSTAGRAM_LIKE,
        INSTAGRAM_CONTENT;

        public String getTitle() {
            switch(this){
                case INSTAGRAM          : return "instagram";
                case INSTAGRAM_COMMENT  : return "instagramComment";
                case INSTAGRAM_LIKE     : return "instagramLike";
                case INSTAGRAM_CONTENT  : return "instagramContent";
                default                 : return null;
            }
        }
    }

    public static Connection getConnection() throws SQLException {

        Properties properties = Config.getProperties();

        String username = properties.getProperty("database_username");
        String password = properties.getProperty("database_password");
        String databaseName = properties.getProperty("database_name");
        String connection = properties.getProperty("database_connection");

        return DriverManager.getConnection(connection + databaseName, username, password);
    }

    public static int insert(String insert,String... args) {
        return executePreparedStatement(insert,args);
    }

    public static List<Object> findWithSql(Table table,String whereStatement,String... id) {
        String sql = "SELECT * FROM "+ table.getTitle() +" "+ whereStatement;
        return executeCallableStatement(table,sql,id);
    }

    public static int countWithSql(Table table,String whereStatement,String... id) {
        String sql = "SELECT count(*) FROM "+ table.getTitle() +" "+ whereStatement;
        return executeCallableStatement(sql,id);
    }

    public static int getIdWithSql(Table table,String whereStatement,String... id) {
        String sql = "SELECT id FROM "+ table.getTitle() +" "+ whereStatement;
        return executeCallableStatement(sql,id);
    }

    private static List<Object> executeCallableStatement(Table table,String sql, String[] args) {
        try {
            List<Object> response = new ArrayList<Object>();
            getMysqlJdbcDriver();
            Connection conn = null;
            CallableStatement stmt = null;
            ResultSet rs = null;
            try {
                logDatabaseActivity(sql);
                conn = getConnection();
                stmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                addArgumentsToCallableStatement(stmt,args);
                rs = stmt.executeQuery();
                rs.last();
                if ( rs.getRow() > 0 ) {
                    rs.beforeFirst();
                    while ( rs.next() ) {
                        response.add(getResultSetFromTable(table,rs));
                    }
                }
            } finally {
                closeCallableStatement(rs,stmt,conn);
            }
            return response;
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
        return new ArrayList<Object>();
    }

    private static int executeCallableStatement(String sql, String[] args) {
        int records = 0;
        try {
            getMysqlJdbcDriver();
            Connection conn = null;
            CallableStatement stmt = null;
            ResultSet rs = null;
            try {
                logDatabaseActivity(sql);
                conn = getConnection();
                stmt = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                addArgumentsToCallableStatement(stmt,args);
                rs = stmt.executeQuery();
                rs.last();
                if ( rs.getRow() > 0 ) {
                    rs.beforeFirst();
                    rs.next();
                    records = rs.getInt(1);
                }
            } finally {
                closeCallableStatement(rs,stmt,conn);
            }
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
        return records;
    }

    private static int executePreparedStatement(String sqlInsert, String[] args) {
        int index = 0;
        try {
            getMysqlJdbcDriver();
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet keys = null;
            try {
                conn = getConnection();
                stmt = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);

                addArgumentsToPreparedStatement(stmt,args);

                int affected = stmt.executeUpdate();

                if ( affected == 1 ) {
                    keys = stmt.getGeneratedKeys();
                    keys.next();
                    index = keys.getInt(1);
                    logDatabaseActivity(sqlInsert);
                } else {
                    System.err.println("No rows affected");
                }
            } finally {
                closePreparedStatement(keys,stmt,conn);
            }
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
        return index;
    }

    private static void closeCallableStatement(ResultSet rs, CallableStatement stmt, Connection conn) {
        try {

            if ( rs != null ) {
                rs.close();
            }
            if ( stmt != null ) {
                stmt.close();
            }
            if ( conn != null ) {
                conn.close();
            }
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
    }

    private static void closePreparedStatement(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if ( rs != null ) {
                rs.close();
            }
            if ( stmt != null ) {
                stmt.close();
            }
            if ( conn != null ) {
                conn.close();
            }
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
    }

    public static void addArgumentsToPreparedStatement(PreparedStatement stmt, String[] args) {
        for ( int i = 0; i < args.length; i++ ) {
            try {
                stmt.setString(i+1,args[i]);
            } catch (SQLException sqle) {
                LOG.warning(sqle.toString());
            }
        }
    }

    public static void addArgumentsToCallableStatement(CallableStatement stmt, String[] args) {
        for ( int i = 0; i < args.length; i++ ) {
            try {
                stmt.setString(i+1,args[i]);
            } catch (SQLException sqle) {
                LOG.warning(sqle.toString());
            }
        }
    }

    private static void logDatabaseActivity(String sql) {
        LOG.info(sql);
    }

    private static void getMysqlJdbcDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch ( ClassNotFoundException cnfe ) {
            cnfe.printStackTrace();
        }
    }

    public static Object getResultSetFromTable(Table table, ResultSet rs) {
        try {
            switch(table) {
                case INSTAGRAM          : return Instagram.getInstagramFromSqlResultSet(rs);
                case INSTAGRAM_LIKE     : return InstagramLike.getInstagramLikeFromSqlResultSet(rs);
                case INSTAGRAM_CONTENT  : return InstagramContent.getInstagramContentFromSqlResultSet(rs);
                default                 : return null;
            }
        } catch (SQLException sqle) {
            LOG.warning(sqle.toString());
        }
        return null;
    }
}
