resource "aws_security_group" "Monitoring-Server-SG" {
  name        = "Monitoring-Server-SG"
  description = "Allow inbound traffic for Monitoring Server"

  ingress = [
    for port in [22, 80, 443, 9090, 9100, 3000] : {
      description      = "Inbound rule for port ${port}"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Monitoring-Server-SG"
  }
}


resource "aws_instance" "web" {
  ami                    = "ami-084568db4383264d4"     
  instance_type          = "t2.micro" 
  key_name               = "ahmed-key"            
  vpc_security_group_ids = [aws_security_group.Monitoring-Server-SG.id]
  user_data              = templatefile("./install.sh", {})

  tags = {
    Name = "Monitoring-Server"
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
    delete_on_termination = true
  }
}

