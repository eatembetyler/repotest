resource "aws_instance" "app_server" {
    ami = var.app_ami_id
    instance_type = var.app_server_type
    root_block_device {
      volume_size = "40"
    }
    count = var.app_server_count
    key_name = var.ssh_key
    vpc_security_group_ids = [var.vpc_private_security_group_ids]
    iam_instance_profile = var.iam_instance_profile
    monitoring = true
    tags = {
      Name = "${var.environment}-${var.platform}-app0${count.index}"
      CostCenter = "${var.environment}-${var.platform}"
    }
}
resource "aws_route53_record" "app_server_priv_net" {
  count = var.app_server_count
  name = "${var.environment}-${var.platform}-app0${count.index}"
  zone_id = data.aws_route53_zone.modrianet_priv.zone_id
  type = "A"
  ttl = "300"
  records = [aws_instance.app_server.*.private_ip[count.index]]
}
resource "aws_route53_record" "app_server_net" {
  count = var.app_server_count
  name = "${var.environment}-${var.platform}-app0${count.index}"
  zone_id = data.aws_route53_zone.modrianet.zone_id
  type = "A"
  ttl = "300"
  records = [aws_instance.app_server.*.private_ip[count.index]]
}

resource "aws_alb_target_group_attachment" "ec2-play-web" {
    count = var.app_server_count
    target_group_arn = aws_alb_target_group.ec2-play-web.arn
    target_id = aws_instance.app_server.*.id[count.index]
    port = 6021
}
resource "aws_alb_target_group_attachment" "ec2-ext-web" {
    count = var.app_server_count
    target_group_arn = aws_alb_target_group.ec2-ext-web.arn
    target_id = aws_instance.app_server.*.id[count.index]
    port = 8079
}
resource "aws_alb_target_group_attachment" "ec2-qa-web" {
    count = var.app_server_count
    target_group_arn = aws_alb_target_group.ec2-qa-web.arn
    target_id = aws_instance.app_server.*.id[count.index]
    port = 8090
}

resource "aws_instance" "worker_server" {
  ami = var.worker_ami_id
  instance_type = var.worker_server_type
  root_block_device {
    volume_size = "40"
  }
  count = var.worker_server_count
  key_name = var.ssh_key
  vpc_security_group_ids = [var.vpc_private_security_group_ids]
  iam_instance_profile = var.iam_instance_profile
  monitoring = true
  tags = {
    Name = "${var.environment}-${var.platform}-worker0${count.index}"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_route53_record" "worker_server_priv_net" {
  count = var.worker_server_count
  name = "${var.environment}-${var.platform}-worker0${count.index}"
  zone_id = data.aws_route53_zone.modrianet_priv.zone_id
  type = "A"
  ttl = "300"
  records = [aws_instance.worker_server.*.private_ip[count.index]]
}
resource "aws_route53_record" "worker_server_net" {
  count = var.worker_server_count
  name = "${var.environment}-${var.platform}-worker0${count.index}"
  zone_id = data.aws_route53_zone.modrianet.zone_id
  type = "A"
  ttl = "300"
  records = [aws_instance.worker_server.*.private_ip[count.index]]
}

resource "aws_ebs_volume" "datashack_volume" {
  availability_zone = "us-east-1a"
  size = 500
  type = "standard"
  tags = {
    Name = "${var.environment}-${var.platform}-DataShack-volume"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_volume_attachment" "datashack_volume" {
  device_name = "/dev/xvdf"
  volume_id = aws_ebs_volume.datashack_volume.id
  instance_id = aws_instance.worker_server[0].id
  stop_instance_before_detaching = true
  force_detach = true
  skip_destroy = false
}
