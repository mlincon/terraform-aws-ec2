// routing table
// - regulate traffic to and from the network based on set of entries or rules
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "ec2-rt" {
  vpc_id = aws_vpc.ec2-vpc.id

  // divert all traffic through the VPC internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2-vpc-igw.id
  }

  tags = var.default_tags
}


// - create an association between the subnet and the route table
// - this will expose the subnet to the internet for access
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "ec2-rt-association" {
  subnet_id      = aws_subnet.ec2-vpc-sn.id
  route_table_id = aws_route_table.ec2-rt.id
}
