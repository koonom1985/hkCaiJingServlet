#!/usr/bin/env bash

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

echo "javac classes"
javac src/com/john/DownloadServlet.java -cp ./lib/javaee.jar -d classes
javac src/com/john/PlayServlet.java -cp ./lib/javaee.jar -d classes

echo "create hkcaijing webapp"
mkdir ~/tomcat/webapps/hkcaijing
mkdir ~/tomcat/webapps/hkcaijing/WEB-INF/
mkdir ~/tomcat/webapps/hkcaijing/WEB-INF/classes
mkdir ~/tomcat/webapps/hkcaijing/WEB-INF/classes/com
mkdir ~/tomcat/webapps/hkcaijing/WEB-INF/classes/com/john


echo "cp classes"
cp ./classes/com/john/DownloadServlet.class ~/tomcat/webapps/hkcaijing/WEB-INF/classes/com/john/
cp ./classes/com/john/PlayServlet.class ~/tomcat/webapps/hkcaijing/WEB-INF/classes/com/john/

echo "cp web.xml"
cp ./WEB-INF/web.xml ~/tomcat/webapps/hkcaijing/WEB-INF/