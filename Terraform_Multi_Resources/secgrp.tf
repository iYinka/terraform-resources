resource "aws_security_group" "terra-test-sg" {
  vpc_id      = aws_vpc.terra-test.id
  name        = "terra_test_sg"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.MYIP]
  }

  tags = {
    Name = "terra-test-sg-allow_ssh"
  }
}
