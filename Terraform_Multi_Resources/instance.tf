resource "aws_key_pair" "terra-key" {
  key_name   = "terra01-key"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "terra-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.terra-test-pub-1.id
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [aws_security_group.terra-test-sg.id]
  tags = {
    Name = "Terra Instance"
  }

  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("terra01key")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
}

resource "aws_ebs_volume" "vol_4_terra" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-terra",
  }
}
resource "aws_volume_attachment" "attach_vol_terra" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_terra.id
  instance_id = aws_instance.terra-inst.id
}

output "PublicIP" {
  value = aws_instance.terra-inst.public_ip
}