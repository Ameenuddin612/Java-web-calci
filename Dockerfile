FROM tomcat:10
run cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
copy ./target/*.war /usr/local/tomcat/webapps
EXPOSE 80
ENTRYPOINT ["catalina.sh","run"]
