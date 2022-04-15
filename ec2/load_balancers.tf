resource "aws_alb" "ec2-play-lb" {
  name = "${var.environment}-${var.platform}-ec2-play-lb"
  security_groups = [var.vpc_dmz_security_group_ids]
  subnets = flatten([var.dmz_subnet_id])
  idle_timeout = "300"
  enable_cross_zone_load_balancing = true
  enable_http2 = false
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-play-lb"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_alb_target_group" "ec2-play-web" {
  name = "${var.environment}-${var.platform}-ec2-play-web"
  port = 6021
  protocol = "HTTP"
  deregistration_delay = 300
  load_balancing_algorithm_type = "round_robin"
  vpc_id = var.vpc_id
  target_type = "instance"
  health_check {
    port = "14000"
    protocol = "HTTP"
    path = "/resources/healthcheck.html"
    interval = 30
    timeout = 5
    unhealthy_threshold = 2
    healthy_threshold = 3
  }
  stickiness {
    type = "lb_cookie"
    cookie_duration = "300"
    enabled = true
  }
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-play-web"
  }
  depends_on = [aws_alb.ec2-play-lb]
  lifecycle {
    ignore_changes = [
     lambda_multi_value_headers_enabled
    ]
 }
}
resource "aws_alb_listener" "ec2-play-http" {
  load_balancer_arn = aws_alb.ec2-play-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}
resource "aws_alb_listener" "ec2-play-web" {
  load_balancer_arn = aws_alb.ec2-play-lb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = var.webapp_ssl_policy
  certificate_arn = var.ssl_cert_arn
  default_action {
    target_group_arn = aws_alb_target_group.ec2-play-web.arn
    type = "forward"
  }
}
resource "aws_route53_record" "ec2-play-lb" {
  name = "${var.environment}-${var.platform}-unified-play"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = aws_alb.ec2-play-lb.dns_name
    zone_id = aws_alb.ec2-play-lb.zone_id
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "PRIMARY"
  }
  set_identifier = "ec2-play-lb-primary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_record" "ec2-play-lb-failover" {
  name = "${var.environment}-${var.platform}-unified-play"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = "maintenance.modria.com"
    zone_id = "Z2F7QUD2U4FKAE"
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "SECONDARY"
  }
  set_identifier = "ec2-play-lb-secondary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_health_check" "ec2-play-lb" {
  fqdn = "${var.environment}-${var.platform}-unified-play.modria.com"
  type = "HTTP"
  port = "80"
  resource_path = "/resources/healthcheck.html"
  failure_threshold = "3"
  request_interval = "30"
  tags = {
    Name = "${var.environment}-${var.platform}-unified-play-dns-healthcheck"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_cloudwatch_metric_alarm" "unified-play-dns-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-unified-play-dns-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthCheckStatus"
  namespace = "AWS/Route53"
  period = "60"
  statistic = "Minimum"
  threshold = "0.5"
  alarm_description = "ECS Web DNS Healthcheck"
  actions_enabled = true
  alarm_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  ok_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  dimensions = {
    HealthCheckId = aws_route53_health_check.ec2-play-lb.id
  }
  treat_missing_data = "notBreaching"
  depends_on = [aws_route53_health_check.ec2-play-lb]
}



resource "aws_alb" "ec2-ext-lb" {
  name = "${var.environment}-${var.platform}-ec2-ext-lb"
  security_groups = [var.vpc_dmz_security_group_ids]
  subnets = flatten([var.dmz_subnet_id])
  idle_timeout = "300"
  enable_cross_zone_load_balancing = true
  enable_http2 = false
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-ext-lb"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_alb_target_group" "ec2-ext-web" {
  name = "${var.environment}-${var.platform}-ec2-ext-web"
  port = 8079
  protocol = "HTTP"
  deregistration_delay = 300
  load_balancing_algorithm_type = "round_robin"
  vpc_id = var.vpc_id
  target_type = "instance"
  health_check {
    port = "8079"
    protocol = "HTTP"
    path = "/ws/services"
    interval = 30
    timeout = 5
    unhealthy_threshold = 2
    healthy_threshold = 3
  }
  stickiness {
    type = "lb_cookie"
    cookie_duration = "300"
    enabled = true
  }
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-ext-web"
  }
  depends_on = [aws_alb.ec2-ext-lb]
  lifecycle {
    ignore_changes = [
      lambda_multi_value_headers_enabled
    ]
 }
}
resource "aws_alb_listener" "ec2-ext-http" {
  load_balancer_arn = aws_alb.ec2-ext-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.ec2-ext-web.arn
  }
}

