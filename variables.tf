variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster"
}

variable "cluster_description" {
  type        = string
  description = "A description for the Kubernetes cluster"
  default     = null
}

variable "cluster_version" {
  type        = string
  description = "The version of the Kubernetes cluster"
}

variable "cluster_cni" {
  type        = string
  description = "Container Network Interface (CNI) to be installed"
}

variable "cluster_tags" {
  type        = list(string)
  description = "List of tags to be applied to the cluster"
  default     = null
}

variable "cluster_feature_gates" {
  type        = list(string)
  description = "The list of feature gates to enable on the cluster"
  default     = null
}

variable "cluster_admission_plugins" {
  type        = list(string)
  description = "The list of admission plugins to enable on the cluster"
  default     = null
}

variable "apiserver_cert_sans" {
  type        = list(string)
  description = "K8s API server addittional Subject Alternative Names"
  default     = null
}

variable "delete_additional_resources" {
  type        = bool
  description = "Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion"
}

variable "auto_upgrade" {
  type        = bool
  description = "Set to true to enable Kubernetes patch version auto upgrades"
  default     = false
}

variable "maintenance_window_start_hour" {
  type        = number
  description = "The start hour (UTC) of the 2-hour auto upgrade maintenance window (0 to 23)"
  default     = 0
}

variable "maintenance_window_day" {
  type        = string
  description = "The day of the auto upgrade maintenance window (monday to sunday, or any)"
  default     = "any"
}

variable "as_disable_scaledown" {
  type        = bool
  description = "Disables auto-scaler scale down feature"
  default     = null
}

variable "as_scale_down_delay_after_add" {
  type        = string
  description = "How long before resuming scaledown evaluation"
  default     = null
}

variable "as_scale_down_unneeded_time" {
  type        = string
  description = "How long a node should be unneeded before it is eligible for scale down"
  default     = null
}

variable "as_estimator" {
  type        = string
  description = "Type of resource estimator to be used in scale up"
  default     = null
}


variable "as_expander" {
  type        = string
  description = "Type of node group expander to be used in scale up"
  default     = null
}

variable "as_ignore_daemonsets_utilization" {
  type        = bool
  description = "Ignore DaemonSet pods when calculating resource utilization for scaling down"
  default     = null
}

variable "as_balance_similar_node_groups" {
  type        = bool
  description = "Detect similar node groups and balance the number of nodes between them"
  default     = null
}

variable "as_expandable_pods_priority_cutoff" {
  type        = string
  description = "Pods with priority below cutoff will be expendable"
  default     = null
}

variable "enable_cluster_autoscaler" {
  type        = bool
  description = "Enable cluster autoscaler"
  default     = false
}
