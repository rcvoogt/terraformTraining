resource "aws_instance" "bastionhost" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name = var.key_pair

  associate_public_ip_address = true

  tags = {
    Name = var.ec2_name_tag
  }
    provisioner "file" {
        source      = "MobaXTerm.pem"
        destination = "/home/ec2-user/MobaXTerm.pem"
        
        connection {
            type        = "ssh"
            user        = var.ec2_default_user
            private_key = "${file("MobaXTerm.pem")}"
            host        = "${self.public_ip}"
        }

    }
    provisioner "remote-exec" {
        inline = [
            "chmod 400 /home/ec2-user/MobaXTerm.pem"
        ]

        connection {
            type        = "ssh"
            user        = var.ec2_default_user
            private_key = "${file("MobaXTerm.pem")}"
            host        = "${self.public_ip}"
        }
    }

    

}

resource "aws_instance" "ec2_private_subnet" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  subnet_id = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name = var.key_pair

  user_data_replace_on_change = true
  user_data_base64 = filebase64("aws-cli_script.sh")  
  

  tags = {
    Name = var.ec2_private_name_tag
  }
}