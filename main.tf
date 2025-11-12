####### modulos #######

terraform {
    backend "s3" {
        bucket= "webinar-terraform-guillermo"
        key = "webinar-terraform/terraform.tfstate"
        region= "us-east-1"
    }
}


module "nginx_server_dev" {
    source = "./nginx_server_module"

    ami_id = "ami-0440d3b780d96b29d"
    instance_type = "t3.medium"
    server_name = "nginx-server-dev"
    environment = "dev"
}

module "nginx_server_qa" {
    source = "./nginx_server_module"

    ami_id = "ami-0440d3b780d96b29d"
    instance_type = "t3.small"
    server_name = "nginx-server-qa"
    environment = "qa"
}

output "nginx_dev_ip" {
    description = "Dirección IP pública"
    value       = module.nginx_server_dev.server_public_ip
    }

    output "nginx_dev_dns" {
    description = "DNS público"
    value       = module.nginx_server_dev.server_public_dns
}

output "nginx_qa_ip" {
    description = "Dirección IP pública"
    value       = module.nginx_server_qa.server_public_ip
    }

    output "nginx_qa_dns" {
    description = "DNS público"
    value       = module.nginx_server_qa.server_public_dns
}
