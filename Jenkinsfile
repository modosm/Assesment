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
                    /usr/local/bin/helm upgrade --install --set username=$USERNAME helloapp ./
                '''
            }
        }
        stage('Logs') {
            steps {
                echo "Wait until the pod is deployed and finished running"
                sleep(time: 30, unit: 'SECONDS')
                sh '''
                    for pod in `/usr/local/bin/kubectl get pods | /usr/bin/awk '/helloapp/{print $1}'`
                    do
                        /usr/local/bin/kubectl logs $pod
                    done
                '''
            }
        }
    }
    post{
         always {
            echo 'One way or another, I have finished'
            echo 'Cleaning up after the run'
            deleteDir() /* clean up our workspace */
            sh '/usr/local/bin/helm uninstall helloapp; exit 0'
            sh '''
                for image in `/usr/local/bin/docker image ls |/usr/bin/awk '/mmodos/{print $2}'`
                do
                    /usr/local/bin/docker image rm mmodos/helloapp:$image
                done
                exit 0
            '''
        }
    }
}