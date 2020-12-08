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
                sh 'echo directorio cambiado'
                sh 'terraform init'
            }
        }
        stage ('tf init') {
            steps {
                sh 'echo Terraform iniciado'
            }
        }
    } 
}  