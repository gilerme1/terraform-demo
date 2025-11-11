// 1. Configuración del Proveedor (Provider)
provider "aws" {
  region = "us-east-1"
}

// 2. Definición del Recurso (Resource)
resource "aws_instance" "servidor_web" {
  ami           = "ami-0abcdef1234567890" // ID de una AMI de Amazon Linux (ejemplo)
  instance_type = "t2.micro"
  tags = {
    Name = "MiPrimerServidor"
  }
}