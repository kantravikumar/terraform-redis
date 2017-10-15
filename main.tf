resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${lower(var.budget)}-${substr(var.environment, 0, 3)}"
  replication_group_description = "Redis cache cluster"
  number_cache_clusters         = "${var.num_cache_nodes}"
  node_type                     = "${var.node_type}"
  engine                        = "redis"
  engine_version                = "${var.engine_version}"
  port                          = "${var.port}"
  parameter_group_name          = "${var.parameter_group_name}"
  security_group_ids            = ["${aws_security_group.main.id}"]
  subnet_group_name             = "${aws_elasticache_subnet_group.elasticache.id}"
  availability_zones            = ["${var.availability_zones}"]
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"

  tags {
    Name        = "${var.project}-${var.environment}"
    Environment = "${var.environment}"
    Budget      = "${var.budget}"
  }
}

resource "aws_elasticache_subnet_group" "elasticache" {
  name       = "${var.project}-${var.environment}-redis"
  subnet_ids = ["${var.subnets}"]
}

resource "aws_security_group" "main" {
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 6379
    to_port   = 6379
    self      = true
  }

  tags {
    Name        = "${var.project}-${var.environment}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    VPC         = "${var.vpc_id}"
  }
}
