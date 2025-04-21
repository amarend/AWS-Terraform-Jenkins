pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo "Step 1 - Cloning Repo"
                git 'https://github.com/amarend/AWS-Terraform-Jenkins.git'
            }
        }

        stage('Terraform Init, Plan & Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'AWS_ACCESS_KEY', variable: 'AWS_ACCESS_KEY'),
                    string(credentialsId: 'AWS_SECRET_KEY', variable: 'AWS_SECRET_KEY')
                ]) {
                    echo "Step 2 - Terraform Init"
                    sh 'terraform init'

                    echo "Step 3 - Terraform Plan"
                    sh """
                        terraform plan -out=tfplan \\
                        -var 'aws_access_key=${AWS_ACCESS_KEY}' \\
                        -var 'aws_secret_key=${AWS_SECRET_KEY}'
                    """

                    echo "Step 4 - Terraform Apply"
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
