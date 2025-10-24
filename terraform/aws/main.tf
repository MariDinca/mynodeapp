provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "node_app_sg" {
  name        = "node-app-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node_app" {
  ami           = "ami-02fda57d7882770d8"
  instance_type = "t3.micro"
  key_name      = "ssh-key"
  vpc_security_group_ids = [aws_security_group.node_app_sg.id]

  tags = {
    Name = "NodeAppServer"
  }
}

output "public_ip" {
  value = aws_instance.node_app.public_ip
}

