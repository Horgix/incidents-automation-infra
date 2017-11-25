resource "aws_vpc" "vpc" {
  cidr_block = "10.42.0.0/16"
  #enable_dns_support = true
  #enable_dns_hostnames = true
  tags = {
    Name    = "${var.project} - VPC"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "10.42.42.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${var.region}a"

  tags = {
    Name    = "${var.project} - Public subnet"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}
output "subnet_id_a" {
  value = "${aws_subnet.public_subnet_a.id}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name    = "${var.project} - Internet Gateway"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}
