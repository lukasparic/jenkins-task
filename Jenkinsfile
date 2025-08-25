pipeline {
  agent { 
    dockerfile {
        filename 'Dockerfile.builder'
    } 
    }
  stages {
    stage('Check Tools') {
        sh 'java --version'
        sh 'gradle --version'
        sh 'docker --version'
    }
    stage('Test') {
      steps {
        sh 'echo "Hello world" '
      }
    }
  }
}