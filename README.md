# [Skeleton](http://skeleton.dtheng.com)

Skeleton is a sleek, intuitive, and powerful full stack java framework for faster and easier web development, created by [Daniel Thengvall](http://dtheng.com).

To get started, check out <http://skeleton.dtheng.com>!

## Table of contents

 - [Quick start](#quick-start)
 - [Authors](#authors)
 - [Copyright and license](#copyright-and-license)

## Quick start

Clone the repo: `git clone https://github.com/DTHENG/skeleton.git`.

Importing the project:

#### IntelliJ
- Click *File > Import Project...*.
- Point to the cloned directory.
- Select *Import from existing model > Maven*

#### Eclipse
- Install the [m2e](http://eclipse.org/m2e/) plugin to enable improt from a maven pom file.
- Click *File > Import... > Maven > Existing Maven Project*.
- Point to the extracted directory and import the project.

Running a local development server:
```
$ mvn jetty:run
```


### What's included

Within the download you'll find the following directories and files, logically grouping common assets and providing both compiled and minified variations. You'll see something like this:

```
skeleton/
├── src/
|	├── main
|	|	├── java
|	|	|	└── com.skeleton
|	|	|		├── core
|	|	|		|	├── AuthFilter.java
|	|	|		|	├── Config.java
|	|	|		|	└── MainServlet.java
|	|	|		├──	tables
|	|	|		|	├── Instagram.java
|	|	|		|	├── InstagramContent.java
|	|	|		|	├── InstagramLike.java
|	|	|		|	├── InstagramType.java
|	|	|		|	└── Table.java
|	|	|		└──	util
|	|	|			├── DatabaseUtil.java
|	|	|			└── WebUtil.java
|	|	├── resources
|	|	|	└── skeleton.properties
|	|	└── webapp
|	|		├── static
|	|		|	├── css
|	|		|	|	├── foundation.css
|	|		|	|	├── foundation.min.css
|	|		|	|	└── normalize.css
|	|		|	└── js
|	|		|		└── vendor
|	|		|			├── custom.modernizr.js
|	|		|			├── fastclick.js
|	|		|			├── foundation.min.css
|	|		|			├── jquery.autocomplete.js
|	|		|			├── jquery.cookie.js
|	|		|			├── jquery.js
|	|		|			├── modernizr.js
|	|		|			└── placeholder.js
|	|		├── WEB-INF
|	|		|	└── web.xml
|	|		└── index.html
|	└── test
|		└── java
|			└── WebUtilTest.java
├── pom.xml
├── README.md
└── skeleton.iml
```


## Author

**Daniel Thengvall**

- <http://dtheng.com>
- <http://github.com/DTHENG>


## Copyright and license

Copyright 2011-2014 Daniel, Inc. under [the MIT license](LICENSE).
