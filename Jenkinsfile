pipeline {
    agent any
    stages {
        stage('Git Checkout') {
          steps {
                git 'https://github.com/jallu225/task-repo.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t taskdemo .'
            }
        }
        stage('Docker push'){
            steps {
                withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'docker_pass')]) {
                  sh 'docker login -u rajesh1218 -p ${docker_pass}'
                  sh 'docker tag taskdemo rajesh1218/taskdemo:latest'
                  sh 'docker push rajesh1218/taskdemo:latest'
               }
            }
        }
    }
}
