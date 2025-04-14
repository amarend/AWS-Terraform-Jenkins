provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Update with your preferred AMI
  instance_type = "t2.micro"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
