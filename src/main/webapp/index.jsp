<%@ page import="com.skeleton.core.Config" %>
<%@ page import="com.skeleton.util.DatabaseUtil" %>
<%@ page import="com.skeleton.util.WebUtil" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>skeleton4j - A java foundation</title>
        <link href="/static/css/foundation.min.css" rel="stylesheet" media="screen">
        <link href="/static/css/normalize.css" rel="stylesheet" media="screen">
        <script src="/static/js/vendor/modernizr.js"></script>
        <script src="/static/js/vendor/custom.modernizr.js"></script>
    </head>
    <body>
        <div style="background:#074e68;width:100%;float:left;">
            <div class="row">
                <div class="small-12 large-12 columns">
                    <a href="/" class="navbar-brand"><h1 style="color:#fff;">skeleton4j</h1></a>
                </div>
            </div>
            <hr style="border-top:1px solid rgba(255, 255, 255, 0.2);margin-top:0;"/>
            <div class="row">
                <div class="small-12 medium-6 large-7 columns">
                    <h4 class="subheader" style="color:#fff;">a sleek, intuitive, and powerful java foundation for faster and easier web development</h4>
                    <h6>&#160;</h6>
                    <a href="https://github.com/DTHENG/skeleton/archive/master.zip" class="button secondary">Download <span class="label secondary" style="margin-bottom:0;padding-left:3px;padding-right:0;background:none;">186 KB</span></a>
                    <h6>&#160;</h6>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="small-12 large-12 columns">
                <h6>&#160;</h6>
                <h3>Starter Features</h3>
                <h6>&#160;</h6>
                <div class="row">
                    <div class="small-12 medium-12 large-12 columns">
                        <h5><strong>Database</strong></h5>
                        <div class="row">
                            <div class="small-12 medium-8 large-8 columns">
                                <p><kbd>DatabaseUtil.count(Table.INSTAGRAM, "");</kbd></p>
                                <p>Returns <kbd><%= DatabaseUtil.count(DatabaseUtil.Table.INSTAGRAM, "") %></kbd></p>
                            </div>
                        </div>
                    </div>
                    <div class="small-12 medium-12 large-12 columns">
                        <h5><strong>Properties</strong></h5>
                        <div class="row">
                            <div class="small-12 medium-8 large-8 columns">
                                <p>
                                    <kbd>Config.getProperty( "database_connection" );</kbd>
                                </p>
                                <p>Returns <kbd><%= Config.getProperty("database_connection") %></kbd></p>
                            </div>
                        </div>
                    </div>
                    <div class="small-12 medium-12 large-12 columns">
                        <h5><strong>Session</strong></h5>
                        <div class="row">
                            <div class="small-12 medium-8 large-8 columns">
                                <p>
                                    <kbd>WebUtil.getSessionAttribute("value", request);</kbd>
                                </p>
                                <p>Returns <kbd><%= WebUtil.getSessionAttribute("value", request) %></kbd></p>
                            </div>
                            <div class="small-12 medium-4 large-4 columns">
                                <form action="<%= com.skeleton.util.WebUtil.buildUrl(request, "/sampleServlet") %>" method="post">
                                    <div class="row">
                                        <div class="large-8 medium-8 large-8 columns">
                                            <input name="value" type="text" placeholder="New Session Value" style="height:44px;"/>
                                        </div>
                                        <div class="large-4 medium-4 large-4 columns">
                                            <button class="button small expand" type="submit">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <h1>&#160;</h1>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="small-12 medium-12 large-12 columns">
                <h6>&#160;</h6>
                <h3>Quick start</h3>
                <h6>&#160;</h6>
                <p>Prerequisites:</p>
                <ul>
                    <li>
                        Java 1.7
                    </li>
                    <li>
                        <a href="http://maven.apache.org/" target="_blank">Apache Maven</a> - used for part of the build process
                    </li>
                </ul>
                <p>Clone the repo: <kbd>$ git clone https://github.com/DTHENG/skeleton.git</kbd>.</p>
                <p>Importing the project:</p>
                <h5><strong>IntelliJ</strong></h5>
                <ul>
                    <li>Click <strong>File > Import Project...</strong>.</li>
                    <li>Point to the cloned directory.</li>
                    <li>Select <strong>Import from existing model > Maven</strong></li>
                </ul>
                <h5><strong>Eclipse</strong></h5>
                <ul>
                    <li>Install the <a href="http://eclipse.org/m2e/" target="_blank">m2e</a> plugin to enable improt from a maven pom file.</li>
                    <li>Click <strong>File > Import... > Maven > Existing Maven Project</strong>.</li>
                    <li>Point to the extracted directory and import the project.</li>
                </ul>
                <p>Running a local development server:</p>
                <p><kbd>$ mvn jetty:run -Djetty.port=8077</kbd></p>
                <p>Then open <kbd>http://localhost:8077/</kbd> in a web browser.</p>
                <p>Create a deployable war file:</p>
                <p><kbd>$ mvn clean test compile war:war</kbd></p>
                <h1>&#160;</h1>
            </div>
        </div>
        <hr/>
        <div class="row hide-for-small">
            <div class="small-12 medium-12 large-12 columns">
                <h6>&#160;</h6>
                <h3>What&#39;s included</h3>
                <h6>&#160;</h6>
                <p>Within the download you&#39;ll find the following directories and files, logically grouping common assets and providing both compiled and minified variations. You&#39;ll see something like this:</p>
                <div class="panel">
                    <pre style="line-height:1.4em;">skeleton/
