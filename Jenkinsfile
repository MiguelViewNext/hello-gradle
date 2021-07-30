pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Build file .jar') {
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
                sshagent (credentials: ['jenkins_ID']) {
                    sh 'git tag MAIN-1.0.${BUILD_NUMBER}'
                    sh 'git push origin MAIN-1.0.${BUILD_NUMBER}'
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

