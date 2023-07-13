resource "aws_launch_template" "wordpress-lt" {
  name_prefix   = "webservers"
  image_id      = var.ami-wordpress
  instance_type = var.instance_type
}
resource "aws_autoscaling_group" "wordpress-asg" {
  availability_zones = ["us-east-2a"]
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  health_check_type = "ELB"
  load_balancers = [
    aws_lb.app-load-balancer.id
  ]

  launch_template {
    id      = aws_launch_template.wordpress-template.id
    version = "$Latest"
  }
# depends_on = [
#   aws_lb.app-load.balancer
# ]
}

resource "aws_launch_template" "wordpress-template" {
  name_prefix   = "example-launch-template"
  image_id      = var.ami-wordpress
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "example-instance"
    }
  }
}
resource "aws_autoscaling_policy" "wp-policy-up"{
  name = "wp-policy-up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.wordpress-asg.name
}
resource "aws_cloudwatch_metric_alarm" "cpu-alarm-up" {
  alarm_name = "cpu-alarm-up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "85"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.wordpress-asg.name
  }
  alarm_description = "EC2 CPU utilization"
  alarm_actions = [ aws_autoscaling_policy.wp-policy-up.arn]
}
resource "aws_cloudwatch_metric_alarm" "cpu-alarm-down" {
  alarm_name = "cpu-alarm-down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "40"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.wordpress-asg.name
  }
  alarm_description = "EC2 CPU utilization"
  alarm_actions = [ aws_autoscaling_policy.wp-policy-up.arn]
}
