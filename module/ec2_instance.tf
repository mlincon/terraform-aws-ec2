// create the EC2
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "ec2-main" {
  ami                         = var.ami_id
  instance_type               = var.ec2_instance_type
  key_name                    = var.pem_key_name
  security_groups             = [aws_security_group.ec2-vpc-sg.id]
  subnet_id                   = aws_subnet.ec2-vpc-sn.id
  associate_public_ip_address = true // required for assigning public ip
  tags                        = var.default_tags
}