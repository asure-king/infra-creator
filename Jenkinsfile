pipeline {
    agent {
    docker { image 'hashicorp/terraform' }
    }
    environment {
        SA_INFRA = credentials('sa_infra')
    }
    
    stages {

        stage('Checkout') {
            steps {
                checkout scm
                sh 'mkdir -p creds'
                sh 'echo $SA_INFRA | base64 -d > ./creds/infra-creator.json'
            }
        }

        stage('TF Plan') {
            steps {
                container('terraform') {
                sh 'terraform init'
                sh 'terraform plan -out myplan'
            }
        }
    }

        stage('Approval') {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }
        
        stage('TF Apply') {
            steps {
                container('terraform') {
                    sh 'terraform apply -input=false myplan'
                 }
             }
         }
    }
}