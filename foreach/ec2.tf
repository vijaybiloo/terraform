resource "aws_instance" "roboshop" {
    ami = var.ami_id
    # instance_type = "t2.micro"
    for_each = var.instances
    instance_type = each.value
    tags = {
        Name = each.key

    }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 3
  records = [each.key == "Web-Nginx" ? each.value.public_ip : each.value.private_ip ]
}


# output "aws_instance_info" {
#   value = aws_instance.roboshop
# }

output "instance_ips" {
  value = "aws_instance.roboshop"
}
