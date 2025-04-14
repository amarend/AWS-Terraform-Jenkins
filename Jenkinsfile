pipeline {
    agent any

    stages {
        stage('Check Env') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_KEY')
                ]) {
                    echo "Access Key is: ${env.AWS_ACCESS_KEY}"
                    echo "Secret Key is available: ${env.AWS_SECRET_KEY != null}"
                }
            }
        }
    }
}
