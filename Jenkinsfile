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
                sh 'npm test -- --watchAll=false'
            }
        }

        stage('Build App') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Archive Build') {
            steps {
                archiveArtifacts artifacts: 'build/**', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ React app construida exitosamente.'
        }
        failure {
            echo '❌ Algo falló en la pipeline.'
        }
    }
}
