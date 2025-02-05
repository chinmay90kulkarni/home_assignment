
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

# Launch Template for EC2 instances
resource "aws_launch_template" "ec2_lt" {
  name_prefix   = "ec2-docker-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install docker -y
    sudo systemctl start docker
    sudo usermod -a -G docker ec2-user

    docker run -d -p 80:80 ${var.docker_image}
    EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ec2-docker-instance"
    }
  }
}

# Auto Scaling Group using the Launch Template
resource "aws_autoscaling_group" "asg" {
  name                = "ec2-docker-asg"
  max_size            = 5
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = [aws_subnet.private.id]

  launch_template {
    id      = aws_launch_template.ec2_lt.id
    version = "$Latest"
  }

  # Register with the ALB target group (see alb.tf)
  target_group_arns = [aws_lb_target_group.alb_tg.arn]

  tag {
    key                 = "Name"
    value               = "ec2-docker-instance"
    propagate_at_launch = true
  }
}


################### NAT Gateway #################

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id 

  tags = {
    Name = "nat-gateway"
  }
}

