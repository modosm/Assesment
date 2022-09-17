pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Clone repository') {
            steps {
                script{ checkout scm }
            }
        }
        stage('Build') {
            steps {
                echo 'Building Docker image'
//                 sh '''
//                     sudo apt install docker
//                     docker build -t mmodos/helloapp:latest -mmodos/helloapp:${env.BUILD_ID} .'
//                     docker push mmodos/helloapp:latest
//                 '''
                 docker.build("mmodos/helloapp:${env.BUILD_ID}")
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}