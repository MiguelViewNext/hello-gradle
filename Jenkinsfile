pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh "docker-compose build"
		sh "docker image tag hello-gradle:latest hello-gradle:MAIN-1.0.${BUILD_NUMBER}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
		sh "docker-compose up -d"
            }
        }
    }
}

