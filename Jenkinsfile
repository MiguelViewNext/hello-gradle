pipeline {
    agent any

    options {
        ansiColor('xterm')
    }

// ----------------------------------------------------- STAGES
    stages {
        stage('Build file .jar') {
            steps {
		        sh "./gradlew assemble"     // Crear archivo .jar
            }

            post {
                success {
                    archiveArtifacts artifacts: 'build/libs/*.jar'      // Recoger archivo .jar
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
                sshagent (credentials: ['jenkins_ID']) {
                    sh 'git tag MAIN-1.0.${BUILD_NUMBER}'           // Etiquetar un punto en el tiempo
                    sh 'git push origin MAIN-1.0.${BUILD_NUMBER}'   // Subir la nueva etiqueta a GitLab
                }
            }
        }

        stage('gitlab') {
            steps {
                echo 'Notify GitLab'
                updateGitlabCommitStatus name: 'build', state: 'pending'
                updateGitlabCommitStatus name: 'build', state: 'success'
            }
        }
    }
}

