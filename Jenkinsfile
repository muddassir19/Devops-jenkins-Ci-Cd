pipeline{
    agent{
        label "master"
    }
    stages{
        stage("Checkout code"){
            steps{
                    git branch: 'prod', credentialsId: 'github-token', 
                    url: 'https://github.com/muddassir19/Devops-jenkins-Ci-Cd.git'
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}