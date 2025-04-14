pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY')
    }
    stages {
        stage('Test Secrets') {
            steps {
                echo "Access Key: $AWS_ACCESS_KEY"
                echo "Secret Key is available (but not echoed for security)"
            }
        }
    }
}
