<%@ page import="com.skeleton.core.Config" %>
<%@ page import="com.skeleton.util.DatabaseUtil" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Java Maven Jetty Skeleton Project</title>
        <link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="/static/main.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">Java Maven Jetty Skeleton</a>
                </div>
            </div>
        </header>
        <div class="container bs-docs-container">
            <div class="row">
                <div class="col-md-6" role="main">
                    <p>&#160;</p>
                    <p>Database Storage: <%= DatabaseUtil.count(DatabaseUtil.Table.INSTAGRAM, "") %></p>
                    <p>Java Properties File Storage: <%= Config.getProperty("database_connection") %></p>
                    <p>Session storage: <%= com.skeleton.util.WebUtil.getSessionAttribute("value", request) %></p>
                    <form class="form-inline" action="<%= com.skeleton.util.WebUtil.buildUrl(request, "/main") %>" method="post">
                        <input name="value" value="" placeholder="Session value">
                        <input type="hidden" name="operation" value="test">
                        <br/><br/>
                        <button class="btn btn-primary" type="submit">Update</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="/static/jquery.js"></script>
        <script src="/static/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
