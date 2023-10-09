FROM tomcat:9
EXPOSE 8081
ADD ./target/live/ /usr/local/tomcat/webapps/
