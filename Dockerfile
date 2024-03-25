# FROM tomcat:10
# run cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
# run apt-get install maven*
# run mvn clean package
# run cd /target
# copy *.war /usr/local/tomcat/webapps
FROM tomcat:10

# Copy webapps from webapps.dist to webapps directory
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

# Copy the project files to the Docker image
COPY . /app

# Change working directory to the project directory
WORKDIR /app

# Build the Maven project and copy the artifact to webapps directory
RUN mvn clean package && \
    cp target/*.war /usr/local/tomcat/webapps

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

