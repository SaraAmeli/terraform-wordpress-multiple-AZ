output "wordpress_public_ip" {
  description = "Public IP of the WordPress EC2 instance"
  value       = aws_instance.wordpress.public_ip
}

output "wordpress_private_ip" {
  description = "Private IP of the WordPress EC2 instance (used for SSH from Bastion)"
  value       = aws_instance.wordpress.private_ip
}
