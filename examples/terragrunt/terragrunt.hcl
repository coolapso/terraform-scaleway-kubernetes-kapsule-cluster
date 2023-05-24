locals {
  tags               = ["example", "test", "ci"]
  enable_autoscaling = true
}


/* Variables that are shared among all resources */
inputs = {
  cluster_tags                = local.tags
  pool_tags                   = local.tags
  pool_autoscaling            = local.enable_autoscaling
}
