# Local Capability Candidates

Generated from local Codex, agent, plugin, and MCP locations on 2026-05-28.
This file is a decision list. It does not mean the capabilities have been
imported into this repository.

## Import Recommendation

Start with one small batch. My recommended first batch is:

- Core review pack: `agency-code-review`, `agency-codebase-onboarding`,
  `agency-minimal-change-engineer`, `agency-reality-checker`,
  `agency-software-architect-review`.
- Coding support pack: `investigate`, `review`, `qa`, `qa-only`, `ship`,
  `gh-address-comments`, `gh-fix-ci`.
- MCP notes only: `codegraph`, `node_repl`.

Defer large platform packs such as `gstack`, `hyperframes`, and primary runtime
plugins until you decide whether this repository should store full copies,
thin notes, or only registry pointers.

## Decision Legend

- `[ ] import`: copy and normalize into this repository.
- `[ ] reference`: keep only registry metadata and source path.
- `[ ] skip`: do not track.

## Codex Skills

- [x] `agency-codebase-onboarding`
- [x] `agency-code-review`
- [x] `agency-minimal-change-engineer`
- [x] `agency-reality-checker`
- [x] `agency-software-architect-review`
- [ ] `autoplan`
- [ ] `benchmark`
- [ ] `benchmark-models`
- [ ] `browse`
- [ ] `canary`
- [ ] `careful`
- [ ] `claude`
- [ ] `context-restore`
- [ ] `context-save`
- [ ] `cso`
- [ ] `design-consultation`
- [ ] `design-html`
- [ ] `design-review`
- [ ] `design-shotgun`
- [ ] `design-taste-frontend`
- [ ] `devex-review`
- [ ] `document-generate`
- [ ] `document-release`
- [ ] `freeze`
- [x] `frontend-design`
- [ ] `gh-address-comments`
- [ ] `gh-fix-ci`
- [ ] `gstack`
- [ ] `gstack-upgrade`
- [ ] `guard`
- [ ] `hatch-pet`
- [ ] `health`
- [ ] `investigate`
- [ ] `ios-clean`
- [ ] `ios-design-review`
- [ ] `ios-fix`
- [ ] `ios-qa`
- [ ] `ios-sync`
- [ ] `land-and-deploy`
- [ ] `landing-report`
- [ ] `learn`
- [ ] `maestro-spec`
- [ ] `make-pdf`
- [ ] `office-hours`
- [ ] `open-gstack-browser`
- [ ] `pair-agent`
- [ ] `plan-ceo-review`
- [ ] `plan-design-review`
- [ ] `plan-devex-review`
- [ ] `plan-eng-review`
- [ ] `plan-tune`
- [ ] `qa`
- [ ] `qa-only`
- [ ] `retro`
- [ ] `review`
- [ ] `scrape`
- [ ] `setup-browser-cookies`
- [ ] `setup-deploy`
- [ ] `setup-gbrain`
- [ ] `ship`
- [ ] `skillify`
- [ ] `spec`
- [ ] `sync-gbrain`
- [ ] `unfreeze`

## Agent Skills

- [x] `agent-reach`
- [ ] `maestro-run`
- [ ] `maestro-spec`
- [x] `ui-ux-pro-max`

## Codex System Skills

System skills are platform-provided. Prefer `reference` unless you want local
notes, templates, or custom wrappers.

- [ ] `imagegen`
- [ ] `openai-docs`
- [ ] `plugin-creator`
- [ ] `skill-creator`
- [ ] `skill-installer`

## Plugins

- [ ] `browser` version `26.519.41501`
- [ ] `github` version `0.1.0`
- [ ] `hyperframes` version `0.1.0`
- [ ] `hyperframes` backup version `0.1.0`
- [ ] `documents` version `26.423.10653`
- [ ] `presentations` version `26.423.10653`
- [ ] `spreadsheets` version `26.423.10653`

## Plugin-Provided Skills

- [ ] `browser`
- [ ] `Chrome`
- [ ] `documents`
- [ ] `gh-address-comments`
- [ ] `gh-fix-ci`
- [ ] `github`
- [ ] `gsap`
- [ ] `hyperframes`
- [ ] `hyperframes-cli`
- [ ] `hyperframes-registry`
- [ ] `Presentations`
- [ ] `Spreadsheets`
- [ ] `website-to-hyperframes`
- [ ] `yeet`

## MCP Servers

Discovered from `C:\Users\xxloo\.codex\config.toml`. Only command shape was
recorded; environment values are intentionally ignored.

- [ ] `node_repl`: command points to Codex bundled `node_repl.exe`
- [x] `codegraph`: command `codegraph`, args `serve --mcp`

## Suggested Batches

### Batch 1: Personal Core

- `agency-code-review`
- `agency-codebase-onboarding`
- `agency-minimal-change-engineer`
- `agency-reality-checker`
- `agency-software-architect-review`
- `codegraph`

### Batch 2: Implementation And QA

- `investigate`
- `review`
- `qa`
- `qa-only`
- `ship`
- `gh-address-comments`
- `gh-fix-ci`

### Batch 3: Frontend And Design

- `design-taste-frontend`
- `frontend-design`
- `ui-ux-pro-max`
- `browse`
- `browser`

### Batch 4: Docs And Media

- `openai-docs`
- `imagegen`
- `documents`
- `presentations`
- `spreadsheets`
- `make-pdf`

### Batch 5: Large Platform Packs

- `gstack`
- `hyperframes`
- `maestro-*`
- `agent-reach`

For large packs, prefer storing a README, source path, version, and install
notes first. Copy full content only when you expect to customize it.
