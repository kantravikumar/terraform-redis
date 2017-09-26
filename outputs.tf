output "address" {
  description = "DNS name of the cluster, without the port appended"
  value       = "${aws_elasticache_cluster.main.cluster_address}"
}

output "port" {
  description = "Redis port number"
  value       = "${var.port}"
}
