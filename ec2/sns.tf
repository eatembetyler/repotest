resource "aws_sns_topic" "slack_alerts" {
    name = "${var.environment}-${var.platform}-slack-alerts"
}
# resource "aws_sns_topic_subscription" "slack_alerts" {
#     topic_arn = "${aws_sns_topic.slack_alerts.arn}"
#     protocol = "email"
#     endpoint = "${lookup(var.slack_alerts, "${var.environment}-${var.platform}")}"
# }