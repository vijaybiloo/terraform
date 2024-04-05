output "public_subnets_ids" {
  value       = local.public_subnet_ids
}

output "private_subnets_ids" {
  value       = local.private_subnet_ids
}

output "database_subnets_ids" {
  value       = local.database_subnet_ids
}

output "ami_id" {
  value = data.aws_ami.devops_ami.id
}

output "ips"{
  value = local.ips
}