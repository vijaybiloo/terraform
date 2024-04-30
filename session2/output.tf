output "private_ips" {
  value       = aws_instance.conditions.private_ip[*]
}

/* output "public_ips" {
  value =  aws_instance.conditions.public_ip[*]
  # you can have both private and public ids
} */