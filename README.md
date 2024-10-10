# otofu-modules
Modules for Open Tofu (Terraform)

## Module list

- backend - vm for the backend
- dns_zone - dns zone in GCP
- lb - Load Balancer for Backend
- network - a GCP network (for backend)


# Repository Technical info

Each module requires an extra Terraform Docs PreCommit hook. E.g.:
```
      - id: terraform-docs-go
        name: tfdocs - backend module
        args: ["backend"]
```
