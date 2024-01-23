resource "aws_instance" "example" {
  ami           = "ami-02bfb7ab7fbe1bd32"  # 사용할 AMI ID
  instance_type = "t2.small"              # EC2 인스턴스 유형
  vpc_security_group_ids = [aws_security_group.instance.id]  # 보안 그룹을 연결합니다.
  user_data = <<-EOF
    #!/bin/bash
    sudo dnf install -y httpd            # Apache HTTP 서버 설치
    sudo systemctl enable --now httpd   # HTTP 서버 시작 및 부팅 시 자동 시작 설정
    echo "Hello, World" > /var/www/html/index.html  # 웹 페이지 생성
  EOF

  tags = {
    Name = "terraform-instance"
  }
}

resource "aws_security_group" "instance" {
  name        = "terraform-instance-sg"
  description = "Security Group for terraform instance"
  vpc_id      = "vpc-02f33f0b15270071a"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 IP 주소에서 HTTP 트래픽 허용
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 IP 주소에서 SSH 트래픽 허용
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 IP 주소에서 HTTPS 트래픽 허용
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]  # 모든 IP 주소로부터 모든 트래픽 허용
  }

  tags = {
    Name = "terraform-sg"
  }
}
