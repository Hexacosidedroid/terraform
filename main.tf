resource "aws_launch_configuration" "example" {
	image_id = "ami-08edbb0e85d6a0a07"
	instance_type = "t2.micro"
	security_groups = [aws_security_group.instance.id]
	user_data =  <<-EOF
		#!/bin/bash
		echo "Hello, World" > index.html
		nohup busybox httpd -f -p ${var.server_port} &
		EOF
	lifecycle {
		create_before_destroy = true
	}
}
