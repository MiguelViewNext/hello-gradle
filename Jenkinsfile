pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build .jar') {
            steps {
                echo '\033[34mHello\033[0m \033[33mcolorful\033[0m \033[35mworld!\033[0m'
		sh "./gradlew assemble"
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
		archiveArtifacts artifacts: 'build/libs/*.jar'
            }
        }
    }
}

