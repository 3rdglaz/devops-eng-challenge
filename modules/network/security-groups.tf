resource "aws_security_group" "noticias-nuvem-sg" {
  name        = "noticias-nuvem-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    description      = ""
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainvpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Department  = "DevOps" 
    Environment = "Production" 
    Name   = "noticias-nuvem-sg" 
    Owner       = "Terraform" 
    Project     = "noticias-nuvem" 
  }
}

resource "aws_vpc_security_group_ingress_rule" "sql-export" {
  referenced_security_group_id = aws_security_group.noticias-nuvem-sg.id

  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
}