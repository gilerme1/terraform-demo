# 1. Configuración del Proveedor
provider "aws" {
  region = "us-east-1"
}

# 2. Crear una instancia EC2 gratuita
resource "aws_instance" "servidor_web" {
  ami           = "ami-0cae6d6fe6048ca2c" # Amazon Linux 2023(free tier)
  instance_type = "t2.micro"

  tags = {
    Name = "MiPrimerServidor"
  }
}
