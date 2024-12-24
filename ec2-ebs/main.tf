resource "aws_instance" "test-server" {
  ami           = "ami-0ca9fb66e076a6e32"
  instance_type = "t2.micro"
  key_name      = "ec2-key"
  tags = {
    Team = "Dev team"
  }
}

resource "aws_ebs_volume" "dev-vol" {
  availability_zone = aws_instance.test-server.availability_zone
  size              = 25

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.dev-vol.id
  instance_id = aws_instance.test-server.id
}
