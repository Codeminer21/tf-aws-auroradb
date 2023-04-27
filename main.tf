data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_rds_cluster" "cluster" {
  cluster_identifier = "${var.db_name}-cluster"
  engine            = "${var.engine}"
  availability_zones = ["${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}"]
  database_name     = "${var.db_name}"
  master_username   = "${var.db_username}"
  master_password   = "${var.db_password}"

	skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "instance" {
  count              = var.instance_count
  identifier         = "${var.db_name}-instance-${count.index}"
  cluster_identifier = "${aws_rds_cluster.cluster.id}"
  instance_class     = var.instance_class
  engine             = "${var.engine}"
}