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
  count = 3
  length           = 6
  special          = false
  override_special = false
}

resource "aws_instance" "web" {
  count = 3
  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"
  tags = {
    Name = join("-", ["TerraformBasicMachine" , random_string.mananrandom[count.index].result])
  }
}

 output "Instance-ami" {
  value = aws_instance.web[*].ami
}

 output "Instance-Ip" {
  value = aws_instance.web[*].public_ip
}

 output "Instance-volume" {
  value = aws_instance.web[*].root_block_device[0].volume_size
}
 