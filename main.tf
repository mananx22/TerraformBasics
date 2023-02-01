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

variable "count-length" {
  type = number
  default = 2
}

resource "random_string" "mananrandom" {
  count = var.count-length
  length           = 6
  special          = false
  override_special = false
}

resource "aws_instance" "web" {
  count = var.count-length
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  tags = {
    Name = join("-", ["TerraformBasicMachine" , random_string.mananrandom[count.index].result])
  }
}

 output "Instance-ami" {
  value = [for i in aws_instance.web[*]: join( " : " ,["ami used is", i.ami, "& ip address is ", i.public_ip, "  & volume size (GB) is", i.root_block_device[0].volume_size])]
  description = "public ip of aws ec2 instance"
}