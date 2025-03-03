pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'develop', credentialsId: 'github-credentials', url: 'https://github.com/akashn34/healthcare-app.git'
            }
        }

        stage('Build Eureka JAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t healthcare-eureka .'
            }
        }

        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    def containerExists = sh(script: "docker ps -a -q --filter 'name=healthcare-eureka'", returnStdout: true).trim()
                    if (containerExists) {
                        sh 'docker stop healthcare-eureka || true'
                        sh 'docker rm healthcare-eureka || true'
                    }
                }
            }
        }

        stage('Run Eureka Server') {
            steps {
                sh 'docker run -d -p 8761:8761 --name healthcare-eureka healthcare-eureka'
            }
        }
    }
}

