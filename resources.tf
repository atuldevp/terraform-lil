resource "google_compute_network" "new-dev-network"{
    name = "newdevlopmentnetwork"
    auto_create_subnetworks = false
}

resource "aws_vpc" "env_example_two" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
      Name = "terraform-aws-vpc-example-two"
  }
}

resource "aws_subnet" "subnet1"{
  vpc_id = "${aws_vpc.env_example_two.id}"
  cidr_block = "${cidrsubnet(aws_vpc.env_example_two.cidr_block, 3, 1)}"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "PrivateSubnet"
  }
}

resource "aws_subnet" "subnet2"{
  vpc_id = "${aws_vpc.env_example_two.id}"
  cidr_block = "${cidrsubnet(aws_vpc.env_example_two.cidr_block, 2, 2)}"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "PrivateSubnet2"
  }
}