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

output "instance_ami_using" {
  value = aws_instance.web.ami
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
  description = "public ip of aws ec2 instance"
}

 output "Instance-Details" {
  value = join( " : " ,["ami used is", aws_instance.web.ami,"  & volume size (GB) is", aws_instance.web.root_block_device[0].volume_size])
  description = "public ip of aws ec2 instance"
}
 