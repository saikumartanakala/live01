pipeline {
    agent any
    stage ('build') {
            steps {
                sh 'mvn clean package'
            }
    }
    stage ('Build Docker Image') {
        
        steps {
            script {
                sh 'Docker Build -t saikumartanakala/newimage .'
            }
        }
    }
}


        
