pipeline {
    agent any

    environment {
        IMAGE_NAME = 'snapcart'
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

    }

    post {
        success {
            echo 'Build succeeded. Image: ${IMAGE_NAME}:${IMAGE_TAG} built successfully.'
        }

        failure {
            echo 'Build failed. Check the console output above.'
        }
    }
}
