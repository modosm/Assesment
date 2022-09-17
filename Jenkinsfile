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
                    if ! command -v docker &> /dev/null
                    then
                        curl -o docker-20.10.9.tgz https://download.docker.com/mac/static/stable/x86_64/docker-20.10.9.tgz
                        tar xzvf docker-20.10.9.tgz
                        xattr -rc docke
                        cp docker/docker /usr/local/bin/
                    fi
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