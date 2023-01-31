terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #   access_key = $AWS_ACCESS_KEY_ID
  #   secret_key = $AWS_SECRET_ACCESS_KEY 
}

resource "aws_instance" "web" {
  ami           = "ami-052465340e6b59fc0"
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformBasicMachine"
  }
}
