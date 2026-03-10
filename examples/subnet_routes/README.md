# Subnet Routes Example

This example demonstrates how to create a network and subnets with custom routing rules using the `terraform-openstack-network-module`.

It provisions a router and attaches a subnet that has specific `destination_cidr` and `next_hop` routes configured.

## Usage

To apply this example, run:

```bash
terraform init
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 3.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |

## Providers

No providers.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
