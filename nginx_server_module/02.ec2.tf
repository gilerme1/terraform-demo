resource "aws_instance" "nginx-server" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = aws_key_pair.nginx-server-ssh.key_name

    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y nginx
        sudo systemctl enable nginx
        sudo systemctl start nginx
    EOF

    vpc_security_group_ids = [aws_security_group.nginx-server-sg.id]

    tags = {
        Name        = var.server_name
        Environment = var.environment
        Owner       = "gilerme1980@gmail.com"
        Team        = "DevOps"
        Project     = "webinar"
    }
}
