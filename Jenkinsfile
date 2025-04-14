pipeline {
    agent any

    stages {
        stage('Check Env') {
            steps {
                withCredentials([
                    string(credentialsId: '1301c5b5-b6bc-4c55-8237-997ccfc9929d', variable: 'AWS_ACCESS_KEY'),
                    string(credentialsId: '2f072ff3-5951-41fd-bb9f-52d72ff4e775', variable: 'AWS_SECRET_KEY')
                ]) {
                    echo "Access Key is: ${env.AWS_ACCESS_KEY}"
                    echo "Secret Key is available: ${env.AWS_SECRET_KEY != null}"
                }
            }
        }
    }
}
