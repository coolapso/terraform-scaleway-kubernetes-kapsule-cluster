variable "enable_autoscaler" {
  description = "enables/disables cluster autoscalling features"
}

variable "cluster_name" {
  description = "The name for the Kubernetes cluster"
}

variable "cluster_description" {
  description = "A description for the Kubernetes cluster"
  default     = null
}

variable "cluster_version" {
  description = "The version of the Kubernetes cluster"
}

variable "cluster_cni" {
  description = "Container Network Interface (CNI) to be installed"
}

variable "cluster_tags" {
  description = "List of tags to be applied to the cluster"
  type        = list(string)
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
  description = "Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion"
}

variable "auto_upgrade" {
  description = "Set to true to enable Kubernetes patch version auto upgrades"
  default     = false
}

variable "maintenance_window_start_hour" {
  description = "The start hour (UTC) of the 2-hour auto upgrade maintenance window (0 to 23)"
  default     = 0
}

variable "maintenance_window_day" {
  description = "The day of the auto upgrade maintenance window (monday to sunday, or any)"
  default     = "any"
}

variable "as_disable_scaledown" {
  description = "Disables auto-scaler scale down feature"
  default     = null
}

variable "as_scale_down_delay_after_add" {
  description = "How long before resuming scaledown evaluation"
  default     = null
}

variable "as_scale_down_unneeded_time" {
  description = "How long a node should be unneeded before it is eligible for scale down"
  default     = null
}

variable "as_estimator" {
  description = "Type of resource estimator to be used in scale up"
  default     = null
}


variable "as_expander" {
  description = "Type of node group expander to be used in scale up"
  default     = null
}

variable "as_ignore_daemonsets_utilization" {
  description = "Ignore DaemonSet pods when calculating resource utilization for scaling down"
  default     = null
}

variable "as_balance_similar_node_groups" {
  description = "Detect similar node groups and balance the number of nodes between them"
  default     = null
}

variable "as_expandable_pods_priority_cutoff" {
  description = "Pods with priority below cutoff will be expendable"
  default     = null
}
