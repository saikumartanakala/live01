FROM tomcat:9
LABEL maintainers "SAI KUMAR"
EXPOSE 8081
ADD ./target/*.war /usr/local/tomcat/webapps/ROOT.war
