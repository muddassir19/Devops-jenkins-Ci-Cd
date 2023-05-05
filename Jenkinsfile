pipeline{
   agent any
   environment {
        DOCKER_TAG = "getversion()"
        BUILD_IDS = "$BUILD_ID"
        
    }


   stages{
    stage('cleanup workspace'){
        steps{
            cleanWs()
        }
    }
    stage('checkout scm'){
        steps{
            git branch: 'ansible-docker', url: 'https://github.com/muddassir19/Devops-jenkins-Ci-Cd.git'
        }
    }
    stage('Apllication Test'){
        steps{
            sh 'mvn test'
        }
    }
    stage('maven build'){
        steps{
            sh 'mvn clean package'
        }
    }
    /*Docker taging version should not be static,should be dynamic.
    create a function give short commit-id ,we can use taging for docker image
    git command: git rev-parse --short HEAD (command returns latest commit-id in short form)
    */
    stage('Docker build'){
        steps{
            sh "docker build -t muddassir19/devapp:${BUILD_IDS} ."
        }
    }
    stage('DockerHub push'){
        steps{
            withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
            sh "docker login -u muddassir19 -p ${dockerHubPwd}"
        }
            sh "docker push  muddassir19/devapp:$BUILD_ID"
        }
    }
    stage('Docker Deploy'){
        steps{
            ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, 
            extras: "-e BUILD_IDS=${BUILD_IDS}", 
            installation: 'ansible', inventory: 'hosts', 
            playbook: 'deploy-docker.yml'
        }
    }
   } 
}
def getVersion(){
    def commitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}