pipeline {
    agent any

    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'git', url: 'https://github.com/saikumartanakala/live01.git']])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t saikumartanakala/newimage3 .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'saikumartanakala', variable: 'dockerhub')]) {
                    sh 'docker login -u saikumartanakala -p ${dockerhub}'
}
                    sh 'docker push saikumartanakala/newimage3'
                }
            }
        }
        stage('pull Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'saikumartanakala', variable: 'dockerhub')]) {
                    sh 'docker login -u saikumartanakala -p ${dockerhub}'
}
sh "docker pull saikumartanakala/newimage3"
                }
            }
        }
         stage('My Slack Notification') {
            steps {
                script {
                    slackSend(
                        color: 'good',
                        message: "DOcker task is successful!",
                        channel: '#jenkinsnotification'
                    )
                }
            }
        }
    }
    post {
         success {
                    slackSend(
                        color: 'good',
                        message: "Build successful!",
                        channel: '#jenkinsnotification'  
                    )
         
                
                }
         failure {
                    slackSend(
                        color: 'danger',
                        message: "Build failed!",
                        channel: '#jenkinsnotification'  
                    )
                }   
            }
}

        
