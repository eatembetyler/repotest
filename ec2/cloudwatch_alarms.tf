resource "aws_cloudwatch_metric_alarm" "app_server_cpu_high" {
  count = var.app_server_count
  alarm_name = "${var.environment}-${var.platform}-app0${count.index}-cpu_utilization_threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "3"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "90"
  alarm_description = "CPU Utilization above 80%"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.app_server.*.id[count.index]
  }
}
resource "aws_cloudwatch_metric_alarm" "worker_server_cpu_high" {
  count = var.worker_server_count
  alarm_name = "${var.environment}-${var.platform}-worker0${count.index}-cpu_utilization_threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "3"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "90"
  alarm_description = "CPU Utilization above 80%"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.worker_server.*.id[count.index]
  }
}


resource "aws_cloudwatch_metric_alarm" "app_server_status_check" {
  count = var.app_server_count
  alarm_name = "${var.environment}-${var.platform}-app0${count.index}-status_check"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "3"
  metric_name = "StatusCheckFailed_Instance"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "1"
  alarm_description = "Failed Status Check"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.app_server.*.id[count.index]
  }
}
resource "aws_cloudwatch_metric_alarm" "worker_server_status_check" {
  count = var.worker_server_count
  alarm_name = "${var.environment}-${var.platform}-worker0${count.index}-status_check"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "3"
  metric_name = "StatusCheckFailed_Instance"
  namespace = "AWS/EC2"
  period = "600"
  statistic = "Average"
  threshold = "1"
  alarm_description = "Failed Status Check"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.worker_server.*.id[count.index]
  }
}


resource "aws_cloudwatch_metric_alarm" "ec2-play-lb-target-response-time" {
  alarm_name = "${var.environment}-${var.platform}-play-lb-targetResponseTime"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "5"
  metric_name = "TargetResponseTime"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = "3"
  alarm_description = "ALB Target Response Time"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-play-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-ext-lb-target-response-time" {
  alarm_name = "${var.environment}-${var.platform}-ec2-ext-lb-targetResponseTime"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "5"
  metric_name = "TargetResponseTime"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = "3"
  alarm_description = "ALB Target Response Time"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-ext-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-qa-lb-target-response-time" {
  alarm_name = "${var.environment}-${var.platform}-ec2-qa-lb-targetResponseTime"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "5"
  metric_name = "TargetResponseTime"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = "3"
  alarm_description = "ALB Target Response Time"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-qa-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}


resource "aws_cloudwatch_metric_alarm" "ec2-play-lb-target-5XX-count" {
  alarm_name = "${var.environment}-${var.platform}-ec2-play-lb-target5XXCount"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "HTTPCode_Target_5XX_Count"
  namespace = "AWS/ApplicationELB"
  period = "300"
  statistic = "Sum"
  threshold = "30"
  alarm_description = "ALB Target 5XX Count"
  actions_enabled = true
  alarm_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  ok_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  dimensions = {
    LoadBalancer = aws_alb.ec2-play-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-ext-lb-target-5XX-count" {
  alarm_name = "${var.environment}-${var.platform}-ec2-ext-lb-target5XXCount"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "HTTPCode_Target_5XX_Count"
  namespace = "AWS/ApplicationELB"
  period = "300"
  statistic = "Sum"
  threshold = "30"
  alarm_description = "ALB Target 5XX Count"
  actions_enabled = true
  alarm_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  ok_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  dimensions = {
    LoadBalancer = aws_alb.ec2-ext-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-qa-lb-target-5XX-count" {
  alarm_name = "${var.environment}-${var.platform}-ec2-qa-lb-target5XXCount"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "HTTPCode_Target_5XX_Count"
  namespace = "AWS/ApplicationELB"
  period = "300"
  statistic = "Sum"
  threshold = "30"
  alarm_description = "ALB Target 5XX Count"
  actions_enabled = true
  alarm_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  ok_actions = [
    var.sns_arn,
    var.slack_alerts_500x_sns_alerts_arn
    ]
  dimensions = {
    LoadBalancer = aws_alb.ec2-qa-lb.arn_suffix
  }
  treat_missing_data = "notBreaching"
}


resource "aws_cloudwatch_metric_alarm" "ec2-play-https-target-group-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-ec2-play-https-alb-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthyHostCount"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = var.app_server_count
  alarm_description = "ALB Target Group Healthcheck"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-play-lb.arn_suffix
    TargetGroup = aws_alb_target_group.ec2-play-web.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-ext-https-target-group-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-ec2-ext-https-alb-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthyHostCount"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = var.app_server_count
  alarm_description = "ALB Target Group Healthcheck"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-ext-lb.arn_suffix
    TargetGroup = aws_alb_target_group.ec2-ext-web.arn_suffix
  }
  treat_missing_data = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "ec2-qa-https-target-group-healthcheck" {
  alarm_name = "${var.environment}-${var.platform}-ec2-qa-https-alb-healthcheck"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "HealthyHostCount"
  namespace = "AWS/ApplicationELB"
  period = "60"
  statistic = "Average"
  threshold = var.app_server_count
  alarm_description = "ALB Target Group Healthcheck"
  actions_enabled = true
  alarm_actions = [var.sns_arn]
  ok_actions = [var.sns_arn]
  dimensions = {
    LoadBalancer = aws_alb.ec2-qa-lb.arn_suffix
    TargetGroup = aws_alb_target_group.ec2-qa-web.arn_suffix
  }
  treat_missing_data = "notBreaching"
}


resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
    alarm_name = "${var.environment}-${var.platform}-data-db00-cpu_utilization_threshold"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "5"
    metric_name = "CPUUtilization"
    namespace = "AWS/RDS"
    period = "360"
    statistic = "Average"
    threshold = "80"
    alarm_description = "CPU Utilization above 80%"
    actions_enabled = true
    alarm_actions = [var.sns_arn]
    ok_actions = [var.sns_arn]
    dimensions = {
      DBInstanceIdentifier = "${var.environment}-${var.platform}-data-db00"
    }
    treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_count" {
    alarm_name = "${var.environment}-${var.platform}-data-db00-connection_threshold"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "DatabaseConnections"
    namespace = "AWS/RDS"
    period = "300"
    statistic = "Average"
    threshold = "800"
    alarm_description = "RDS Connection Count Nearing Limitations"
    actions_enabled = true
    alarm_actions = [var.sns_arn]
    ok_actions = [var.sns_arn]
    dimensions = {
      DBInstanceIdentifier = "${var.environment}-${var.platform}-data-db00"
    }
    treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "rds_disk_available_data_db" {
    alarm_name = "${var.environment}-${var.platform}-data-db00-available-disk"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "FreeStorageSpace"
    namespace = "AWS/RDS"
    period = "300"
    statistic = "Average"
    threshold = "53687091200"
    alarm_description = "RDS Available Disk"
    actions_enabled = true
    alarm_actions = [var.sns_arn]
    ok_actions = [var.sns_arn]
    dimensions = {
      DBInstanceIdentifier = "${var.environment}-${var.platform}-data-db00"
    }
    treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_metric_alarm" "rds_disk_available_dwh_db" {
    alarm_name = "${var.environment}-${var.platform}-dwh-db-available-disk"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "FreeStorageSpace"
    namespace = "AWS/RDS"
    period = "300"
    statistic = "Average"
    threshold = "53687091200"
    alarm_description = "RDS Available Disk"
    actions_enabled = true
    alarm_actions = [var.sns_arn]
    ok_actions = [var.sns_arn]
    dimensions = {
      DBInstanceIdentifier = "${var.environment}-${var.platform}-dwh-db"
    }
    treat_missing_data = "notBreaching"
}