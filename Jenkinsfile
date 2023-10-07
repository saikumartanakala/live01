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
                    sh 'docker build -t saikumartanakala/newimage1 .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'saikumartanakala', variable: 'dockerhub')]) {
                    sh 'docker login -u saikumartanakala -p ${dockerhub}'
}
                    sh 'docker push saikumartanakala/newimage1'
                    sh 'docker build -t saikumartanakala/newimage1 .'
                    sh 'docker pull newimage1'
                }
            }
        }
    }
}
