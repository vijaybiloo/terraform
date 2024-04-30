resource "aws_instance" "count" {
    # either you can conditions or count ""
    count = 10
    ami = var.ami_id # devops-practice region is us -east 1
    # instance_type = var.instance_name == "mongoDB" ? "t3.medium" : "t2.micro"
    # instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "mysql" ? "t3.medium" : "t2.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
    
}   

resource "aws_route53_record" "record" {
    count = 10
    zone_id = var.zone_id
    name    = "${var.instance_names[count.index]}.${var.domain}"
    type    = "A"
    ttl     = 3
    records = [aws_instance.count[count.index].private_ip]
    # either you can conditions or count ""
}

resource "aws_key_pair" "deployer" {
  key_name   = "vijay-pub"
  public_key = file("${path.module}/vijay.pub")
}