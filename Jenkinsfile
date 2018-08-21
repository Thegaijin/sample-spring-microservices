node {
  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/PiggyMetrics.git'
  }

  stage('compiler, tester, packager') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean install"
  }

  stage('Build docker images') {
    sh 'docker-compose -f docker-compose.yml build'
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
      sh 'docker login -u thegaijin -p ${dockerhubpwd}'
    }
  }

  stage('Push images to dockerhub') {
    sh 'docker-compose push'
  }

  stage('deploy') {
    sh 'kubectl apply -R -f ./k8s'
  }
}
