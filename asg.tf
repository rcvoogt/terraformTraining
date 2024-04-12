resource "aws_launch_template" "asg_template" {
  name_prefix   = var.asg_prefix
  image_id      = var.asg_ami
  instance_type = var.asg_instance_type
  user_data = filebase64("apache_script.sh")  
  
  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.allow_http.id}"]
  }
  tags = {
    Name = var.asg_name_tag
  }
}

resource "aws_autoscaling_group" "bar" {
  //   
  //availability_zones = var.availability_zones
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1

  vpc_zone_identifier       = [aws_subnet.public_subnet_1.id , aws_subnet.public_subnet_2.id]

  

  launch_template {
    id      = aws_launch_template.asg_template.id
    version = "$Latest"
  }
}

