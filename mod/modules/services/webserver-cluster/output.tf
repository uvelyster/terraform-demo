output "alb_dns_name" {
  value = aws_lb.example.dns_name
  description = " The domain name of loadbalancer"
}

output "asg_name" {
  value = aws_autoscaling_group.example.name
  description = "The name of Autoscaling Group"
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
  description = "Security Group ID for LoadBalancer"
}

