variable "amz_ak" {
  type = string
}
variable "amz_sak" {
  type = string
}

variable "server_port" {
  description = "this is the port that will be used to input http requests"
  type        = number
  default     = 8080
}

provider "aws" {
  region     = "us-east-2"
  access_key = var.amz_ak
  secret_key = var.amz_sak
}