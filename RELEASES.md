# Release history

Conifer ships signed, auto-updating builds for macOS, Windows, and Linux.
Installed apps update themselves — see a version below for what changed.

The newest build is always at
**[/releases/latest](https://github.com/ConiferKit/sage/releases/latest)**.

<!--
  Each release gets an entry here AND a GitHub Release with the installers
  attached. The release workflow (private build repo) generates the updater
  feed (latest.json) from the same version. Keep entries newest-first.

  Template:

  ## vX.Y.Z — YYYY-MM-DD
  **Platforms:** macOS (Apple silicon · Intel) · Windows · Linux
  ### Added
  - …
  ### Fixed
  - …
  ### Changed
  - …
-->

## v1.0.0 — 2026-06-01
**Platforms:** macOS (Apple silicon · Intel)
### Added
- First public Conifer desktop release — a local-AI studio (chat · agents ·
  code IDE · models) that runs entirely on your Mac. Nothing leaves the machine.
- Native Metal engine; a curated, machine-aware model catalog (your downloaded
  models lead the list); the kernel-enforced agent broker.
- Signed in-app auto-update: checks on launch, downloads in the background,
  applies on a restart you choose — never interrupts a running model or agent.
### Notes
- Windows / Linux builds and NVIDIA CUDA acceleration arrive as automatic
  updates — no reinstall.

## Unreleased

Cross-platform expansion of the first release is being prepared.

- **Added:** Windows (`.exe`/`.msi`) and Linux (`.AppImage`/`.deb`) builds
  alongside macOS, on the engine-lx Vulkan/CPU backend.
- **Added:** in-app updates (signed; checks on launch, downloads in the
  background, applies on a user-chosen restart — never interrupts a running
  model or agent).
- **Note:** NVIDIA CUDA acceleration on Windows/Linux will arrive as an
  automatic update — no reinstall.
