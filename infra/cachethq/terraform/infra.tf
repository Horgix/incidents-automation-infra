resource "aws_security_group" "allow_all" {
  name        = "${var.project_id}-allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.project} - allow_all"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}

resource "aws_instance" "cachethq" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name      = "${var.project_id}"

  # Network

  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = [
    "${aws_security_group.allow_all.id}"
  ]

  tags {
    Name    = "${var.project} - CachetHQ"
    Project = "${var.project}"
    Owner   = "${var.owner}"
  }
}
output "instance_ip" {
  value = "${aws_instance.cachethq.public_ip}"
}




#
#resource "aws_vpc" "vpc" {
#  cidr_block = "10.42.0.0/16"
#  #enable_dns_support = true
#  #enable_dns_hostnames = true
#  tags = {
#    Name    = "${var.project} - VPC"
#    Project = "${var.project}"
#    Owner   = "${var.owner}"
#  }
#}
#output "vpc_id" {
#  value = "${aws_vpc.vpc.id}"
#}
#
#resource "aws_subnet" "public_subnet_a" {
#  vpc_id                  = "${aws_vpc.vpc.id}"
#  cidr_block              = "10.42.42.0/24"
#  map_public_ip_on_launch = true
#  availability_zone = "${var.region}a"
#
#  tags = {
#    Name    = "${var.project} - Public subnet"
#    Project = "${var.project}"
#    Owner   = "${var.owner}"
#  }
#}
#output "subnet_id_a" {
#  value = "${aws_subnet.public_subnet_a.id}"
#}
#
#resource "aws_internet_gateway" "gw" {
#  vpc_id = "${aws_vpc.vpc.id}"
#  tags {
#    Name    = "${var.project} - Internet Gateway"
#    Project = "${var.project}"
#    Owner   = "${var.owner}"
#  }
#}
#
#resource "aws_route" "internet_access" {
#  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
#  destination_cidr_block = "0.0.0.0/0"
#  gateway_id             = "${aws_internet_gateway.gw.id}"
#}
