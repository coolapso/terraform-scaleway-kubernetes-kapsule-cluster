![master](https://github.com/github/docs/actions/workflows/main.yml/badge.svg?branch=master)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

# Terraform Scaleway kubernetes kapsule 

A Terraform module that creates a simple Kubernetes kapsule cluster,
Nodes are added using [Kapsule-pool](https://github.com/4s3ti/terraform-scaleway-kubernetes-kapsule-pool) module.

## How to use

[Examples](./examples) directory contains examples on how to use this module and add nodes to it.  

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~>2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~>2.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_k8s_cluster.k8s_cluster](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apiserver_cert_sans"></a> [apiserver\_cert\_sans](#input\_apiserver\_cert\_sans) | K8s API server addittional Subject Alternative Names | `list(string)` | `null` | no |
| <a name="input_as_balance_similar_node_groups"></a> [as\_balance\_similar\_node\_groups](#input\_as\_balance\_similar\_node\_groups) | Detect similar node groups and balance the number of nodes between them | `bool` | `null` | no |
| <a name="input_as_disable_scaledown"></a> [as\_disable\_scaledown](#input\_as\_disable\_scaledown) | Disables auto-scaler scale down feature | `bool` | `null` | no |
| <a name="input_as_estimator"></a> [as\_estimator](#input\_as\_estimator) | Type of resource estimator to be used in scale up | `string` | `null` | no |
| <a name="input_as_expandable_pods_priority_cutoff"></a> [as\_expandable\_pods\_priority\_cutoff](#input\_as\_expandable\_pods\_priority\_cutoff) | Pods with priority below cutoff will be expendable | `string` | `null` | no |
| <a name="input_as_expander"></a> [as\_expander](#input\_as\_expander) | Type of node group expander to be used in scale up | `string` | `null` | no |
| <a name="input_as_ignore_daemonsets_utilization"></a> [as\_ignore\_daemonsets\_utilization](#input\_as\_ignore\_daemonsets\_utilization) | Ignore DaemonSet pods when calculating resource utilization for scaling down | `bool` | `null` | no |
| <a name="input_as_scale_down_delay_after_add"></a> [as\_scale\_down\_delay\_after\_add](#input\_as\_scale\_down\_delay\_after\_add) | How long before resuming scaledown evaluation | `string` | `null` | no |
| <a name="input_as_scale_down_unneeded_time"></a> [as\_scale\_down\_unneeded\_time](#input\_as\_scale\_down\_unneeded\_time) | How long a node should be unneeded before it is eligible for scale down | `string` | `null` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Set to true to enable Kubernetes patch version auto upgrades | `bool` | `false` | no |
| <a name="input_cluster_admission_plugins"></a> [cluster\_admission\_plugins](#input\_cluster\_admission\_plugins) | The list of admission plugins to enable on the cluster | `list(string)` | `null` | no |
| <a name="input_cluster_cni"></a> [cluster\_cni](#input\_cluster\_cni) | Container Network Interface (CNI) to be installed | `string` | n/a | yes |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | A description for the Kubernetes cluster | `string` | `null` | no |
| <a name="input_cluster_feature_gates"></a> [cluster\_feature\_gates](#input\_cluster\_feature\_gates) | The list of feature gates to enable on the cluster | `list(string)` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name for the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | List of tags to be applied to the cluster | `list(string)` | `null` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion | `bool` | n/a | yes |
| <a name="input_enable_cluster_autoscaler"></a> [enable\_cluster\_autoscaler](#input\_enable\_cluster\_autoscaler) | Enable cluster autoscaler | `bool` | `false` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of the auto upgrade maintenance window (monday to sunday, or any) | `string` | `"any"` | no |
| <a name="input_maintenance_window_start_hour"></a> [maintenance\_window\_start\_hour](#input\_maintenance\_window\_start\_hour) | The start hour (UTC) of the 2-hour auto upgrade maintenance window (0 to 23) | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_apiserver_url"></a> [cluster\_apiserver\_url](#output\_cluster\_apiserver\_url) | The URL of the Kubernetes API server. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the cluster. |
| <a name="output_cluster_kubeconfig"></a> [cluster\_kubeconfig](#output\_cluster\_kubeconfig) | The Kubernetes configuration. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the cluster. |
| <a name="output_cluster_upgrade_available"></a> [cluster\_upgrade\_available](#output\_cluster\_upgrade\_available) | Set to `true` if a newer Kubernetes version is available. |
| <a name="output_cluster_wildcard_dns"></a> [cluster\_wildcard\_dns](#output\_cluster\_wildcard\_dns) | The DNS wildcard that points to all ready nodes. |
<!-- END_TF_DOCS -->

# Contributions

Improvements and suggestions are always welcome, feel free to open an Issue or Pull Request

If you like this theme and want to support / contribute in a different way you can always: 

<a href="https://www.buymeacoffee.com/4s3ti" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-yellow.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" >
