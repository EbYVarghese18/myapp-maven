pipeline {
    agent any

    tools { 
        maven 'maven'
    }

    stages {
        stage('SCM checkout') {
            steps {
                echo 'checkout starts'
                cleanWs()
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/EbYVarghese18/myapp-maven.git']])
                echo 'checkout ends'
            }
        }
        stage('Build Maven') {
            steps {
                echo 'Build Maven starts'
                sh 'mvn clean package -f my-app/pom.xml'
                echo 'Build Maven Ends'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Build Dockerimage starts'
                script{
                    sh 'docker build -t ebinvarghese/myapp-maven:1.0 .'
                }
                echo 'Build Dockerimage ends'
            }
        }
        // stage('Push Docker image to Dockerhub') {
        //     steps {
        //         script{
        //             withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
        //             sh 'docker login -u ebinvarghese -p ${dockerpwd}'
        //             }
        //             sh 'docker push ebinvarghese/myapp-maven:1.0'
        //             sh 'docker logout'
        //         }
        //     }
        // }
    }
}