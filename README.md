
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
2. 1.maven integration 2. pipeline maven integration 3. pipeline utility steps(install 3 plugins) & restart jenkins
STEP-3
1. click on new item
2. select pipeline
3. ok
in general
1. select the github project
2. enter hithub repo(https://github.com/saikumartanakala/live01)
done
done
