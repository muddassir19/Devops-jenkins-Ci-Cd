pipeline{
   agent any
   environment {
        DOCKER_TAG = "getversion()"
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
            sh "docker build -t muddassir19/Devapp:${DOCKER_TAG} ."
        }
    }
   } 
}
def getversion(){
    def commitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}