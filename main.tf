module "ec2Module" {
  source    = "./ec2Module"
  ami_in    = "ami-01a4f99c4ac11b03c"
  type_in   = "t2.micro"
  suffix_in = "TerraformBasicMachine"
  count_in  = 2
  length_in = 6
}

