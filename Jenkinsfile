pipeline { //trigger jenkins set
    agent any

    environment {
        IMAGE_NAME = 'snapcart'
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }
    }

    post {
        success {
            echo "Build succeeded: ${IMAGE_NAME}:${IMAGE_TAG}"
        }

        failure {
            echo "Build failed"
        }
    }
}