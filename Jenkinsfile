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

