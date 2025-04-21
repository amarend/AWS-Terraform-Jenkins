pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY')
    }
    
    stages {
        stage('Clone Repo') {
            steps {
                // Clone the repo that contains your Terraform files
                echo "Step 1"
                git 'https://github.com/amarend/AWS-Terraform-Jenkins.git'
            }
        }
        
        stage('Initialize Terraform') {
            steps {
                // Initialize Terraform working directory
                echo "Step 2"
                sh 'terraform init'
            }
        }
        
        stage('Plan Terraform Deployment') {
            steps {
                // Plan the Terraform deployment with the provided AWS credentials
                sh """
                    terraform plan \
                        -var 'aws_access_key=$AWS_ACCESS_KEY' \
                        -var 'aws_secret_key=$AWS_SECRET_KEY'
                """
            }
        }
        
        stage('Apply Terraform Configuration') {
            steps {
                // Apply the Terraform configuration and launch the EC2 instance
                sh """
                    terraform apply -auto-approve \
                        -var 'aws_access_key=$AWS_ACCESS_KEY' \
                        -var 'aws_secret_key=$AWS_SECRET_KEY'
                """
            }
        }
    }
    
    post {
        always {
            echo "Terraform deployment completed"
        }
    }
}