resource "aws_alb_listener" "ec2-ext-web" {
  load_balancer_arn = aws_alb.ec2-ext-lb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = var.api_ssl_policy
  certificate_arn = var.ssl_cert_arn
  default_action {
    target_group_arn = aws_alb_target_group.ec2-ext-web.arn
    type = "forward"
  }
}
resource "aws_route53_record" "ec2-ext-lb" {
  name = "${var.environment}-${var.platform}-unified-ext"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = aws_alb.ec2-ext-lb.dns_name
    zone_id = aws_alb.ec2-ext-lb.zone_id
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "PRIMARY"
  }
  set_identifier = "ec2-ext-lb-primary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_record" "ec2-ext-lb-failover" {
  name = "${var.environment}-${var.platform}-unified-ext"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = "maintenance.modria.com"
    zone_id = "Z2F7QUD2U4FKAE"
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "SECONDARY"
  }
  set_identifier = "ec2-ext-lb-secondary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_health_check" "ec2-ext-lb" {
  fqdn = "${var.environment}-${var.platform}-unified-ext.modria.com"
  type = "HTTP"
  port = "80"
  resource_path = "/ws/services"
  failure_threshold = "3"
  request_interval = "30"
  tags = {
    Name = "${var.environment}-${var.platform}-unified-ext-dns-healthcheck"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_cloudwatch_metric_alarm" "unified-ext-dns-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-unified-ext-dns-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthCheckStatus"
  namespace = "AWS/Route53"
  period = "60"
  statistic = "Minimum"
  threshold = "0.5"
  alarm_description = "ECS Web DNS Healthcheck"
  actions_enabled = true
  alarm_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  ok_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  dimensions = {
    HealthCheckId = aws_route53_health_check.ec2-ext-lb.id
  }
  treat_missing_data = "notBreaching"
  depends_on = [aws_route53_health_check.ec2-ext-lb]
}



resource "aws_alb" "ec2-qa-lb" {
  name = "${var.environment}-${var.platform}-ec2-qa-lb"
  security_groups = [var.vpc_dmz_security_group_ids]
  subnets = flatten([var.dmz_subnet_id])
  idle_timeout = "300"
  enable_cross_zone_load_balancing = true
  enable_http2 = false
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-qa-lb"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_alb_target_group" "ec2-qa-web" {
  name = "${var.environment}-${var.platform}-ec2-qa-web"
  port = 8090
  protocol = "HTTP"
  deregistration_delay = 300
  load_balancing_algorithm_type = "round_robin"
  vpc_id = var.vpc_id
  target_type = "instance"
  health_check {
    port = "8090"
    protocol = "HTTP"
    path = var.internal_webservice_check
    interval = 30
    timeout = 5
    unhealthy_threshold = 2
    healthy_threshold = 3
  }
  stickiness {
    type = "lb_cookie"
    cookie_duration = "300"
    enabled = true
  }
  tags = {
    Name = "${var.environment}-${var.platform}-ec2-qa-web"
  }
  depends_on = [aws_alb.ec2-qa-lb]
  lifecycle {
    ignore_changes = [
      lambda_multi_value_headers_enabled
    ]
 }
}
resource "aws_alb_listener" "ec2-qa-http" {
  load_balancer_arn = aws_alb.ec2-qa-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.ec2-qa-web.arn
    type = "forward"
  }
}
resource "aws_alb_listener" "ec2-qa-web" {
  load_balancer_arn = aws_alb.ec2-qa-lb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = var.api_ssl_policy
  certificate_arn = var.ssl_cert_arn
  default_action {
    target_group_arn = aws_alb_target_group.ec2-qa-web.arn
    type = "forward"
  }
}
resource "aws_route53_record" "ec2-qa-lb" {
  name = "${var.environment}-${var.platform}-unified-qa"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = aws_alb.ec2-qa-lb.dns_name
    zone_id = aws_alb.ec2-qa-lb.zone_id
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "PRIMARY"
  }
  set_identifier = "ec2-qa-lb-primary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_record" "ec2-qa-lb-failover" {
  name = "${var.environment}-${var.platform}-unified-qa"
  zone_id = data.aws_route53_zone.modriacom.zone_id
  type = "A"
  alias {
    name = "maintenance.modria.com"
    zone_id = "Z2F7QUD2U4FKAE"
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "SECONDARY"
  }
  set_identifier = "ec2-qa-lb-secondary"
  lifecycle {
    create_before_destroy = false
  }
}
resource "aws_route53_health_check" "ec2-qa-lb" {
  fqdn = "${var.environment}-${var.platform}-unified-qa.modria.com"
  type = "HTTP"
  port = "80"
  # resource_path = "${var.platform != "qa" ? "/GG_Webservice/" : "/GG_Webservice/api/ValidateDeploy/"}"
  resource_path = var.internal_webservice_check
  failure_threshold = "3"
  request_interval = "30"
  tags = {
    Name = "${var.environment}-${var.platform}-unified-qa-dns-healthcheck"
    CostCenter = "${var.environment}-${var.platform}"
  }
}
resource "aws_cloudwatch_metric_alarm" "unified-qa-dns-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-unified-qa-dns-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthCheckStatus"
  namespace = "AWS/Route53"
  period = "60"
  statistic = "Minimum"
  threshold = "0.5"
  alarm_description = "ECS Web DNS Healthcheck"
  actions_enabled = true
  alarm_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  ok_actions = ["arn:aws:sns:us-east-1:134955911718:modria_aws_alerts"]
  dimensions = {
    HealthCheckId = aws_route53_health_check.ec2-qa-lb.id
  }
  treat_missing_data = "notBreaching"
  depends_on = [aws_route53_health_check.ec2-qa-lb]
}