resource "aws_instance" "krishna" {
    ami = "ami-0f3c7d07486cad139" # region is us -east 1
    instance_type = "t2.micro"
}