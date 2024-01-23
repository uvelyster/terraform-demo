resource "aws_instance" "example" {
  ami                    = "ami-0221383823221c3ce"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = aws_key_pair.terraform_key.key_name
  
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
