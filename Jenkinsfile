pipeline {
    agent any
    environment {
        SA_INFRA = credentials('sa_infra')
    }
    
    stages {
        stage('Checkout') {
            checkout scm
            sh 'mkdir -p creds'
            sh 'echo $SA_INFRA | base64 -d > ./creds/infra-creator.json'
        }
        stage('tf init') {
            sh 'terraform init'
        }
    }
}        