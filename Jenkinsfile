pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build .jar') {
            steps {
		sh "./gradlew assemble"

            }
            post {
		success {
			archiveArtifacts artifacts: 'build/libs/*.jar'
		}
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
            }
        }
    }
}

