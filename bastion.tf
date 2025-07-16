resource "aws_instance" "bastion" {
    ami                    = var.ami_id
    instance_type          = "t3.micro"
    key_name               = var.key_name
    subnet_id              = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.bastion_sg.id]

    associate_public_ip_address = true

    tags ={
        Name ="BastionHost"
    }

}