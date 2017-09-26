# `terraform-redis`

Terraform module used to create AWS ElastiCache Redis clusters

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cache_cluster_count |  | string | `1` | no |
| maintenance_window |  | string | `mon:01:00-mon:07:00` | no |
| node_type |  | string | `cache.m4.large` | no |
| parameter_group |  | string | `default.redis3.2.cluster.on` | no |
| port |  | string | `6379` | no |
| tag_budget |  | string | - | yes |
| tag_environment |  | string | - | yes |
| version |  | string | `3.2.4` | no |

## Outputs

| Name | Description |
|------|-------------|
| address | DNS name of the cluster, without the port appended |
| port | Redis port number |
