variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster"

  validation {
    condition     = length(trimspace(var.cluster_name)) > 0
    error_message = "cluster_name must not be empty."
  }
}

variable "cluster_type" {
  type        = string
  description = "The Kapsule cluster type. Use kapsule for a mutualized Kapsule control plane."
  default     = "kapsule"
}

variable "cluster_description" {
  type        = string
  description = "A description for the Kubernetes cluster"
  default     = null
}

variable "cluster_version" {
  type        = string
  description = "The version of the Kubernetes cluster"

  validation {
    condition     = can(regex("^1\\.[0-9]+(?:\\.[0-9]+)?$", var.cluster_version))
    error_message = "cluster_version must be a Kubernetes version such as 1.37 or 1.37.1."
  }
}

variable "cluster_cni" {
  type        = string
  description = "Container Network Interface (CNI) to be installed"

  validation {
    condition     = contains(["calico", "cilium"], var.cluster_cni)
    error_message = "cluster_cni must be either calico or cilium for a Kapsule cluster."
  }
}

variable "private_network_id" {
  type        = string
  description = "ID of the Scaleway Private Network attached to the cluster. Kapsule requires one."

  validation {
    condition     = length(trimspace(var.private_network_id)) > 0
    error_message = "private_network_id must not be empty."
  }
}

variable "region" {
  type        = string
  description = "Scaleway region in which to create the cluster. If null, uses the provider default."
  default     = null
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
  description = "Additional Subject Alternative Names for the Kubernetes API server"
  default     = null
}

variable "delete_additional_resources" {
  type        = bool
  description = "Delete additional resources such as block volumes and load balancers created by Kubernetes when the cluster is deleted"
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

  validation {
    condition     = var.maintenance_window_start_hour >= 0 && var.maintenance_window_start_hour <= 23
    error_message = "maintenance_window_start_hour must be between 0 and 23."
  }
}

variable "maintenance_window_day" {
  type        = string
  description = "The day of the auto upgrade maintenance window (monday to sunday, or any)"
  default     = "any"

  validation {
    condition     = contains(["any", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"], var.maintenance_window_day)
    error_message = "maintenance_window_day must be any or a lowercase day of the week."
  }
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
