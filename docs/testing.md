# Testing strategy

## Execution assumptions

The module supports OpenTofu `>= 1.12.0, < 2.0.0`; CI runs the version pinned
in `.opentofu-version` and Scaleway provider 2.83.x. It is a reusable module,
so it has no backend or state of its own. Checks run locally and in GitHub
Actions through `Taskfile.yml`.
The current test tier is for a public module contract, not a deployment
environment.

## Decision matrix

| Situation in this module | Tool | Current decision | Reason |
| --- | --- | --- | --- |
| Formatting, schema, and static OpenTofu checks | `task fmt:check`, `task validate`, TFLint | Use | Free checks catch syntax, schema, and style regressions. |
| Input-derived resource contract and validation | `tofu test` with `mock_provider` | Use | OpenTofu 1.12.6 supports native mock tests. The asserted cluster inputs and autoscaler block are known during `plan`; no credentials or cloud resources are needed. |
| Provider API behavior, computed values, or resource lifecycle | Controlled integration test | Do not run by default | These need a dedicated Scaleway project, unique names/tags, a reviewed `apply`, and reliable cleanup. |
| Multi-provider orchestration or Go-owned integration harness | Terratest | Do not use now | The previous test only wrapped `terraform plan`, added a Go dependency, and provided no coverage beyond a native mock test. |

Terratest becomes appropriate if the module gains complex integration behavior
that native mocked tests cannot cover. Add it as a separately named opt-in task
that applies only to an isolated test project, tags every resource, destroys in
test cleanup, and is gated away from pull requests.

## Commands

`task test:native` runs the mocked native tests. `task ci` runs the complete
zero-cloud-cost suite. Neither command applies or destroys infrastructure.

Before a real integration test or any production change, run a reviewed
`tofu plan -out=tfplan` in the target root. Keep the plan artifact and
apply that exact reviewed artifact only after approval.
