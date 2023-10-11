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
        stage('Docker container remove & image remove') {
            steps {
                // remove container
                sh 'docker container rm -f $(docker ps -qa) '
                sh 'docker rmi -f $(docker images -q)'
                
            }
        }
        stage('Docker build and Push') {
            steps {
                // Log in to Docker Hub and push the image
                withDockerRegistry(credentialsId: '081afc55-4fa0-4dbe-8b84-7aefdc7e8371', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t saikumartanakala/saikumar:latest .'
                    sh 'docker push saikumartanakala/saikumar:latest' 
                    sh 'docker rmi -f saikumartanakala/saikumar'
                }
            }
        }
        stage('Docker Run') {
            steps {
                // Remove existing containers and run your Docker container
                sh 'docker run -d -p 8081:8080 saikumartanakala/saikumar' 
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
