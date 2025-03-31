# otofu-modules
The Open Tofu (Terraform) to deploy an infrastructure required for an application deployment.

## Module list

- [backend](backend/README.md) - vm for the backend
- [dns_zone](dns_zone/README.md) - dns zone in GCP
- [function](function/README.md) - GCP function
- [lb](lb/README.md) - Load Balancer for Backend
- [postgres](postgres/README.md) - DB for Postgres
- [network](network/README.md) - a GCP network (for backend)


# Repository Technical info

Each module requires an extra Terraform Docs PreCommit hook. E.g.:
```
      - id: terraform-docs-go
        name: tfdocs - backend module
        args: ["backend"]
```

## Provider version

The precommit required to bump the provider version (potentially because there no version constrain).
To make it smoother, there is a script to update the version for all modules at once: `update-providers.zsh`.
