<%@ page import="com.skeleton.core.Config" %>
<%@ page import="com.skeleton.util.DatabaseUtil" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Skeleton</title>
        <link href="/static/css/foundation.min.css" rel="stylesheet" media="screen">
        <link href="/static/css/normalize.css" rel="stylesheet" media="screen">
        <script src="/static/js/vendor/modernizr.js"></script>
        <script src="/static/js/vendor/custom.modernizr.js"></script>
    </head>
    <body>
        <div class="row">
            <div class="small-12 large-12 columns">
                <a href="#" class="navbar-brand"><h1>Skeleton</h1></a>
            </div>
        </div>
        <div class="row">
            <div class="small-12 large-12 columns">
                <p>&#160;</p>
                <p>Database Storage: <%= DatabaseUtil.count(DatabaseUtil.Table.INSTAGRAM, "") %></p>
                <p>Properties File Storage: <%= Config.getProperty("database_connection") %></p>
                <p>Session Storage: <%= com.skeleton.util.WebUtil.getSessionAttribute("value", request) %></p>
                <form class="form-inline" action="<%= com.skeleton.util.WebUtil.buildUrl(request, "/main") %>" method="post">
                    <input name="value" value="" placeholder="Session value">
                    <input type="hidden" name="operation" value="test">
                    <br/><br/>
                    <button class="btn btn-primary" type="submit">Update</button>
                </form>
            </div>
        </div>
        <script src="/static/js/vendor/jquery.js"></script>
        <script src="/static/js/vendor/foundation.min.js"></script>
        <script src="/static/js/vendor/fastclick.js"></script>
        <script src="/static/js/vendor/placeholder.js"></script>
        <script src="/static/js/vendor/jquery.autocomplete.js"></script>
        <script src="/static/js/vendor/jquery.cookie.js"></script>
    </body>
</html>
