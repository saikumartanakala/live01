pipeline {
    agent any
  //  tools {
        // Define the Docker tool installation named 'docker'
       // dockerTool 'docker'
  //  }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from Git
                git branch: 'main', url: 'https://github.com/saikumartanakala/live01.git'
            }
        }
        stage('Build Maven') {
            steps {
                // Build your Maven project
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                // Build your Docker image
               
                sh 'docker build -t saikumartanakala/cakezone .'
            }
        }
        stage('Docker Login and Push') {
            steps {
                // Log in to Docker Hub and push the image
                withDockerRegistry(credentialsId: '081afc55-4fa0-4dbe-8b84-7aefdc7e8371', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t cakezone:latest .'
                    sh 'docker tag cakezone:latest saikumartanakala/cakezone:latest'
                    sh 'docker push saikumartanakala/cakezone:latest' 
                    sh 'docker rmi -f saikumartanakala/cakezone'
                }
            }
        }
        stage('Docker Run') {
            steps {
                // Remove existing containers and run your Docker container
                sh 'docker container rm -f $(docker ps -qa) '
                sh 'docker run -d -p 8081:8080 saikumartanakala/cakezone' 
            }
        }
    }
}
