resource "random_string" "mananrandom" {
  count  = var.count_in
  length = var.length_in
}

resource "aws_instance" "web" {
  count         = var.count_in
  ami           = var.ami_in
  instance_type = var.type_in
  tags = {
    Name = join("-", [var.suffix_in, random_string.mananrandom[count.index].result])
  }
}