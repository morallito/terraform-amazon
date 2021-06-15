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




resource "aws_launch_configuration" "example" {
  image_id        = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.rg-instance-test.id]
  user_data       = <<-EOF
    #!/bin/bash 
    echo "Hello World" >> index.html
    nohup busybox httpd -f -p ${var.server_port} &
    EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-example" {
  min_size            = 2
  max_size            = 10
  vpc_zone_identifier = data.aws_subnet_ids.default.ids

  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
  launch_configuration = aws_launch_configuration.example.name

  tag {
    key                 = "name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}


output "alb_dns_name" {
  value = aws_lb.example.dns_name
}