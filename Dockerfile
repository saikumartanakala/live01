FROM tomcat:9
EXPOSE 8081
ADD ./target/*.war /usr/local/tomcat/webapps/ROOT.war
