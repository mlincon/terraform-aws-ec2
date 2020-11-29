// elastic ip
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "ec2-elastic-ip" {
  instance = aws_instance.ec2-main.id
  vpc      = true
  tags     = var.default_tags
}
