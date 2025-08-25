pipeline {
  agent { dockerfile true }
  stages {
    stage('Test') {
      steps {
        sh '''
          echo "Hello world"
          git --version
          curl --version
        '''
      }
    }
  }
}