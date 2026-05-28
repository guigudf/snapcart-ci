pipeline {
    agent any

    environment {
        IMAGE_NAME = 'snapcart'
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
    }

    post {
        success {
            echo "Build succeeded. Image: ${IMAGE_NAME}:${IMAGE_TAG} built successfully."
        }

        failure {
            echo 'Build failed. Check the console output above.'
        }
    }
}