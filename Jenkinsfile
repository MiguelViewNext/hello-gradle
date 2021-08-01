pipeline {
    agent any

    options {
        ansiColor('xterm')
    }

// ----------------------------------------------------- STAGES
    stages {
        stage('Build file .jar') {
            steps {
                echo '\031[41m\031[97mCrear archivo .JAR\031[0m'
		        sh "./gradlew assemble"     // Crear archivo .jar
            }

            post {
                success {
                    echo '\033[42m\033[97mRecoger archivo .JAR\033[0m'
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
                echo '\033[42m\033[97mDeploying....\033[0m'
                sshagent (credentials: ['jenkins_ID']) {
                    sh 'git tag MAIN-1.0.${BUILD_NUMBER}'           // Etiquetar un punto en el tiempo
                    sh 'git push origin MAIN-1.0.${BUILD_NUMBER}'   // Subir la nueva etiqueta a GitLab
                }
            }
        }

        stage('gitlab') {
            steps {
                echo '\033[42m\033[97mNotify GitLab\033[0m'
                updateGitlabCommitStatus name: 'build', state: 'pending'
                updateGitlabCommitStatus name: 'build', state: 'success'
            }
        }
    }
}

