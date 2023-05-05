pipelie{
   agent any

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
        sh 'mvn clean package'
    }
   } 
}