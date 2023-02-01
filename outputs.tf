 output "Instance-ami" {
  value = [for i in aws_instance.web[*]: join( " : " ,["ami used is", i.ami, "& ip address is ", i.public_ip, "  & volume size (GB) is", i.root_block_device[0].volume_size])]
  description = "public ip of aws ec2 instance"
}