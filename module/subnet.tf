// subnet
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "ec2-vpc-sn" {
  cidr_block        = cidrsubnet(aws_vpc.ec2-vpc.cidr_block, 3, 1) // 10.0.32.0/19
  vpc_id            = aws_vpc.ec2-vpc.id                           // attach subnet to above vpc
  availability_zone = var.subnet_availability_zone
  tags              = var.default_tags
}