pipeline {
    agent any
    
    stages {
       stage('Check Env') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_KEY')
                ])
            }
       }
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
