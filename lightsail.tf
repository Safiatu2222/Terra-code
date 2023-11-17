resource "aws_lightsail_instance" "example" {
  name              = "example-instance"
  availability_zone = "us-east-1"  
  blueprint_id      = "amazon_linux_2"  

  bundle_id = "nano_2_0"  

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
              EOF

 # key_pair_name = "your-key-pair-name"  
}

output "public_ip" {
  value = aws_lightsail_static_ip.example_static_ip.ip_address
}