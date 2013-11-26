<%@ page import="com.skeleton.core.Config" %>
<%@ page import="com.skeleton.util.DatabaseUtil" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Java Maven Jetty Skeleton Project</title>
        <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="/static/main.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <div class="container">

            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="brand" href="#">Java Maven Jetty Skeleton</a>
                    </div>
                </div>
            </div>
            <p>Database Storage: <%= DatabaseUtil.countWithSql(DatabaseUtil.Table.INSTAGRAM, "") %></p>
            <p>Java Properties File Storage: <%= Config.getProperty("database_connection") %></p>
            <p>Session storage: <%= com.skeleton.util.WebUtil.getSessionAttribute("value", request) %></p>
            <form class="form-inline" action="<%= com.skeleton.util.WebUtil.buildUrl(request, "/main") %>" method="post">
                <input name="value" value="">
                <input type="hidden" name="operation" value="test">
                <button class="btn btn-block btn-danger" type="submit">Update</button>
            </form>

        </div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
