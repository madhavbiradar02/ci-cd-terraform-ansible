resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "User-1-key"  # Replace with your AWS key pair

  tags = {
    Name = "CI-CD-App-Server"
  }
}