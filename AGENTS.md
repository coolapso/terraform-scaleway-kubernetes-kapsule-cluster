# Working on this module

This repository contains a Terraform module for a Scaleway Kapsule control
plane. Keep changes focused and use the Taskfile as the entry point for local
and CI work.

## Commands

Run `task --list` before choosing a task. The normal verification command is
`task ci`; it runs formatting, Terraform validation, TFLint, terraform-docs,
and Terratest. Use `task docs` after changing inputs, outputs, provider
constraints, or resource declarations. It regenerates the marked section of
`README.md`; do not hand-edit that section.

`task test:native` runs native Terraform tests with a mocked Scaleway provider
and `command = plan`. It must never gain an apply, destroy, real key, state
file, or production fixture. Tests should assert a user-visible resource
contract from the plan. Mock providers require Terraform 1.7 or later; CI uses
Terraform 1.16.3. See [docs/testing.md](docs/testing.md) before adding
Terratest or a real-cloud integration test.

Use `task release:check` to run all checks and preview the next release. Use
`task release` only from a clean `master` checkout with a
`SEMREL_PLUGIN_TOKEN` GitHub credential; it can write `CHANGELOG.md`, create
and push a Git tag, and create a GitHub
release. semrel derives versions from Conventional Commit messages.

## Terraform conventions

- Keep the root module compatible with Terraform `>= 1.6.0, < 2.0.0` and the
  Scaleway provider `~> 2.83` unless a deliberate compatibility change is
  documented.
- Kapsule clusters require `private_network_id`. Treat a change to that input
  or another resource lifecycle behavior as a breaking change and add an
  upgrade note.
- Keep input descriptions clear, add validation when it prevents a known
  provider failure, and mark secret-derived outputs `sensitive`.
- Examples are independently linted Terraform roots. Give each example its
  own Terraform and provider constraints, and keep them valid with the current
  provider schema.
- Do not commit `.terraform/`, `.terraform.lock.hcl`, state, plans, provider
  credentials, or semrel plugin binaries.

## Change discipline

Use Conventional Commit messages. Run the smallest relevant Task targets while
editing, then `task ci` before handing off. Make a focused commit for each
independent milestone. If an interruption leaves work incomplete, update
`TODO.md` with the actual remaining verification or implementation work.
