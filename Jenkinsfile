pipeline {
    agent any
    tools{ 
        dockerTool 'docker'
         }
    stages {
        stage('checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saikumartanakala/live01.git'
               // checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/saikumartanakala/live01.git/']]])
            }
        }
        stage('Build maven') {
            steps {
                sh 'mvn clean install'
            }
        }
      /*  stage('Docker start') {
            steps {
                sh 'systemctl start docker'
            }
        }*/
        stage('docker build') {
            steps {
                sh 'docker build -t saikumartanakala/cakezone .'
            }
        }
        stage('login') {
            steps {
               // sh 'docker login -u saikumartanakala -p Saikumar@7979'
               withDockerRegistry(credentialsId: 'a421b438-9344-45ea-bdae-fe208c997db7') {
                sh 'docker build -t cakezone:latest .'
                 sh 'docker tag cakezone:latest saikumartanakala/cakezone:latest'
                sh 'docker push saikumartanakala/cakezone:latest' 
                sh 'docker rmi -f saikumartanakala/cakezone'
            }
        }
    }
        stage('Docker Run ') {
            steps {
                sh 'docker container rm -f $(docker ps -qa) '
                sh 'docker run -d -p 8081:8080 saikumartanakala/cakezone' 
                
                // sh "docker cp /path/to/your/local/files/. container_id:/usr/local/tomcat/webapps/ROOT" 
            }
        }
    }
}
