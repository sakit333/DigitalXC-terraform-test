output "ec2_instance_ip" {
  value = aws_instance.web_instance.public_ip
}

output "ec2_instance_ipv4_dns" {
  value = aws_instance.web_instance.public_dns
}

output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}

output "rds_ipv4_dns" {
  value = aws_db_instance.db_instance.address
}


