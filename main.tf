# 1. Configuración del Proveedor
provider "aws" {
  region = "us-east-1"
}

# 2. Crear una instancia EC2 gratuita
resource "aws_instance" "nginx-server" {
  ami           = "ami-0cae6d6fe6048ca2c" # Amazon Linux 2023(free tier)
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF

  key_name      = aws_key_pair.nginx-server-ssh.key_name 

  vpc_security_group_ids = [
    aws_security_group.nginx-server-sg.id
  ]

  tags = {
    Name = "nginx-server"
    Environment = "test"
    Owner = "gilerme1980@gmail.com"
    Team = "DevOps"
    Project = "webinar"
  }
}

####### SSH ########
# $ ssh-keygen -t rsa -b 2048 -f nginx-server.key

resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "nginx-server-ssh-v2"           
  public_key = file("nginx-server-v2.key.pub") # Este es el archivo que creaste

  tags = {
    Name = "nginx-server-ssh"
    Environment = "test"
    Owner = "gilerme1980@gmail.com"
    Team = "DevOps"
    Project = "webinar"
  }
}


####### SG #######
resource "aws_security_group" "nginx-server-sg" {
  name        = " nginx-server-sg"
  description = "Permitir HTTP y SSH"

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
    from_port   = 0      //desde puerto 0 al 0 o sea todos los puertos en aws
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Name = "nginx-server-sg"
    Environment = "test"
    Owner = "gilerme1980@gmail.com"
    Team = "DevOps"
    Project = "webinar"
  }
}

