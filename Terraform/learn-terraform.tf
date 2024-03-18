variable "components" {
  default = ["frontend" , "catalogue"]


}

resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-006a2998b3aed70ca"]


  tags = {
    Name = element("var.components" , 2 )
  }
}


