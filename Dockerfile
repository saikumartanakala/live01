FROM tomcat:9
EXPOSE 8081
ADD /var/lib/jenkins/workspace/task2/target/live.war/ /usr/local/tomcat/webapps/
