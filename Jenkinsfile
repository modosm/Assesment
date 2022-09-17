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
                    brew install docker
                    RAND=`openssl rand -hex 10`
                    docker build -t mmodos/helloapp:latest -t mmodos/helloapp:$RAND .
                    docker push -a mmodos/helloaspp
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