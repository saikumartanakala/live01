FROM tomcat:9
EXPOSE 8081
COPY /var/lib/jenkins/workspace/task2/target/ /usr/local/tomcat/webapps/
