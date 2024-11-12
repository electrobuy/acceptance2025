pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Package') {
            steps {
                sh './gradlew compileJava'
            }
        }

        stage('Docker build') {
            steps {
                sh "docker build -t calculatrice ."
            }
        }

        stage('Docker push') {
            steps {
                script {
                    sh "docker images"
                }
            }
        }

        stage('Déploiement sur staging') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                echo 'Déploiement en cours...'

            }
        }

        stage('Test d\'acceptation') {
            steps {
                sleep 60  
                echo 'Running acceptance tests...'
            }
        }
    }

    post {
        always {
sh 'docker stop $(docker ps -q) || true'
        }
    }
}
