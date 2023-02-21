node { 
    stage('Git Checkout'){
        git branch: 'demo', url: 'https://github.com/jallu225/task-repo.git'
    }
    stage('Send docker file to ansible-server'){
        sshagent(['docker-server']) {
            sh 'ssh -o StrictHostKeyChecking=no -l ec2-user 3.110.174.129 uname -a'
            sh 'scp -o StrictHostKeyChecking=no /var/jenkins_home/jobs/dockerdemo/workspace/Dockerfile ec2-user@3.110.174.129:/home/ec2-user'
        } 
    }
    stage('Docker Build') {
        sshagent(['docker-server']) {
           sh 'ssh -o StrictHostKeyChecking=no -l ec2-user 3.110.174.129 cd /home/ec2-user/'
           sh 'ssh -o StrictHostKeyChecking=no -l ec2-user 3.110.174.129 docker build -t $JOB_NAME:v1.$BUILD_ID .'
        }
    }
    stage('Docker image tagging And Push') {
        sshagent(['docker-server']) {
           sh 'ssh -o StrictHostKeyChecking=no -l ec2-user 3.110.174.129 docker tag $JOB_NAME:v1.$BUILD_ID rajeshjallu/$JOB_NAME:latest'
           sh 'ssh -o StrictHostKeyChecking=no -l ec2-user 3.110.174.129 docker push rajeshjallu/$JOB_NAME:latest'
        }
    }
}
