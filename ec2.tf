resource "aws_instance" "wordpress" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]

  user_data              = file("${path.module}/user_data.sh")

  associate_public_ip_address = true

  tags = {
    Name = "WordPress-Server"
  }
}

