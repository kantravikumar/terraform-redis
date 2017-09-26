variable "version" {
  default = "3.2.4"
}

variable "port" {
  default = 6379
}

variable "parameter_group" {
  default = "default.redis3.2.cluster.on"
}

variable "node_type" {
  default = "cache.m4.large"
}

variable "cache_cluster_count" {
  default = 1
}

variable "maintenance_window" {
  default = "mon:01:00-mon:07:00"
}

variable "tag_budget" {}

variable "tag_environment" {}
