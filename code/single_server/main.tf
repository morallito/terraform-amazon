variable "amz_ak" {
  type = string
}
variable "amz_sak" {
  type = string
}

provider "aws" {
    region = "us-east-2"
    access_key = var.amz_ak
    secret_key = var.amz_sak
}


resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}