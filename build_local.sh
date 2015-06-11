#!/usr/bin/env bash

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

echo "javac classes"
mkdir classes
javac src/com/john/DownloadServlet.java -cp ./lib/javaee.jar -d classes
javac src/com/john/PlayServlet.java -cp ./lib/javaee.jar -d classes

echo "cp classes"
cp ./classes/com/john/DownloadServlet.class ~/tools/tomcat/webapps/servlet/WEB-INF/classes/com/john/
cp ./classes/com/john/PlayServlet.class ~/tools/tomcat/webapps/servlet/WEB-INF/classes/com/john/

echo "cp web.xml"
cp ./WEB-INF/web.xml ~/tools/tomcat/webapps/servlet/WEB-INF/

echo "restart tomcat"
/Users/john/tools/tomcat/bin/catalina.sh stop
/Users/john/tools/tomcat/bin/catalina.sh start
