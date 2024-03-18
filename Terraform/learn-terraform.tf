resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"

  security_groups = [sg-006a2998b3aed70ca]

  tags = {
    Name = "HelloWorld"
  }
}