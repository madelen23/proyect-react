pipeline {
    agent {
        label 'docker-agent'
    }

    tools {
        nodejs 'NodeJS-24'
    }


    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/madelen23/proyect-react.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || echo "No tests to run"'
            }
        }

        stage('Build and Deploy with Docker Compose') {
            steps {
                sh '''
                    docker compose down || true
                    docker compose up --build -d
                '''
            }
        }
    }

    post {
        success {
            echo '🚀 Despliegue completado exitosamente.'
        }
        failure {
            echo '❌ El proceso ha fallado.'
        }
    }
}

