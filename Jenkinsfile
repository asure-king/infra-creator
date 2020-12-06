pipeline {
    agent {
        docker { image 'hashicorp/terraform:light'}
    }
    environment {
        SA_INFRA = credentials('sa_infra')
    }

    stages {
        stage('checkout') {
            steps {
                checkout scm
                sh 'mkdir -p creds'
                sh 'echo $SA_INFRA | base64 -d > ./creds/infra-creator.json'
            }
        }
    }
}   