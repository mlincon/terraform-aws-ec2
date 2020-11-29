// security group
// - manage traffic at the server/resource level
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "ec2-vpc-sg" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.ec2-vpc.id // attach sg to above vpc

  // inbound rules #1: SSH
  ingress {
    cidr_blocks = ["0.0.0.0/0"] // use to specify the source, here allow all
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  // outbound rules #1: All traffic
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = var.default_tags
}