output "cluster_id" {
  description = "The ID of the cluster."
  value       = scaleway_k8s_cluster.k8s_cluster.id
}

output "cluster_name" {
  description = "The name of the cluster."
  value       = scaleway_k8s_cluster.k8s_cluster.name
}

output "cluster_apiserver_url" {
  description = "The URL of the Kubernetes API server."
  value       = scaleway_k8s_cluster.k8s_cluster.apiserver_url
}

output "cluster_wildcard_dns" {
  description = "The DNS wildcard that points to all ready nodes."
  value       = scaleway_k8s_cluster.k8s_cluster.wildcard_dns
}

output "cluster_kubeconfig" {
  description = "The Kubernetes configuration."
  value       = scaleway_k8s_cluster.k8s_cluster.kubeconfig
  sensitive   = true
}

output "cluster_upgrade_available" {
  description = "Set to `true` if a newer Kubernetes version is available."
  value       = scaleway_k8s_cluster.k8s_cluster.upgrade_available
}
