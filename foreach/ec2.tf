resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = each.value
    for_each = var.instances
    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_id}"
  type    = "A"
  ttl     = 3
  records = [each.key == "Web-Nginx" ? each.value.public_ip : each.value.private_ip ]
  for_each = aws_instance.roboshop
}


# output "aws_instance_info" {
#   value = aws_instance.roboshop
# }
