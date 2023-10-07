pipeline {
    agent any
    stages {
        stage (git) {
            steps {
                git branch: 'main', url: 'https://github.com/vamsibyramala/live01.git'
            }
        }
        stage (build) {
            steps {
                sh 'mvn clean package'
            }
        }
        stage ('Build Docker Image') {
            steps {
                script {
                    sh 'Docker Build -t saikumartanakala/task4 .'
                }
            }
        }
    }
}
