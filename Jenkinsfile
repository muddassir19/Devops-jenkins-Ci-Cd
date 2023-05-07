pipeline{
    agent any
    stages{
        stage('stage1'){
            agent{
                docker{
                    label "docker-slave"
                }
            }
            steps{
                echo "stage1 docker slave"
            }
        }
    }
}