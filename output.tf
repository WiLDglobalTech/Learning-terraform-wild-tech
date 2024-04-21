output "ec2_public_ip" {
  value = aws_instance.my_first_instance.public_ip
}