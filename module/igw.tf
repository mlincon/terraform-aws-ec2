// internet gateway: to route traffic from internet to VPC
// - allows external users to communicate with parts of the VPC
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "ec2-vpc-igw" {
  vpc_id = aws_vpc.ec2-vpc.id
  tags   = var.default_tags
}
