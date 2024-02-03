# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.VPCEC2.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }
  tags = {
        Name = "PublicRouteTable"
    }
  depends_on = [ aws_vpc.VPCEC2 , aws_internet_gateway.IGW ]
}
# route table association with public subnet
resource "aws_route_table_association" "PublicRouteTableAssociation" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public.id}"
    depends_on = [ aws_subnet.public_subnet , aws_route_table.public ]
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.VPCEC2.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }
  tags = {
    Name = "PrivateRouteTable"
  }
  depends_on = [ aws_vpc.VPCEC2 , aws_internet_gateway.IGW ]
}
# PrivateRouteTable associtaion with private subnet
resource "aws_route_table_association" "PrivateRouteTableAssociation" {
  subnet_id = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.private.id}"
  depends_on = [ aws_subnet.private_subnet , aws_route_table.private ]
}