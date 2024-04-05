module "records" {
    source  = "terraform-aws-modules/route53/aws//modules/records"
    zone_name = var.zone_name
    for_each = local.ips
    records = [
        {
            name    = "${each.key}"
            type    = "A"
            ttl     = 6
            records = [
                each.key == "Web-Nginx" ? each.value.public_ip : each.value.private_ip
        ]
        }

    ]
}