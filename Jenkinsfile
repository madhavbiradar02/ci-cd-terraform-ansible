pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/<your-username>/<repo>.git'
            }
        }
        
        stage('Build') {
            steps {
                echo "Building the project..."
                sh 'echo "Build step here"'
            }
        }
        
        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo "Run test commands here"'
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying application..."
                sh 'echo "Deploy step here"'
            }
        }
    }
}

