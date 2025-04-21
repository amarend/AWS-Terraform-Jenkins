pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY_ID')
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Initialize Terraform') {
            steps {
                echo 'Initializing Terraform...'
                sh 'terraform init'
            }
        }

        stage('Plan Terraform') {
            steps {
                echo 'Planning Terraform deployment...'
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply Terraform') {
            steps {
                echo 'Applying Terraform plan...'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        failure {
            echo 'Terraform apply failed!'
        }
        success {
            echo 'EC2 instance created successfully!'
        }
    }
}
