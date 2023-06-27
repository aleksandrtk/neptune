resource "aws_neptune_parameter_group" "example" {
  family = "neptune1.2"
  name   = "parameter-group-test"

}


resource "aws_neptune_cluster_parameter_group" "example" {
  family      = "neptune1.2"
  name        = "cluster-parameter-group-test"
  description = "neptune cluster parameter group"

}

resource "aws_neptune_cluster_instance" "example" {
  count                        = 1
  cluster_identifier           = aws_neptune_cluster.default.id
  engine                       = "neptune"
  instance_class               = "db.t3.medium"
  apply_immediately            = true
  neptune_parameter_group_name = "parameter-group-test"
}


resource "aws_neptune_cluster" "default" {
  cluster_identifier                   = "neptune-cluster-demo"
  engine                               = "neptune"
  backup_retention_period              = 5
  preferred_backup_window              = "07:00-09:00"
  skip_final_snapshot                  = true
  iam_database_authentication_enabled  = true
  apply_immediately                    = true
  neptune_cluster_parameter_group_name = "cluster-parameter-group-test"
}
