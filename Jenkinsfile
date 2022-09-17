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
                sh '''
                    echo ${env}
                    docker build -t mmodos/helloapp:latest -mmodos/helloapp:${env.BUILD_ID} .'
                    docker push mmodos/helloapp:latest
                '''
//                  script{
//                     app = 'docker.build("mmodos/helloapp:latest")'
//
//                     app.push()
//                  }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}