
resource "aws_instance" "jenkins_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "my-key-pair"  # Change this to your key pair

  security_groups = [aws_security_group.jenkins_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    #Java--INstall
    sudo apt update -y
    sudo apt install fontconfig openjdk-17-jre -y
    java -version
    openjdk version "17.0.13" 2024-10-15
    OpenJDK Runtime Environment (build 17.0.13+11-Debian-2)
    OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing)
    #sudo yum update -y
    #sudo yum install -y java-11-openjdk
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt-get update
    sudo apt-get install jenkins
  EOF

  tags = {
    Name = "Jenkins-EC2"
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow SSH and Jenkins UI access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