├── src/
|   ├── main/
|   |   ├── java/
|   |   |   └── com/
|   |   |       └── skeleton/
|   |   |           ├── core/
|   |   |           |   ├── Config.java
|   |   |           |   ├── SampleFilter.java
|   |   |           |   └── SampleServlet.java
|   |   |           ├── tables/
|   |   |           |   ├── Instagram.java
|   |   |           |   ├── InstagramContent.java
|   |   |           |   ├── InstagramLike.java
|   |   |           |   ├── InstagramType.java
|   |   |           |   └── Table.java
|   |   |           └── util/
|   |   |               ├── DatabaseUtil.java
|   |   |               └── WebUtil.java
|   |   ├── resources/
|   |   |   ├── skeleton.properties
|   |   |   └── skeleton.sql
|   |   └── webapp/
|   |       ├── static/
|   |       |   ├── css/
|   |       |   |   ├── foundation.css
|   |       |   |   ├── foundation.min.css
|   |       |   |   └── normalize.css
|   |       |   └── js/
|   |       |       └── vendor/
|   |       |           ├── custom.modernizr.js
|   |       |           ├── fastclick.js
|   |       |           ├── foundation.min.js
|   |       |           ├── jquery.autocomplete.js
|   |       |           ├── jquery.cookie.js
|   |       |           ├── jquery.js
|   |       |           ├── modernizr.js
|   |       |           └── placeholder.js
|   |       ├── WEB-INF/
|   |       |   └── web.xml
|   |       └── index.html
|   └── test/
|       └── java/
|           └── WebUtilTest.java
├── pom.xml
├── README.md
└── skeleton.iml</pre>
                </div>
                <h1>&#160;</h1>
            </div>
        </div>
        <hr class="hide-for-small"/>
        <div class="row">
            <div class="small-12 medium-12 large-12 columns">
                <h6>&#160;</h6>
                <h3>Authors</h3>
                <h6>&#160;</h6>
                <p><strong>Daniel Thengvall</strong></p>
                <ul>
                    <li>
                        <a href="http://dtheng.com" target="_blank">http://dtheng.com</a>
                    </li>
                    <li>
                        <a href="http://github.com/DTHENG" target="_blank">http://github.com/DTHENG</a>
                    </li>
                </ul>
                <h1>&#160;</h1>
            </div>
        </div>
        <div style="background:#333333;float:left;width:100%;">
            <h6>&#160;</h6>
            <h1>&#160;</h1>
            <div class="row">
                <div class="small-12 medium-8 large-8 columns">
                    <h3 style="color:#666666;">Copyright and license</h3>
                    <p style="color:#666666;">Copyright 2014 Daniel Thengvall, under <a href="http://opensource.org/licenses/MIT" target="_blank" style="color:#666666;text-decoration:underline">the MIT license</a>.</p>
                    <h1>&#160;</h1>
                </div>
                <div class="small-12 medium-4 large-4 columns">
                    <a href="https://github.com/DTHENG/skeleton/archive/master.zip" class="button secondary expand">Download <span class="label secondary" style="margin-bottom:0;padding-left:3px;padding-right:0;background:none;">186 KB</span></a>
                </div>
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
