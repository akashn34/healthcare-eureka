pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'develop', 
                    credentialsId: 'github-credentials', 
                    url: 'https://github.com/akashn34/healthcare-eureka.git'
            }
        }
    }
}

        stage('Build & Package Eureka') {
            steps {
                sh './mvnw clean package'               // Build the Java Eureka Server
            }
        }
        stage('Run Eureka') {
            steps {
                sh 'java -jar target/*.jar'            // Run the Eureka Server
            }
        }
    }
}

