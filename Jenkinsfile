pipeline{
    agent any
    stages{
        stage('stage1'){
            agent{
                    label "docker-slave"
            }
            steps{
                echo "stage1 docker slave"
            }
        }
    }
}