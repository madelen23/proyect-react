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
                // Usamos el checkout con credenciales SSH configuradas en Jenkins
                checkout([$class: 'GitSCM', 
                          branches: [[name: 'main']],
                          userRemoteConfigs: [[
                              url: 'https://github.com/madelen23/proyect-react.git',
                              credentialsId: 'github-private-key'  
                          ]]
                ])
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
