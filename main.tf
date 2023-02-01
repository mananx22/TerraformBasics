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
  region = "ap-south-1"
  #   access_key = $AWS_ACCESS_KEY_ID
  #   secret_key = $AWS_SECRET_ACCESS_KEY 
}

resource "random_string" "mananrandom" {
  length           = 6
  special          = false
  override_special = false
}

resource "random_string" "mananrandom2" {
  length           = 6
  special          = false
  override_special = false
}

resource "aws_instance" "web" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  tags = {
    Name = join("-", ["TerraformBasicMachine" , random_string.mananrandom.result])
  }
}

resource "aws_instance" "web2" {
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  tags = {
    Name = join("-", ["TerraformBasicMachine" , random_string.mananrandom2.result])
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
 