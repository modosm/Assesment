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
                echo '$env'
//                 sh '''
//                     sudo apt install docker
//                     docker build -t mmodos/helloapp:latest -mmodos/helloapp:${env.BUILD_ID} .'
//                     docker push mmodos/helloapp:latest
//                 '''
                 script{
                    app = 'docker.build("mmodos/helloapp:${env.BUILD_ID}")'

                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                 }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}