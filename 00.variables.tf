variable "region" {
    description = "Región AWS"
    default     = "us-east-1"
}

variable "ami_id" {
    description = "AMI de Amazon Linux"
    default     = "ami-0cae6d6fe6048ca2c"
}

variable "instance_type" {
    description = "Tipo de instancia EC2"
    default     = "t2.micro"
}

variable "server_name" {
    description = "Nombre del servidor"
    default     = "nginx-server"
}

variable "environment" {
    description = "Ambiente de despliegue"
    default     = "dev"
}
