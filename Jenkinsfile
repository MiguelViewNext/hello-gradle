pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build') {
            steps {
                echo '\echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mworld!\033[0m'
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

