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
                    pwd
                    RAND=`openssl rand -hex 10`
                    /usr/local/bin/docker build -t mmodos/helloapp:latest -t mmodos/helloapp:$RAND .
                    /usr/local/bin/docker push -a mmodos/helloapp
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Helm charts'
                sh'''
                    /usr/local/bin/helm install helloapp ./
                '''
            }
        }
    }
}