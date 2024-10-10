# otofu-modules
Modules for Open Tofu (Terraform)

## Module list

- backend - vm for the backend
- network - GCP network (for backend)


# Repository Technical info

Each module requires an extra Terraform Docs PreCommit hook. E.g.:
```
      - id: terraform-docs-go
        name: tfdocs - backend module
        args: ["backend"]
```
