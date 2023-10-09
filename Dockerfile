FROM tomcat:9
EXPOSE 8081
ADD ./target/live.war/ /usr/local/tomcat/webapps/
