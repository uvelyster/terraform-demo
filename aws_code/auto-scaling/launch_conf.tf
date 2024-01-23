resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
  image_id = "ami-02bfb7ab7fbe1bd32" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.small"
  key_name = aws_key_pair.terraform_key.key_name
  security_groups = [aws_security_group.instance.id]
  associate_public_ip_address = true
  user_data = file("user-data.sh")

  lifecycle {
    create_before_destroy = true
  }
}
