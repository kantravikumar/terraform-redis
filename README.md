# `terraform-redis`

Terraform module used to create AWS ElastiCache Redis clusters

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allowed_sgs |  | list | - | yes |
| automatic_failover_enabled |  | string | `false` | no |
| availability_zones |  | list | - | yes |
| budget |  | string | - | yes |
| engine_version |  | string | `3.2.4` | no |
| environment |  | string | - | yes |
| node_type |  | string | - | yes |
| num_cache_nodes |  | string | - | yes |
| parameter_group_name |  | string | `default.redis3.2` | no |
| port |  | string | `6379` | no |
| project |  | string | - | yes |
| subnets |  | list | - | yes |
| vpc_id |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| redis_endpoint |  |
| redis_port |  |
| redis_sg |  |
