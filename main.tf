resource "aws_elasticache_replication_group" "primary" {
  replication_group_id       = "${lower(var.tag_budget)}-${lower(var.tag_environment)}"
  node_type                  = "${var.node_type}"
  number_cache_clusters      = "${var.cache_cluster_count}"
  engine                     = "redis"
  engine_version             = "${var.version}"
  port                       = "${var.port}"
  security_group_names       = ["${aws_security_group.redis.id}"]
  parameter_group_name       = "${var.parameter_group}"
  automatic_failover_enabled = true
  maintenance_window         = "${var.maintenance_window}"

  tags {
    Budget      = "${var.tag_budget}"
    Environment = "${var.tag_environment}"
  }
}

resource "aws_security_group" "redis" {
  description = "Allow inbound Redis connections from a given security group"

  ingress {
    security_groups = [
      "${split(",", var.security_group_list)}",
    ]
  }
}
