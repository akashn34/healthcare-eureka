pipeline {
    agent any

    tools {
        maven 'Maven'  // Use the Maven tool configured in Jenkins
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'develop', 
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/akashn34/healthcare-eureka.git'
            }
        }

        stage('Build & Package Eureka') {
            steps {
                sh 'mvn clean package'               // Build the Java Eureka Server
            }
        }
        stage('Run Eureka') {
            steps {
                sh 'java -jar target/*.jar'            // Run the Eureka Server
            }
        }
    }
}

