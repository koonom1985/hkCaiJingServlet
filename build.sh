#!/usr/bin/env bash

export JAVA_HOME=/usr/lib/jvm/java-7-oracle

echo "javac classes"
mkdir classes
javac src/com/john/DownloadServlet.java -cp ./lib/javaee.jar -d classes
javac src/com/john/PlayServlet.java -cp ./lib/javaee.jar -d classes

echo "create hkcaijing webapp"
mkdir ~/tomcat7/webapps/hkcaijing
mkdir ~/tomcat7/webapps/hkcaijing/WEB-INF/
mkdir ~/tomcat7/webapps/hkcaijing/WEB-INF/classes
mkdir ~/tomcat7/webapps/hkcaijing/WEB-INF/classes/com
mkdir ~/tomcat7/webapps/hkcaijing/WEB-INF/classes/com/john


echo "cp classes"
cp ./classes/com/john/DownloadServlet.class ~/tomcat7/webapps/hkcaijing/WEB-INF/classes/com/john/
cp ./classes/com/john/PlayServlet.class ~/tomcat7/webapps/hkcaijing/WEB-INF/classes/com/john/

echo "cp web.xml"
cp ./WEB-INF/web.xml ~/tomcat7/webapps/hkcaijing/WEB-INF/
