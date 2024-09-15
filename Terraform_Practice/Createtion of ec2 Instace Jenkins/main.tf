provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_sg"
  description = "Allow SSH and HTTP Traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk
              wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
              sudo yum install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF
}