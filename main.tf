resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${lower(var.project)}-${lower(var.environment)}"
  replication_group_description = "Redis cache cluster"
  number_cache_clusters         = "${var.num_cache_nodes}"
  node_type                     = "${var.node_type}"
  engine                        = "redis"
  engine_version                = "${var.engine_version}"
  port                          = "${var.port}"
  parameter_group_name          = "${var.parameter_group_name}"
  security_group_ids            = ["${aws_security_group.sg_redis.id}"]
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

resource "aws_security_group" "sg_redis" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.project}-${var.environment}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

resource "aws_security_group_rule" "sg_app_to_redis" {
  count                    = "${length(var.allowed_sgs)}"
  type                     = "ingress"
  security_group_id        = "${aws_security_group.sg_redis.id}"
  from_port                = "${var.port}"
  to_port                  = "${var.port}"
  protocol                 = "tcp"
  source_security_group_id = "${var.allowed_sgs[count.index]}"
}
