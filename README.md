[![Build Status](https://travis-ci.com/4s3ti/kapsule-cluster.svg?branch=master)](https://travis-ci.com/4s3ti/kapsule-cluster)
# Terraform Scaleway Kapsule

A Terraform module that creates a simple Kubernetes kapsule cluster,
Nodes are added using [Kapsule-pool](https://github.com/4s3ti/kapsule-pool) module.

## Module Requirements

* terraform > 0.13
* Scaleway account


## How to use

Examples directory contains examples on how to use this module and add nodes to it.  

## File and directory structure

|     Directory / file      |         Content                             |
----------------------------|---------------------------------------------|
| examples/terraform        | Contains Terraform example usage            |
| examples/terragrunt       | Contains Terragrunt example usage           |
| README.md                 | This file!                                  |
| main.tf                   | Main terraform with deployment code         |
| variables.tf              | Terraform variables file                    |
| versions.tf               | Required providers and versions             |


## Inputs

| Input name                         |          | Default value | Accepted Values | Description                                                         |
|------------------------------------|----------|---------------|-----------------|---------------------------------------------------------------------|
| cluster_name                       | Required |               | string          | The name for the kubernetes cluster                                 |
| cluster_description                | Optional |               | string          | Regions where K8s cluster is running                                |
| cluster_version                    | Required |               | 1.xx            | The version of the Kubernetes cluster                               |
| cluster_cni                        | Required |               | Read Docs*      | Container Network Interface (CNI) to be installed                   |
| cluster_tags                       | Optional |               | List of strings | List of tags to be applied to the cluster                           |
| cluster_feature_gates              | Optional |               | Read Docs*      | List of cluster gates to be enabled on the cluster                  |
| cluster_admission_plugins          | Optional |               | Read Docs*      | The list of admission plugins to enable on the cluster              |
| apiserver_cert_sans                | Optional |               | Read Docs*      | K8s API server Additional Subject Alternative Names                 |
| delete_additional_resources        | Required |               | true/false      | Delete additional resources when cluster deleted*                   |
| auto_upgrade                       | Optional | false         | true/false      | Set to true to enable kubernetes patch version auto upgrades        |
| maintenance_window_start_hour      | Optional | 0             | 0 - 23*         | The start hour (UTC) for the 2-hour auto upgrade window             |
| maintenance_window_day             | Optional | any           | Read Docs*      | The day for the auto upgrade maintenance window                     |
| enable_autoscaler                  | Required |               | true/false      | enables/disables cluster autoscalling features                      |
| as_disable_scaledown               | Optional |               | true/false      | Disables auto-scaler scale down feature                             |
| as_scale_down_delay_after_add      | Optional |               | Read Docs*      | How long before resuming scaledown evaluation                       |
| as_scale_down_unneeded_time        | Optional |               | Read Docs*      | How long To consider a node unneeded                                |
| as_estimator                       | Optional |               | Read Docs*      | Type of resource estimator to be used in scale up                   |
| as_expander                        | Optional |               | Read Docs*      | Type of node group expander to be used in scale up                  |
| as_ignore_daemonsets_utilization   | Optional |               | true/false      | Ignore daemonSet pods when calculating resource utilization         |
| as_expendable_pods_priority_cutoff | Optional |               | Read Docs*      | Pods with priority below cutoff will be expendable                  |


## External Documentation

*Please Refer to this documentation to find more about what values are accepted in this module arguments, as they can change due to provider updates.

https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool
