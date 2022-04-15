data "aws_route53_zone" "modriacom" {
  name = "modria.com"
}
data "aws_route53_zone" "modrianet" {
  name = "modria.net"
  private_zone = false
}
data "aws_route53_zone" "modrianet_priv" {
  name = "modria.net"
  private_zone = true
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "platform" {
  type = string
}

# variable "availability_zones" {
#   type = list
# }

variable "vpc_dmz_security_group_ids" {
  type = string
}

variable "vpc_private_security_group_ids" {
  type = string
}

variable "dmz_subnet_id" {
  type = list
}

variable "iam_instance_profile" {
  type = string
}

variable "private_subnet_id" {
  type = list
}

variable "ssh_key" {
  type = string
}

variable "app_ami_id" {
  type = string
}
variable "worker_ami_id" {
  type = string
}


variable "app_server_type" {
  type = string
}
variable "app_server_count" {
  type = string
}

variable "worker_server_type" {
  type = string
}
variable "worker_server_count" {
  type = string
}

variable "sns_arn" {
  type = string
}
variable "slack_alerts_sns_arn" {
  type = map
  default = {
    "legacy-aaa-qa" = "arn:aws:sns:us-east-1:134955911718:legacy-aaa-qa-slack-alerts"
    "legacy-aaa-uat" = "arn:aws:sns:us-east-1:134955911718:legacy-aaa-uat-slack-alerts"
    "legacy-aaa-prod" = "arn:aws:sns:us-east-1:134955911718:legacy-aaa-prod-slack-alerts"
    "legacy-aaa-perf" = "arn:aws:sns:us-east-1:134955911718:legacy-aaa-perf-slack-alerts"
  }
}
variable "slack_alerts_500x_sns_alerts_arn" {
  type = string
  default = "arn:aws:sns:us-east-1:134955911718:legacy-aaa-prod-500x-slack-alerts"
}

variable "ssl_cert_arn" {
  type = string
}

variable "api_ssl_policy" {
  type = string
  default = "ELBSecurityPolicy-TLS-1-2-2017-01"
}
variable "webapp_ssl_policy" {
  type = string
  default = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
}


variable "vpc_id" {
  type = string
}

variable "cloudwatch_role_arn" {
  type = string
}

variable "efs_filesystem_id" {
  type = string
}

variable "smtp_relay_server_id" {
  type = string
}

variable "internal_webservice_check" {
  type = string
}
