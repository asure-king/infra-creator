pipeline {
    agent {
        docker { image 'hashicorp/terraform:light'}
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GOOGLE_APPLICATION_CREDENTIALS')
    }

    stages {
        stage('checkout') {
            steps {
                sh 'mkdir -p creds'
                sh 'echo $SA_INFRA | base64 -d > ./creds/infra-creator.json'
            }
        }
        stage ('tf init') {
            steps {
                withDockerContainer(image: 'hashicorp/terraform:light', toolName: 'Docker')
                sh 'terraform init'
            }
        }
    } 
}  