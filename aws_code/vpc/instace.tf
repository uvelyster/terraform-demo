resource "aws_instance" "example" {
  ami                          = "ami-02bfb7ab7fbe1bd32"
  instance_type                = "t2.small"
  vpc_security_group_ids       = [aws_security_group.instance.id]
  key_name                     = aws_key_pair.terraform_key.key_name
  subnet_id                    = aws_subnet.public_subnets[0].id
  # subnet_id                    = "subnet-0f9aee205ea415177"  # 두 번째 public 서브넷 # 차후 vpc와 subnet 생성후 추가하는 것
  associate_public_ip_address  = true
  user_data = <<-EOF
    #!/bin/bash
    sudo dnf install -y httpd
    sudo systemctl enable --now httpd
    echo "Hello, World" > /var/www/html/index.html
  EOF
  tags = {
    Name = "terraform-instance"
  }
}
