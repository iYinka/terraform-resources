resource "aws_vpc" "terra-test" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terra-test-vpc"
  }
}


resource "aws_subnet" "terra-test-pub-1" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terra-test-pub-1"
  }
}
resource "aws_subnet" "terra-test-pub-2" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "terra-test-pub-2"
  }
}
resource "aws_subnet" "terra-test-pub-3" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "terra-test-pub-3"
  }
}


resource "aws_subnet" "terra-test-priv-1" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "terra-test-priv-1"
  }
}
resource "aws_subnet" "terra-test-priv-2" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "terra-test-priv-2"
  }
}
resource "aws_subnet" "terra-test-priv-3" {
  vpc_id                  = aws_vpc.terra-test.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "terra-test-priv-3"
  }
}

resource "aws_internet_gateway" "terra-test-IGW" {
  vpc_id = aws_vpc.terra-test.id
  tags = {
    Name = "terra-test-IGW"
  }
}

resource "aws_route_table" "terra-test-pub-RT" {
  vpc_id = aws_vpc.terra-test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra-test-IGW.id
  }
  tags = {
    Name = "terra-test-pub-RT"
  }
}

resource "aws_route_table_association" "terra-test-pub-1-a" {
  subnet_id      = aws_subnet.terra-test-pub-1.id
  route_table_id = aws_route_table.terra-test-pub-RT.id
}
resource "aws_route_table_association" "terra-test-pub-2-a" {
  subnet_id      = aws_subnet.terra-test-pub-2.id
  route_table_id = aws_route_table.terra-test-pub-RT.id
}
resource "aws_route_table_association" "terra-test-pub-3-a" {
  subnet_id      = aws_subnet.terra-test-pub-3.id
  route_table_id = aws_route_table.terra-test-pub-RT.id
}