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
                    echo $USERNAME
                    helm upgrade --install --set username=$USERNAME helloapp ./
                '''
            }
        }
        stage('Logs'){
            steps {
                sh 'for pod in `kubectl get pods | awk '/helloapp/{print $1}'`;do;kubectl logs $pod;done'
            }
        }
    }
    post{
         always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
    }
}