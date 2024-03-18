variable "components" {
  default = {
    frontend  = { name = "frontend" }
    catalogue = { name = "catalogue" }
    mongodb   = { name = "mongodb" }
  }
}
resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-006a2998b3aed70ca"]



  tags = {

    name     = lookup(var.components, each.value["name"], null)
  }
}


