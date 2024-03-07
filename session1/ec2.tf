resource "aws_instance" "krishna" {
    ami = var.ami_id # region is us -east 1
    instance_type = var.instance_type
}