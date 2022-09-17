pipeline {
    agent any
    stages {
//         stage('Checkout'){
//             checkout([
//                 $class: 'GitSCM',
//                 branches:[[name: '*/master']],
//                 extensions: [],
//                 userRemoteConfigs: [[
//                     credentialsId: 'github.com_modosm_Assesment',
//                     url: 'https://github.com/modosm/Assesment']]
//             ])
//         }
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t mmodos/helloapp:v1 .'
                sh 'docker push mmodos/helloapp:v1'
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