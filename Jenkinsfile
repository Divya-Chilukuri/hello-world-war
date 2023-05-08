pipeline{
    agent none
environment {
		DOCKER_LOGIN_CREDENTIALS=credentials('dockerhostpush')
	}
    stages {
	    stage('checkout code from git'){ 
  agent {
  label 'docker'
  } 
    steps {
      checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Divya-Chilukuri/hello-world-war.git']])
    }
  }

  stage('build') {
  agent {
  label 'docker'
  } 
    steps {
      sh 'mvn clean install'
    }
  }

  stage('build and push to dockerhub') {
  agent {
  label 'docker'
  }
   environment { 
	dockerTag = "version$BUILD_NUMBER"
   }
    steps {
      sh 'docker build -t divyachilukuri/jaksh:$dockerTag .'	    
      sh 'echo $DOCKER_LOGIN_CREDENTIALS_PSW | docker login -u $DOCKER_LOGIN_CREDENTIALS_USR --password-stdin'
      sh 'docker push divyachilukuri/jaksh:$dockerTag'
    }
  }

  stage('deploy in kubernetes') {
  agent {
  label 'k8s'
  } 
    steps {
      checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Divya-Chilukuri/hello-world-war.git']])
      sh 'kubectl apply -f deployment.yml'
      sh 'kubectl apply -f service.yml'
    }
  }

}
}
