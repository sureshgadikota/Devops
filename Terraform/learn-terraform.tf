variable "ami" {
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  default = ["sg-006a2998b3aed70ca"]
}

variable "components" {
  default = {
    frontend  = { name = "frontend-dev" }
    catalogue = { name = "catalogue-dev" }
    mongodb   = { name = "mongodb-dev" }
    user      = { name = "user-dev" }
    redis     = { name = "redis-dev" }
    cart      = { name = "cart-dev" }
    mysql     = { name = "mysql-dev" }
    shipping  = { name = "shipping-dev" }
    payment   = { name = "payment-dev" }
    rabbitmq  = { name = "rabbitmq-dev" }
  }
}
resource "aws_instance" "instance" {
  for_each      = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups



  tags = {
    name     = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z049869630CEPSXALO943"
  name    = "frontend-dev.devopskumar.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend-dev.private_ip]



