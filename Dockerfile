FROM tomcat:9
// Run mkdir test
EXPOSE 8081
ADD ./target/live.war/ /usr/local/tomcat/webapps/
//ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz .
//COPY /var/lib/jenkins/workspace/docker_task/ /usr/local/tomcat/webapps/

