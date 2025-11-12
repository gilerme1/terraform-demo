output "server_public_ip" {
    description = "Dirección IP pública"
    value       = aws_instance.nginx-server.public_ip
    }

    output "server_public_dns" {
    description = "DNS público"
    value       = aws_instance.nginx-server.public_dns
}
