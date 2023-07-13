resource "aws_db_instance" "default" {
  allocated_storage           = 10
  db_name                     = "noticias-nuvem"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t3.xlarge"
  username                    = var.username
  parameter_group_name        = "default.mysql5.7"
}