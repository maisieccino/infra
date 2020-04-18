# infrastructure

infrastructure configuration for my personal projects and servers.

runs on terraform cloud.

## project structure

modules live in the `modules/` directory.

`main.tf` is where providers and modules are called.

`dns.tf` represents DNS record configuration for the infrastructure.

`variables.tf` are for infra-wide variables.

### modules

-   `minecraft` - small minecraft server for use with friends.
