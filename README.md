# Dokku Homebrew Tap

This repository contains formulas to install Dokku-related tools through the [Homebrew](https://brew.sh) package manager.

See [docs/README.md](docs/README.md) for detailed installation and usage instructions.

## Quick Start

```bash
brew tap dokku/repo
brew install dokku/repo/dokku
```

## Formulas

Auto-updated:

- [dokku](/Formula/dokku.rb): Command-line client for the Dokku PaaS.
- [docker-container-healthchecker](/Formula/docker-container-healthchecker.rb): Runs healthchecks against local docker containers.
- [docker-orchestrate](/Formula/docker-orchestrate.rb): Docker plugin for orchestrating compose deploys.
- [docker-port-forward](/Formula/docker-port-forward.rb): Forward local ports to running Docker containers or Compose services.
- [docker-run-export](/Formula/docker-run-export.rb): Export docker run flags to various formats.
- [docket](/Formula/docket.rb): Pre-package and ship applications on Dokku.
- [lambda-builder](/Formula/lambda-builder.rb): A tool for building lambda function images or zips via Docker.
- [netrc](/Formula/netrc.rb): Utility that allows users to manage netrc files.
