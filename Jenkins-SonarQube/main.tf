resource "aws_instance" "jenkins_vm" {
  ami                    = "ami-084568db4383264d4" 
  instance_type          = "t2.micro"
  key_name               = "ahmed-key" 
  vpc_security_group_ids = [aws_security_group.jenkins_vm_sg.id]
  user_data              = templatefile("./install.sh", {}) # Bootstrap script

  tags = {
    Name = "Ahmed-Jenkins-SonarQube"
  }

  root_block_device {
    volume_size = 40
  }
}

resource "aws_security_group" "jenkins_vm_sg" {
  name        = "jenkins-vm-sg"
  description = "Allow necessary ports for Jenkins, SonarQube, etc."

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "Allow port ${port}"
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
    Name = "jenkins-vm-sg"
  }
}
