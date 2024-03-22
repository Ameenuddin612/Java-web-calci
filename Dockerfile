FROM tomcat:10
run cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
run apt-get install maven*
run mvn clean package
run cd /target
copy *.war /usr/local/tomcat/webapps
