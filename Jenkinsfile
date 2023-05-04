pipeline{
    agent{
        label "master"
    }
    stages{
        /*
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
        } */
        stage("maven build"){
            steps{
                sh 'mvn clean install -DskipTests'
            }
        }
        stage("SonarQube Quality Gates status"){
            steps{
                withSonarQubeEnv('sonar7.9') {
                    sh 'mvn sonar:sonar'
                }
                timeout(time: 1, unit: 'HOURS') {
                    script{
                        def qg = waitForQualityGate()
                        if (qg.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${qg.status}"
                        }
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
}