pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/AhmedHamdi2/Complete-CICD-Pipline-Devops-Poject.git'
            }
        }
        stage("Sonarqube Analysis") {
            steps {
                withSonarQubeEnv('SonarQube-Server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=DevOps-CICD \
                    -Dsonar.projectKey=DevOps-CICD'''
                }
            }
        }
        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'SonarQube-Token'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                sh "npm install"
            }
        }
        stage('TRIVY FS SCAN') {
             steps {
                 sh "trivy fs . > trivyfs.txt"
             }
         }
         stage("Docker Pull & Push"){
             steps{
                 script{
                     withDockerRegistry(credentialsId: 'dockerhub-credentials'){   
                         sh "docker pull ahmedhamdi1/devops-webapp-frontend:latest"
                         sh "docker tag ahmedhamdi1/devops-webapp-frontend:latest ahmedhamdi1/devops-webapp-frontend:latest"
                         sh "docker push ahmedhamdi1/devops-webapp-frontend:latest"
                     }
                 }
             }
         }
        stage("TRIVY Image Scan"){
            steps{
                sh "trivy image ahmedhamdi1/devops-webapp-frontend:latest > trivyimage.txt"
            }
        }
        stage('Deploy to Kubernetes'){
            steps{
                script{
                    dir('Kubernetes') {
                      withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubernetes', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                      sh 'kubectl delete --all pods'
                      sh 'kubectl apply -f deployment.yml'
                      sh 'kubectl apply -f service.yml'
                      }   
                    }
                }
            }
        }
    }
}
