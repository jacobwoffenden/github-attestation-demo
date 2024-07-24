# github-attestation-demo

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/jacobwoffenden/github-attestation-demo)

This repository contains example code for utilising [GitHub Artifact Attestations](https://docs.github.com/en/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)

[`.github/workflows/release.yml`](.github/workflows/release.yml) will:

- Build and push the image to GitHub Container Registry

  - <https://github.com/docker/build-push-action>

- Generate and publish an SBOM as a GitHub release artifact

  - <https://github.com/anchore/sbom-action>

- Attest the image and publish the attestation to GitHub's Artifact Attestations API

  - <https://github.com/actions/attest-build-provenance>

- Attest the SBOM and publish the attestation to GitHub's Artifact Attestations API

  - <https://github.com/actions/attest-sbom>

## Attestation Verification

```bash
$ gh attestation verify oci://ghcr.io/jacobwoffenden/github-attestation-demo:0.0.2 --repo jacobwoffenden/github-attestation-demo

Loaded digest sha256:9bdf1aa55c883efb642bc8448153844e46c5bd0c6d6f8ecfcb81acd33f24a1b7 for oci://ghcr.io/jacobwoffenden/github-attestation-demo:0.0.2
Loaded 2 attestations from GitHub API
✓ Verification succeeded!

sha256:9bdf1aa55c883efb642bc8448153844e46c5bd0c6d6f8ecfcb81acd33f24a1b7 was attested by:
REPO                                    PREDICATE_TYPE                  WORKFLOW
jacobwoffenden/github-attestation-demo  https://cyclonedx.org/bom       .github/workflows/release.yml@refs/tags/0.0.2
jacobwoffenden/github-attestation-demo  https://slsa.dev/provenance/v1  .github/workflows/release.yml@refs/tags/0.0.2
```
