# Tag Release

Prepares and publishes GitHub Releases through an existing tag-triggered
workflow. Use when a user requests a tagged release or a new version.

- Entry point: [SKILL.md](SKILL.md).
- Dependencies: Git, authenticated GitHub CLI with repository access, and an
  existing GitHub Actions release workflow triggered by tags.
- Inputs: target version, repository and release commit, publishing
  authorization, and evidence of supported platforms and architectures.
- Outputs: Chinese release notes, an explicit asset allowlist, an annotated tag,
  and a Release checked against its expected assets and checksums.
- Boundaries: publish only supported platform and architecture combinations;
  use existing automation. Pushing requires explicit release authorization.
  Deleting releases or assets and replacing or moving tags require explicit
  authorization. Credentials remain outside this repository.

Imported unchanged from `local:codex-skills/tag-release` on 2026-10-16.
No upstream repository is recorded. Importing this skill does not publish a
release.
