pipeline {
    agent {
        docker { image 'hashicorp/terraform:light'}
    }
    environment {
        SA_INFRA = credentials('sa_infra')
        sh 'mkdir -p creds'
        sh 'echo $SA_INFRA | base64 -d > ./creds/infra-creator.json'
    }

    stages {
        stage ('tf init') {
            steps {
                withDockerContainer(image: 'hashicorp/terraform:light', toolName: 'Docker')
                sh 'terraform init'
                sh 'terraform apply'
            }
        }
    }
}   