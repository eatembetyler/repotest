data "template_file" "dashboard_non_prod" {
  count = var.platform != "prod" ? 1 : 0
  template = file("${path.module}/templates/dashboards_non_prod.json.tpl")
  vars = {
    region = var.region
    environment = var.environment
    platform = var.platform
    app00-server-id = aws_instance.app_server.0.id
    worker00-server-id = aws_instance.worker_server.0.id
    play-elb = aws_alb.ec2-play-lb.arn_suffix
    play-target-group = aws_alb_target_group.ec2-play-web.arn_suffix
    ext-elb = aws_alb.ec2-ext-lb.arn_suffix
    ext-target-group = aws_alb_target_group.ec2-ext-web.arn_suffix
    web-elb = aws_alb.ec2-qa-lb.arn_suffix
    web-target-group = aws_alb_target_group.ec2-qa-web.arn_suffix
    efs_filesystem_id = var.efs_filesystem_id
  }
}
# 
data "template_file" "dashboard_prod" {
  count = var.platform == "prod" ? 1 : 0
  template = file("${path.module}/templates/dashboards_prod.json.tpl")
  vars = {
    region = var.region
    environment = var.environment
    platform = var.platform
    app00-server-id = aws_instance.app_server.0.id
    app01-server-id = aws_instance.app_server.1.id
    app02-server-id = aws_instance.app_server.2.id
    app03-server-id = aws_instance.app_server.3.id
    worker00-server-id = aws_instance.worker_server.0.id
    smtp-relay-server-id = var.smtp_relay_server_id
    play-elb = aws_alb.ec2-play-lb.arn_suffix
    play-target-group = aws_alb_target_group.ec2-play-web.arn_suffix
    ext-elb = aws_alb.ec2-ext-lb.arn_suffix
    ext-target-group = aws_alb_target_group.ec2-ext-web.arn_suffix
    web-elb = aws_alb.ec2-qa-lb.arn_suffix
    web-target-group = aws_alb_target_group.ec2-qa-web.arn_suffix
    efs_filesystem_id = var.efs_filesystem_id
  }
}
# 
# 
# 
resource "aws_cloudwatch_dashboard" "prod" {
  count = var.platform == "prod" ? 1 : 0
  dashboard_name = "${var.environment}-${var.platform}-ec2"
  dashboard_body = data.template_file.dashboard_prod[count.index].rendered
}
resource "aws_cloudwatch_dashboard" "non_prod" {
  count = var.platform != "prod" ? 1 : 0
  dashboard_name = "${var.environment}-${var.platform}-ec2"
  dashboard_body = data.template_file.dashboard_non_prod[count.index].rendered
}
# 