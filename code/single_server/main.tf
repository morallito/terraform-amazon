variable "amz_ak" {
  type = string
}
variable "amz_sak" {
  type = string
}

variable "server_port"{
  description = "this is the port that will be used to input http requests"
  type = number 
  default = 8080
}

provider "aws" {
    region = "us-east-2"
    access_key = var.amz_ak
    secret_key = var.amz_sak
}


resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.rg-instance-test.id]

    user_data = <<-EOF
      #!/bin/bash 
      echo "Hello World" >> index.html
      nohup busybox httpd -f -p ${var.server_port} &
      EOF

    tags = {
      name = "terraform-example"
    }
}

resource "aws_security_group" "rg-instance-test" {
  name = "instance-exemplo"
  ingress{
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}