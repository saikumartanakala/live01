
# docker_task

step-1
1. launch a aws instance
2. connect the instance
step-2
1. search the jenkins installation
2. paste jenkins commands(sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
   sudo yum upgrade
    # Add required dependencies for the jenkins package
    sudo yum install fontconfig java-17-openjdk
    sudo yum install jenkins
    sudo systemctl daemon-reload)
3.check the status (systemctl status jenkins)
4. again yum install jenkins
5. yum install java -y
6.systemctl start jenkins
7. systemctl status jenkins
8. enable the 8080 port in aws server(http://13.54.14.231:8080/)(refresh)
9. open the jenkins dashboard copy this path (/var/lib/jenkins/secrets/initialAdminPassword)
10. cat /var/lib/jenkins/secrets/initialAdminPassword (in server) (it give the password)
11. after the process select suggested plugins
12.give the username and password in jenkins dashboard
step-3
CONFIGURE THE JENKINS JOB
1. goto manage jenkins-->click on plugins---->click on avaliable plugins---->
2. 1.maven integration 2. pipeline maven integration 3. pipeline utility steps 4. CloudBees Docker Build and PublishVersion  5. docker 6. docker-build step  7. slack notification (install 7 plugins) & restart jenkins
STEP-3
1. click on new item
2. select pipeline
3. ok
in general
1. select the github project
2. enter hithub repo(https://github.com/saikumartanakala/live01)
In build trigger
1. Build whenever a SNAPSHOT dependency is built
2. GitHub hook trigger for GITScm polling
In pipeline
1. select pipeline script from scm
2. select scm as a git
3. enter git repo
4. At this time need  to install git in server
5. add the git repo and add git username  & password
6. Script Path is jenkinsfile

required packages
1. git
2. maven
3. jenkins
4. docker

step -4
1. + docker build -t saikumartanakala/task6 .
   Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post
1. sudo usermod -aG docker jenkins
2. sudo systemctl restart jenkins
3. groups jenkins (check it comes like this "jenkins : jenkins docker")
4. build the job

step -5
1. After build
2. errpr like this
3. + docker login -u saikumartanakala p
   Error: Cannot perform an interactive login from a non TTY device
4. sh "docker login -u saikumartanakala -p ${dockerhub}"  () insteed of  use {}
5. build success


step 6
CONFIGURE THE SLACK NOTIFICATION
1. go to manage jenkins
2. select system configure scroll down
3. got to slack app
4. click on user  and go to settings and go to the manage app redirect to browser
5. search Jenkins CI and click on add  to slack
6. add slack channel
7. add the Jenkins CI integration.
8. add crridentials----->jenkins
9. select kind as secret text paste it Integration Token Credential ID copy
10. click add
11. member id  is a channel id
12. and check the connection
13. apply and save
14. in jenkins freestyle project setup oin post-build action
15. in jenkins pipeline project set the small changes
16 edit to commits
