resource "scaleway_k8s_cluster" "k8s_cluster" {
  name                        = var.cluster_name
  description                 = var.cluster_description
  version                     = var.cluster_version
  cni                         = var.cluster_cni
  tags                        = var.cluster_tags
  feature_gates               = var.cluster_feature_gates
  admission_plugins           = var.cluster_admission_plugins
  apiserver_cert_sans         = var.apiserver_cert_sans
  delete_additional_resources = var.delete_additional_resources

  auto_upgrade {
    enable                        = var.auto_upgrade
    maintenance_window_start_hour = var.maintenance_window_start_hour
    maintenance_window_day        = var.maintenance_window_day
  }

  dynamic "autoscaler_config" {
    for_each = var.enable_cluster_autoscaler ? [1] : []

    content {

      disable_scale_down              = var.as_disable_scaledown
      scale_down_delay_after_add      = var.as_scale_down_delay_after_add
      scale_down_unneeded_time        = var.as_scale_down_unneeded_time
      estimator                       = var.as_estimator
      expander                        = var.as_expander
      ignore_daemonsets_utilization   = var.as_ignore_daemonsets_utilization
      balance_similar_node_groups     = var.as_balance_similar_node_groups
      expendable_pods_priority_cutoff = var.as_expandable_pods_priority_cutoff
    }
  }
}
