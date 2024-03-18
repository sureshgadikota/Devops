resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-006a2998b3aed70ca"]


  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "frontend.devopskumar.site"
  type    = "A"
  ttl     = 30
  records = [172.31.21.241]
}
