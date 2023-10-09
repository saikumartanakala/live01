FROM tomcat:9
EXPOSE 8085
ADD ./target/live/ /usr/local/tomcat/webapps/
