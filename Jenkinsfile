pipeline {
    agent any

    environment {
        IMAGE = "django_app:latest"  // Namnet på Docker-bilden
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }
        stage('Setup Environment') {
            steps {
                sh '''
                sudo python3 -m venv env
                source env/bin/activate
                pip install -r requirements.txt
                '''
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                sudo docker build -t $IMAGE .
                '''
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                 sudo docker stop django_app_container || true
                sudo docker rm django_app_container || true
                sudo docker run -d --name django_app_container -p 8000:8000 $IMAGE
                '''
            }
        }
    }

    post {
        always {
            sh 'docker logs django_app_container || true'
        }
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}