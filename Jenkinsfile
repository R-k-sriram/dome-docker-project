pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-node-app:${BUILD_NUMBER}"
        DOCKER_HUB_REPO = "your-dockerhub-username/my-node-app:${BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                               url: 'https://github.com/R-k-sriram/dome-docker-project.git',
                               credentialsId: 'github'

            }
        }
// lkjhgvfc
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

      stage('Login to Docker Hub') {
    steps {
        script {
            echo "Logging in to Docker Hub..."
            withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                sh 'echo $PASS | docker login -u $USER --password-stdin'
            }
        }
    }
}





        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker tag $DOCKER_IMAGE $DOCKER_HUB_REPO"
                    sh "docker push $DOCKER_HUB_REPO"
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh "docker rm -f my-node-container || true"
                    sh "docker run -d -p 3000:3000 --name my-node-container $DOCKER_HUB_REPO"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
