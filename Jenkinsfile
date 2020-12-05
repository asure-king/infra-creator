pipeline {
    agent any
    options {disableConcurrentBuilds()}
    environment {
        GOOGLE_PROJECT_ID = "asure-terraformar-273003" 
        GOOGLE_PROJECT_NAME = "asure-terraformar-273003"
        GOOGLE_APPLICATION_CREDENTIALS = credentials('sa_infra')
        GOOGLE_CLOUD_KEYFILE_JSON = credentials('sa_infra')
    }
    parameters { 
      choice(name: 'ENTORNOS', choices: ['dev', 'pre', 'pro'], description: 'Seleccione el entorno a utilizar')
      choice(name: 'ACCION', choices: ['', 'plan-apply', 'destroy'], description: 'Seleccione el entorno a utilizar')
    }
    stages{
        
        stage('clean workspaces -----------') { 
            steps {
              cleanWs()
              sh 'env'
            } //steps
        }  //stage

        //${params.Acción}
        stage("git clone code terraform"){
            steps {
                cleanWs()
                    checkout([$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CleanCheckout']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [
                        [url: 'https://github.com/asure-king/infra-creator.git', credentialsId: '']
                        ]])
                sh 'pwd' 
                sh 'ls -l'
            } //steps
        }  //stage
    
        stage('Terraform init----') {
         steps {
            sh 'terraform --version'
            sh ' cd bastion && ls -la'
            sh ' cd bastion && gcloud projects list'
            sh ' cd bastion && terraform init -var-file="../variables/dev.tfvars" '
            } //steps
        }  //stage

        stage('Terraform plan----') {
            steps {
                sh 'terraform init'
                sh 'terraform plan -out myplan'
            } //steps
        }  //stage
        
        stage('Confirmación de accion') {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: params.ACCION + '?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
            }
        }
        
        stage('Terraform apply or destroy ----------------') {
            steps {
               sh 'echo "comienza"'
            script{  
                if (params.ACCION == "destroy"){
                         sh ' echo "llego" + params.ACCION'   
                         sh 'cd bastion && terraform destroy -var-file="../variables/dev.tfvars" -auto-approve'
                } else {
                         sh ' echo  "llego" + params.ACCION'                 
                         sh 'cd bastion && terraform apply -refresh=true -var-file="../variables/dev.tfvars"  -auto-approve'  
                }  // if

            }
            } //steps
        }  //stage
   }  // stages
} //pipeline