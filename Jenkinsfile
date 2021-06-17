pipeline {
    agent any
    
    tools {
        //indicates to Jenkins that I want to use gradle in Jenkinsfile
        gradle '7.0.2'
    }
    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/apazdzior/spring-petclinic-kotlin.git'
                sh "gradle clean build"
            }
        }
        stage('Rename') {
            steps {
                sh "mv build/libs/spring-petclinic-kotlin-2.4.0.jar build/libs/new.jar"
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'build/libs/new.jar'
            }
        }
    }
}
