
provider "aws" {
  region = "eu-west-1"
}

data "aws_ami" "devops_ubuntu_trusty" {
  most_recent = true
  filter {
    name = "name"                
    values = [ "devops-ubuntu-14-04-x64*" ]
  }
  owners = [ "self" ] 
}

data "aws_ami" "devops_ubuntu_xenial" {
  most_recent = true
  filter {
    name = "name"                
    values = [ "devops-ubuntu-16-04-x64*" ]
  }
  owners = [ "self" ] 
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.2.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "test_subnet" {
  cidr_block = "${aws_vpc.test_vpc.cidr_block}"
  map_public_ip_on_launch = "true"
  vpc_id = "${aws_vpc.test_vpc.id}"
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.test_vpc.id}"
}

resource "aws_security_group" "test_security" {
  name = "test_security"
  vpc_id = "${aws_vpc.test_vpc.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = "${aws_vpc.test_vpc.id}"
}

resource "aws_route_table" "test_routing" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test_igw.id}"
  }
}

resource "aws_main_route_table_association" "test_routing_a" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  route_table_id = "${aws_route_table.test_routing.id}"
}

resource "aws_key_pair" "test_key" {
  key_name = "test_key" 
  public_key = "${file("test.pub")}"
}

resource "aws_instance" "test_server" {
  ami = "${data.aws_ami.devops_ubuntu_xenial.id}"
  instance_type = "t2.medium"
  tags {
    Name = "test_server"
  }
  key_name = "${aws_key_pair.test_key.key_name}"
  subnet_id = "${aws_subnet.test_subnet.id}"
  vpc_security_group_ids = [ "${aws_security_group.test_security.id}" ]
}
