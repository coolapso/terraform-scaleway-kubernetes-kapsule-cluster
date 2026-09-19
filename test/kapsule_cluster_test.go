package test

import (
	"context"
	"os"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestKapsuleClusterPlan(t *testing.T) {
	terraformBinary := os.Getenv("TERRAFORM_BINARY")
	if terraformBinary == "" {
		terraformBinary = "terraform"
	}

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir:    "..",
		TerraformBinary: terraformBinary,
		NoColor:         true,
		Vars: map[string]any{
			"cluster_name":                "terratest-kapsule",
			"cluster_version":             "1.37",
			"cluster_cni":                 "cilium",
			"private_network_id":          "11111111-1111-1111-1111-111111111111",
			"delete_additional_resources": false,
			"auto_upgrade":                true,
			"enable_cluster_autoscaler":   true,
			"as_expander":                 "least_waste",
		},
		EnvVars: map[string]string{
			"SCW_ACCESS_KEY":         "SCW00000000000000000",
			"SCW_SECRET_KEY":         "11111111-1111-1111-1111-111111111111",
			"SCW_DEFAULT_PROJECT_ID": "11111111-1111-1111-1111-111111111111",
		},
	})

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Minute)
	defer cancel()

	plan := terraform.InitAndPlanAndShowWithStructNoLogTempPlanFileContext(t, ctx, terraformOptions)

	cluster, ok := plan.ResourcePlannedValuesMap["scaleway_k8s_cluster.k8s_cluster"]
	if !ok {
		t.Fatal("plan does not contain the Kapsule cluster resource")
	}

	assertAttribute(t, cluster.AttributeValues, "name", "terratest-kapsule")
	assertAttribute(t, cluster.AttributeValues, "version", "1.37")
	assertAttribute(t, cluster.AttributeValues, "cni", "cilium")
	assertAttribute(t, cluster.AttributeValues, "type", "kapsule")
	assertAttribute(t, cluster.AttributeValues, "private_network_id", "11111111-1111-1111-1111-111111111111")

	autoscalerConfig, ok := cluster.AttributeValues["autoscaler_config"].([]any)
	if !ok || len(autoscalerConfig) != 1 {
		t.Fatalf("expected one autoscaler_config block, got %#v", cluster.AttributeValues["autoscaler_config"])
	}

	autoscaler, ok := autoscalerConfig[0].(map[string]any)
	if !ok {
		t.Fatalf("expected autoscaler_config to be an object, got %#v", autoscalerConfig[0])
	}
	assertAttribute(t, autoscaler, "expander", "least_waste")
}

func assertAttribute(t *testing.T, attributes map[string]any, name string, want any) {
	t.Helper()
	if got := attributes[name]; got != want {
		t.Fatalf("%s = %#v, want %#v", name, got, want)
	}
}
