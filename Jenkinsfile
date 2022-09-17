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
                echo 'Building..'
                sh "apt install docker"
                app = docker.build("mmodos/helloapp:${env.BUILD_ID}")
//                 sh 'docker build -t mmodos/helloapp:v1 .'
//                 sh 'docker push mmodos/helloapp:v1'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}