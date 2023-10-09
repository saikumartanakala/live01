pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/saikumartanakala/live01.git/']]])
            }
        }
        stage('Build maven') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('docker build') {
            steps {
                sh 'docker build -t saikumartanakala/newimage1 .'
            }
        }
        stage('login') {
            steps {
                sh 'docker login -u saikumartanakala -p Saikumar@7979'
                sh 'docker push saikumartanakala/newimage1' 
            }
        }
        stage('Docker Run ') {
            steps {
                sh 'docker run -d -p 8081:8080 saikumartanakala/newimage1' 
                // sh "docker cp /path/to/your/local/files/. container_id:/usr/local/tomcat/webapps/ROOT" 
            }
        }
    }
}
