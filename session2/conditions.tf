resource "aws_instance" "conditions" {
ami = var.ami_id # devops-practice region is us -east 1
instance_type = var.instance_names == "MongoDB" || var.instance_names == "mysql" ? "t3.medium" : "t2.micro"
}