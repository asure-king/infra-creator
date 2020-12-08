pipeline {
    agent { label 'asure-hq'}
    environment {
        GOOGLE_APPLICATION_CREDENTIALS2 = credentials('GOOGLE_APPLICATION_CREDENTIALS2')
    }

    stages {
        stage('checkout') {
            steps {
                sh 'mkdir -p creds'
                sh 'cd /home/bz/workspace/infra-creator'
                sh 'echo $GOOGLE_APLICATIONS_CREDENTIALS2 | base64 -d > ./creds/infra-creator.json'
            }
        }
        stage ('tf init') {
            steps {
                sh 'terraform init'
            }
        }
    } 
}  