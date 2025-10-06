pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-node-app'
        // DOCKER_HUB_REPO = 'your-dockerhub-username/my-node-app'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/R-k-sriram/dome-docker-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .'
                    
                }
            }
        }

        // stage('Login to Docker Hub') {
        //     steps {
        //         script {
        //             echo "Logging in to Docker Hub..."
        //             withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
        //                 sh 'echo $PASS | docker login -u $USER --password-stdin'
        //             }
        //         }
        //     }
        // }

        // stage('Push to Docker Hub') {
        //     steps {
        //         script {
        //             sh 'docker tag $DOCKER_IMAGE $DOCKER_HUB_REPO'
        //             sh 'docker push $DOCKER_HUB_REPO'
        //         }
        //     }
        // }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Deploying container..."
                    sh '''
                        docker rm -f my-node-container || true
                        docker run -d -p 3000:3000 --name my-node-container ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}
