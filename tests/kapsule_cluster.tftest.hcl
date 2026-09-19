mock_provider "scaleway" {}

run "plans_a_kapsule_cluster_with_autoscaling" {
  command = plan

  variables {
    cluster_name                = "native-test-kapsule"
    cluster_version             = "1.37"
    cluster_cni                 = "cilium"
    private_network_id          = "11111111-1111-1111-1111-111111111111"
    delete_additional_resources = false
    auto_upgrade                = true
    enable_cluster_autoscaler   = true
    as_expander                 = "least_waste"
  }

  assert {
    condition     = scaleway_k8s_cluster.k8s_cluster.name == "native-test-kapsule"
    error_message = "The cluster name must be passed to the Kapsule resource."
  }

  assert {
    condition     = scaleway_k8s_cluster.k8s_cluster.private_network_id == "11111111-1111-1111-1111-111111111111"
    error_message = "The cluster must be attached to the supplied Private Network."
  }

  assert {
    condition     = scaleway_k8s_cluster.k8s_cluster.type == "kapsule"
    error_message = "The default cluster type must remain kapsule."
  }

  assert {
    condition     = scaleway_k8s_cluster.k8s_cluster.autoscaler_config[0].expander == "least_waste"
    error_message = "The autoscaler expander must be passed through to the provider."
  }
}

run "rejects_an_unsupported_kapsule_cni" {
  command = plan

  variables {
    cluster_name                = "native-test-kapsule"
    cluster_version             = "1.37"
    cluster_cni                 = "flannel"
    private_network_id          = "11111111-1111-1111-1111-111111111111"
    delete_additional_resources = false
    auto_upgrade                = true
  }

  expect_failures = [var.cluster_cni]
}
